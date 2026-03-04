(in-package #:cdp/impl)

;;;; Naming conventions
;;
;; CDP uses camelCase names like "networkConditions", "getDocument".
;; We convert to hyphenated lowercase: "network-conditions", "get-document".
;; Acronyms are preserved correctly: "DOMStorage" -> "dom-storage", "CSS" -> "css".
;;
;; Domain names map to dedicated packages: cdp/network, cdp/dom, etc.

(defun camel->lisp (name)
  "Convert camelCase or PascalCase NAME to hyphenated-lower-case.
Handles acronym runs correctly: DOMStorage -> dom-storage, CSS -> css."
  (let ((s (cl-ppcre:regex-replace-all "([a-z0-9])([A-Z])" name "\\1-\\2")))
    (string-downcase
     (cl-ppcre:regex-replace-all "([A-Z]+)([A-Z][a-z])" s "\\1-\\2"))))

(defun lisp->camel (name)
  "Convert HYPHENATED-NAME string to camelCase for use as a JSON key."
  (let ((parts (split-sequence:split-sequence #\- (string-downcase name)
                                              :remove-empty-subseqs t)))
    (apply #'concatenate 'string
           (car parts)
           (mapcar #'string-capitalize (cdr parts)))))

;;; JSON helpers

(defun encode-to-string (object)
  "Encode OBJECT (hash-table, number, string, etc.) to a JSON string."
  (with-output-to-string (s)
    (yason:encode object s)))

(defun decode-string (json-string)
  "Decode JSON-STRING; objects become hash-tables with string keys."
  (yason:parse json-string :object-as :hash-table :object-key-fn #'identity))

(defun keyword-from-cdp (cdp-key-string)
  "Convert a CDP camelCase key string to a Lisp keyword.
E.g. \"requestId\" -> :REQUEST-ID"
  (intern (string-upcase (camel->lisp cdp-key-string)) :keyword))

(defun params->hash (plist)
  "Convert a plist of (:lisp-name value ...) pairs to a hash-table with
camelCase string keys, suitable for JSON encoding.  NIL values are omitted
so that optional parameters not supplied by the caller are absent from the
JSON payload."
  (let ((ht (make-hash-table :test 'equal)))
    (loop for (k v) on plist by #'cddr
          when (not (null v))
            do (setf (gethash (lisp->camel (symbol-name k)) ht) v))
    ht))

(defun result-hash->plist (value)
  "Recursively convert hash-tables from JSON decode to keyword plists. Vectors become lists."
  (cond
    ((hash-table-p value)
     (loop for k being the hash-keys of value using (hash-value v)
           nconc (list (keyword-from-cdp k) (result-hash->plist v))))
    ((and (vectorp value) (not (stringp value)))
     (map 'list #'result-hash->plist value))
    (t value)))
