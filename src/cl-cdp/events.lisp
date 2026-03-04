(in-package #:cdp)

;;;; High-level event helpers

(defun wait-for-event (connection event-method &key (timeout 30))
  "Block until EVENT-METHOD fires on CONNECTION, returning the params plist.
Signals CDP-ERROR if TIMEOUT seconds elapse without the event firing."
  (let ((ch      (make-channel))
        (handler nil))
    (setf handler
          (add-event-handler connection event-method
                             (lambda (params)
                               (remove-event-handler connection event-method handler)
                               (channel-send ch params))))
    (handler-case
        (bt:with-timeout (timeout)
          (channel-receive ch))
      (bt:timeout ()
        (remove-event-handler connection event-method handler)
        (error 'cdp-error
               :message (format nil "Timed out waiting ~as for ~a"
                                 timeout event-method))))))

(defmacro collecting-events ((connection event-method results-var) &body body)
  "Execute BODY while collecting all occurrences of EVENT-METHOD.
RESULTS-VAR is bound to a list of params plists (most recent first) after BODY."
  (let ((conn-v    (gensym "CONN"))
        (event-v   (gensym "EVENT"))
        (lock-v    (gensym "LOCK"))
        (handler-v (gensym "HANDLER")))
    `(let* ((,conn-v  ,connection)
            (,event-v ,event-method)
            (,results-var '())
            (,lock-v (bt:make-lock "collecting-events"))
            (,handler-v
              (add-event-handler ,conn-v ,event-v
                                 (lambda (params)
                                   (bt:with-lock-held (,lock-v)
                                     (push params ,results-var))))))
       (unwind-protect
            (progn ,@body)
         (remove-event-handler ,conn-v ,event-v ,handler-v)))))
