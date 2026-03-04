;;;; Tethering CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/tethering
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/tethering)

(define-domain-command bind
  :method "Tethering.bind"
  :params (
        (:name :port :type :integer :ref nil :items nil :optional nil :doc "Port number to bind."))
  :returns nil
  :doc "Request browser port binding." :experimental nil :deprecated nil)

(define-domain-command unbind
  :method "Tethering.unbind"
  :params (
        (:name :port :type :integer :ref nil :items nil :optional nil :doc "Port number to unbind."))
  :returns nil
  :doc "Request browser port unbinding." :experimental nil :deprecated nil)

(define-domain-event accepted
  :method "Tethering.accepted"
  :params (
        (:name :port :type :integer :ref nil :items nil :optional nil :doc "Port number that was successfully bound.")
        (:name :connection-id :type :string :ref nil :items nil :optional nil :doc "Connection id to be used."))
  :doc "Informs that port was successfully bound and got a specified connection id." :experimental nil :deprecated nil)

