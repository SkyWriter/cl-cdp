(in-package #:cdp)

;;;; High-level convenience layer
;;
;; Everything here is optional syntactic sugar built on top of the core API.
;; The underlying primitives (connect, disconnect, send-command, etc.) remain
;; fully usable without any of this.

(defmacro with-browser-tab ((conn &key (host "localhost")
                                    (port 9222)
                                    (enable '()))
                            &body body)
  "Connect to the first available page target, enable CDP domains, run BODY,
then disconnect — returning the value of the last form in BODY.

CONN is bound to the active connection and *CONNECTION* is set to it, so
domain functions can be called without an explicit :CONNECTION argument.

Page and Runtime are always enabled. ENABLE appends additional domain
enable functions on top of those defaults, e.g.:

  (with-browser-tab ((conn :enable '(cdp/network:enable cdp/dom:enable)))
    (cdp/network:get-all-cookies))

HOST and PORT default to localhost:9222."
  `(cdp:with-connection (,conn (cdp:first-page-url ,host ,port))
     (cdp/page:enable)
     (cdp/runtime:enable)
     (dolist (fn ,enable)
       (funcall (symbol-function fn)))
     ,@body))

(defun evaluate (expression &key (return-by-value t) await)
  "Evaluate EXPRESSION (a JavaScript string) in the page context.
Returns the result plist from Runtime.evaluate.
RETURN-BY-VALUE t (default) returns a JSON-serialisable value directly.
AWAIT t wraps the expression in an immediately-invoked async function so
you can use top-level await."
  (let ((expr (if await
                  (format nil "(async () => { return (~a); })()" expression)
                  expression)))
    (cdp/runtime:evaluate :expression expr
                          :return-by-value return-by-value)))

(defun navigate (url &key (timeout 30))
  "Navigate to URL and block until Page.loadEventFired or TIMEOUT seconds."
  (cdp/page:navigate :url url)
  (cdp:wait-for-event cdp:*connection* "Page.loadEventFired" :timeout timeout))

(defun screenshot (&key (format "png") (quality 80) full-page)
  "Capture a screenshot, returning the raw image bytes (usb8-array).
FORMAT is 'png' or 'jpeg'. QUALITY applies to jpeg. FULL-PAGE t captures
the full scrollable page rather than just the visible viewport."
  (let* ((result (cdp/page:capture-screenshot
                  :format format
                  :quality (when (string= format "jpeg") quality)
                  :capture-beyond-viewport full-page))
         (b64 (getf result :data)))
    (cl-base64:base64-string-to-usb8-array b64)))

(defun page-title ()
  "Return the current page title as a string."
  (let ((result (cdp/runtime:evaluate
                 :expression "document.title"
                 :return-by-value t)))
    (getf (getf result :result) :value)))

(defun page-url ()
  "Return the current page URL as a string."
  (let ((result (cdp/runtime:evaluate
                 :expression "window.location.href"
                 :return-by-value t)))
    (getf (getf result :result) :value)))
