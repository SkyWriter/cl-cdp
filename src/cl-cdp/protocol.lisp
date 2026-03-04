(in-package #:cdp/impl)

(defmacro define-domain-command (name &key method params returns doc
                                           experimental deprecated)
  (declare (ignore returns experimental deprecated))
  (let ((param-syms (mapcar (lambda (p)
                              (intern (symbol-name (getf p :name))))
                            params)))
    `(progn
       (defun ,name (&key ,@param-syms (connection cdp:*connection*))
         ,doc
         (cdp:send-command connection ,method
                           (cdp/impl::params->hash
                            (list ,@(loop for s in param-syms
                                          collect (intern (symbol-name s) :keyword)
                                          collect s)))))
       (export ',name *package*))))

(defmacro define-domain-event (name &key method params doc
                                         experimental deprecated)
  (declare (ignore params experimental deprecated))
  (let ((const-name  (intern (concatenate 'string "+" (symbol-name name) "+")))
        (helper-name (intern (concatenate 'string "ON-" (symbol-name name)))))
    `(progn
       ;; alexandria:define-constant or the unless-bound pattern avoids
       ;; SBCL's strict defconstant error on reload with equal values.
       (unless (boundp ',const-name)
         (defconstant ,const-name ,method
           ,(format nil "CDP method string for the ~a event." name)))
       (defun ,helper-name (handler &key (connection cdp:*connection*))
         ,(concatenate 'string (or doc "")
                       (format nil "~%~%Register HANDLER for ~a. Returns the handler token." method))
         (cdp:add-event-handler connection ,method handler))
       (export ',const-name  *package*)
       (export ',helper-name *package*))))

(defmacro define-domain-type (name &key cdp-id type properties enum doc
                                        experimental deprecated)
  (declare (ignore cdp-id type properties enum experimental deprecated))
  `(values ',name ,(or doc "")))
