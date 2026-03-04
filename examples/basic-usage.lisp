;;;; cl-cdp examples
;;;;
;;;; Run Chrome first:
;;;;   google-chrome --remote-debugging-port=9222 --headless=new
;;;;
;;;; Then from your REPL:
;;;;   (ql:quickload :cl-cdp)
;;;;   (load "examples/basic-usage.lisp")

(defpackage #:cdp/examples
  (:use #:cl #:cdp))

(in-package #:cdp/examples)

;;; ── Example 1: Navigate and get page title ────────────────────────────────

(defun get-page-title (url &key (host "localhost") (port 9222))
  "Navigate to URL and return the page title."
  (with-browser-tab (conn :host host :port port)
    (navigate url)
    (page-title)))

;;; ── Example 2: Capture a screenshot ──────────────────────────────────────

(defun take-screenshot (url output-path &key (host "localhost") (port 9222))
  "Navigate to URL and save a PNG screenshot to OUTPUT-PATH."
  (with-browser-tab (conn :host host :port port)
    (navigate url)
    (let ((bytes (screenshot :format "png")))
      (with-open-file (f output-path :direction :output
                                     :element-type '(unsigned-byte 8)
                                     :if-exists :supersede)
        (write-sequence bytes f))
      output-path)))

;;; ── Example 3: Intercept network requests ────────────────────────────────

(defun log-requests (url &key (host "localhost") (port 9222) (timeout 10))
  "Navigate to URL and print all network requests made."
  (with-browser-tab (conn :host host :port port :enable '(cdp/network:enable))
    (collecting-events (conn "Network.requestWillBeSent" reqs)
      (navigate url :timeout timeout)
      (format t "~%Requests captured: ~a~%" (length reqs))
      (dolist (req (nreverse reqs))
        (format t "  ~a ~a~%"
                (getf (getf req :request) :method)
                (getf (getf req :request) :url))))))

;;; ── Example 4: Execute JavaScript ────────────────────────────────────────

(defun eval-js (expression &key (host "localhost") (port 9222))
  "Evaluate EXPRESSION in the page context and return the result value."
  (with-browser-tab (conn :host host :port port)
    (getf (getf (evaluate expression) :result) :value)))

;;; ── Example 5: Multi-target / new tab ────────────────────────────────────

(defun open-new-tab (url &key (host "localhost") (port 9222))
  "Open URL in a new tab and return its target-id."
  (let* ((info        (yason:parse
                       (dex:get (format nil "http://~a:~a/json/version"
                                        host port))))
         (browser-url (gethash "webSocketDebuggerUrl" info)))
    (with-connection (conn browser-url)
      (getf (cdp/target:create-target :url url) :target-id))))
