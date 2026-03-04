(defpackage #:cdp
  (:use #:cl)
  (:nicknames #:cl-cdp)
  (:export
   ;; Connection lifecycle
   #:connect
   #:disconnect
   #:with-connection
   #:connection-p
   ;; Target discovery
   #:list-targets
   #:first-page-url
   ;; Low-level send/receive
   #:send-command
   #:send-command-async
   ;; Event system
   #:add-event-handler
   #:remove-event-handler
   #:with-event-handler
   #:wait-for-event
   #:collecting-events
   ;; Condition types
   #:cdp-error
   #:cdp-connection-error
   #:cdp-command-error
   #:cdp-error-code
   #:cdp-error-message
   ;; Default connection
   #:*connection*
   ;; Sugar
   #:with-browser-tab
   #:navigate
   #:evaluate
   #:screenshot
   #:page-title
   #:page-url))

(defpackage #:cdp/impl
  (:use #:cl)
  (:export
   ;; Macros used by generated code
   #:define-domain-command
   #:define-domain-event
   #:define-domain-type
   ;; Helpers called from connection.lisp
   #:encode-to-string
   #:decode-string
   #:params->hash
   #:result-hash->plist))
