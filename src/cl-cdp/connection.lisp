(in-package #:cdp)

;;;; Connection
;;
;; A CDP connection wraps a WebSocket to a running Chrome/Chromium process
;; started with --remote-debugging-port=<PORT>.
;;
;; Chrome exposes an HTTP endpoint at http://HOST:PORT/json listing available
;; targets (pages, workers, etc.) each with a webSocketDebuggerUrl.
;; Connect to one of those URLs to drive it.
;;
;; Message framing:
;;   -> { "id": <integer>, "method": "Domain.commandName", "params": {...} }
;;   <- { "id": <integer>, "result": {...} }           ; command response
;;   <- { "method": "Domain.eventName", "params": {...} } ; unsolicited event

(defvar *connection* nil
  "The default CDP connection used when none is supplied explicitly.")

;;; Conditions

(define-condition cdp-error (error)
  ((message :initarg :message :reader cdp-error-message))
  (:report (lambda (c s) (format s "CDP error: ~a" (cdp-error-message c)))))

(define-condition cdp-connection-error (cdp-error) ()
  (:report (lambda (c s)
             (format s "CDP connection error: ~a" (cdp-error-message c)))))

(define-condition cdp-command-error (cdp-error)
  ((code :initarg :code :reader cdp-error-code))
  (:report (lambda (c s)
             (format s "CDP command error ~a: ~a"
                     (cdp-error-code c) (cdp-error-message c)))))

;;; One-shot channel (no external dependency needed)
;; Uses a prefixed struct name to avoid clashing with any user-defined MAKE-CHANNEL.

(defstruct (%channel (:constructor %make-channel)
                     (:conc-name %channel-))
  (lock  (bt:make-lock "cdp-channel"))
  (cvar  (bt:make-condition-variable :name "cdp-channel"))
  (value nil)
  (ready nil))

(defun make-channel ()
  "Return a new one-shot synchronisation channel."
  (%make-channel))

(defun channel-send (ch val)
  "Deliver VAL to CH, unblocking any waiting CHANNEL-RECEIVE."
  (bt:with-lock-held ((%channel-lock ch))
    (setf (%channel-value ch) val
          (%channel-ready ch) t)
    (bt:condition-notify (%channel-cvar ch))))

(defun channel-receive (ch)
  "Block until a value has been delivered to CH, then return it."
  (bt:with-lock-held ((%channel-lock ch))
    (loop until (%channel-ready ch)
          do (bt:condition-wait (%channel-cvar ch) (%channel-lock ch)))
    (%channel-value ch)))

;;; Connection structure

(defstruct (connection (:constructor %make-connection))
  "Holds WebSocket state and bookkeeping for in-flight CDP commands."
  ws                        ; the underlying websocket-driver client object
  (next-id 1)               ; monotonically increasing message id
  (pending  (make-hash-table))                       ; id -> channel or callback
  (handlers (make-hash-table :test 'equal))          ; "Domain.event" -> list of fns
  (lock     (bt:make-lock "cdp-connection")))

;;; Target discovery

(defun list-targets (host port)
  (let* ((url  (format nil "http://~a:~a/json" host port))
         (body (dex:get url)))
    (map 'list #'cdp/impl::result-hash->plist
         (yason:parse body :object-as :hash-table))))

(defun first-page-url (host port)
  "Return the WebSocket URL of the first page-type target."
  (let ((target (find "page" (list-targets host port)
                      :key (lambda (tgt) (getf tgt :type))
                      :test #'string-equal)))
    (or (and target (getf target :web-socket-debugger-url))
        (error 'cdp-connection-error
               :message (format nil "No page target found at ~a:~a" host port)))))

;;; Connection lifecycle

(defun connect (ws-url)
  "Connect to CDP at WS-URL (e.g. ws://localhost:9222/devtools/page/xxx).
Returns a CONNECTION object. Set *CONNECTION* or pass it explicitly."
  (let* ((conn (%make-connection))
         (ws   (wsd:make-client ws-url)))
    (setf (connection-ws conn) ws)
    (wsd:on :message ws
            (lambda (raw)
              (%dispatch-message conn raw)))
    (wsd:on :error ws
            (lambda (err)
              (warn "CDP WebSocket error: ~a" err)))
    (wsd:start-connection ws)
    conn))

(defun disconnect (connection)
  "Close CONNECTION."
  (wsd:close-connection (connection-ws connection)))

(defmacro with-connection ((var ws-url) &body body)
  "Bind VAR to a new connection for WS-URL, run BODY, then disconnect."
  `(let ((,var (connect ,ws-url)))
     (unwind-protect
          (let ((*connection* ,var))
            ,@body)
       (disconnect ,var))))

;;; Sending commands

(defun send-command (connection method params)
  "Send CDP METHOD string (e.g. \"Page.navigate\") with PARAMS hash-table.
Blocks until the response arrives; returns the result as a plist.
Signals CDP-COMMAND-ERROR if Chrome returns an error object."
  (let* ((id  (bt:with-lock-held ((connection-lock connection))
                (prog1 (connection-next-id connection)
                  (incf (connection-next-id connection)))))
         (ch  (make-channel))
         (msg (let ((ht (make-hash-table :test 'equal)))
                (setf (gethash "id"     ht) id
                      (gethash "method" ht) method
                      (gethash "params" ht) (or params
                                                (make-hash-table :test 'equal)))
                ht)))
    (bt:with-lock-held ((connection-lock connection))
      (setf (gethash id (connection-pending connection)) ch))
    (wsd:send (connection-ws connection)
              (cdp/impl::encode-to-string msg))
    (let ((response (channel-receive ch)))
      (when (getf response :error)
        (let ((err (getf response :error)))
          (error 'cdp-command-error
                 :code    (getf err :code)
                 :message (getf err :message))))
      (getf response :result))))

(defun send-command-async (connection method params callback)
  "Like SEND-COMMAND but non-blocking.
CALLBACK is called as (funcall callback result error); exactly one will be nil."
  (let* ((id  (bt:with-lock-held ((connection-lock connection))
                (prog1 (connection-next-id connection)
                  (incf (connection-next-id connection)))))
         (msg (let ((ht (make-hash-table :test 'equal)))
                (setf (gethash "id"     ht) id
                      (gethash "method" ht) method
                      (gethash "params" ht) (or params
                                                (make-hash-table :test 'equal)))
                ht)))
    (bt:with-lock-held ((connection-lock connection))
      (setf (gethash id (connection-pending connection)) callback))
    (wsd:send (connection-ws connection)
              (cdp/impl::encode-to-string msg))))

;;; Event handling

(defun add-event-handler (connection event-method handler)
  "Register HANDLER (a function of one plist argument) for EVENT-METHOD string.
Returns HANDLER as a token for REMOVE-EVENT-HANDLER."
  (bt:with-lock-held ((connection-lock connection))
    (push handler (gethash event-method (connection-handlers connection))))
  handler)

(defun remove-event-handler (connection event-method handler)
  "Remove a previously registered HANDLER for EVENT-METHOD."
  (bt:with-lock-held ((connection-lock connection))
    (setf (gethash event-method (connection-handlers connection))
          (remove handler
                  (gethash event-method (connection-handlers connection))))))

(defmacro with-event-handler ((connection event-method params-var) &body body)
  "Register a handler for EVENT-METHOD for the dynamic extent of BODY.
PARAMS-VAR is bound to the event params plist inside each invocation.
Note: BODY is the handler body, not code to run while the handler is active —
use COLLECTING-EVENTS or WAIT-FOR-EVENT for that pattern."
  (let ((conn-var    (gensym "CONN"))
        (method-var  (gensym "METHOD"))
        (handler-var (gensym "HANDLER")))
    `(let* ((,conn-var   ,connection)
            (,method-var ,event-method)
            (,handler-var
              (add-event-handler ,conn-var ,method-var
                                 (lambda (,params-var) ,@body))))
       ,handler-var)))   ; returns the token; caller is responsible for cleanup

;;; Internal message dispatch

(defun %dispatch-message (connection raw-json)
  "Parse RAW-JSON and route to a pending command reply or event handlers."
  (let* ((msg    (cdp/impl::decode-string raw-json))
         (id     (gethash "id"     msg))
         (method (gethash "method" msg))
         (result (gethash "result" msg))
         (err    (gethash "error"  msg))
         (params (gethash "params" msg)))
    (cond
      ;; Command response (has an "id" field)
      (id
       (let ((waiter (bt:with-lock-held ((connection-lock connection))
                       (prog1 (gethash id (connection-pending connection))
                         (remhash id (connection-pending connection))))))
         (when waiter
           (let ((result-plist (cdp/impl::result-hash->plist
                                (or result (make-hash-table :test 'equal))))
                 (err-plist    (when err (cdp/impl::result-hash->plist err))))
             (etypecase waiter
               ;; Synchronous path — waiter is a channel
               (%channel
                (channel-send waiter
                              (if err-plist
                                  (list :error  err-plist)
                                  (list :result result-plist))))
               ;; Async path — waiter is a callback
               (function
                (funcall waiter
                         (unless err-plist result-plist)
                         err-plist)))))))
      ;; Unsolicited event (has "method" but no "id")
      (method
       (let ((handlers (bt:with-lock-held ((connection-lock connection))
                         (copy-list
                          (gethash method (connection-handlers connection))))))
         (let ((params-plist (cdp/impl::result-hash->plist
                              (or params (make-hash-table :test 'equal)))))
           (dolist (h handlers)
             (ignore-errors (funcall h params-plist)))))))))
