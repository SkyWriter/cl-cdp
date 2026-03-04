;;;; Schema CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/schema
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/schema)

(define-domain-type domain
  :cdp-id "Domain" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Domain name.")
        (:name :version :type :string :ref nil :items nil :optional nil :doc "Domain version."))
  :enum nil
  :doc "Description of the protocol domain." :experimental nil :deprecated nil)

(define-domain-command get-domains
  :method "Schema.getDomains"
  :params nil
  :returns (
        (:name :domains :type :array :ref nil :items (:type :ref :ref "Domain") :optional nil :doc "List of supported domains."))
  :doc "Returns supported domains." :experimental nil :deprecated nil)

