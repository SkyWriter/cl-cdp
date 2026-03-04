;;;; Log CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/log
  (:use #:cl)
  (:shadow
    #:disable
    #:enable
  )
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/log)

(define-domain-type log-entry
  :cdp-id "LogEntry" :type :object
  :properties (
        (:name :source :type :string :ref nil :items nil :optional nil :doc "Log entry source.")
        (:name :level :type :string :ref nil :items nil :optional nil :doc "Log entry severity.")
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Logged text.")
        (:name :category :type :string :ref nil :items nil :optional t :doc "")
        (:name :timestamp :type :ref :ref "Runtime.Timestamp" :items nil :optional nil :doc "Timestamp when this entry was added.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "URL of the resource if known.")
        (:name :line-number :type :integer :ref nil :items nil :optional t :doc "Line number in the resource.")
        (:name :stack-trace :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "JavaScript stack trace.")
        (:name :network-request-id :type :ref :ref "Network.RequestId" :items nil :optional t :doc "Identifier of the network request associated with this entry.")
        (:name :worker-id :type :string :ref nil :items nil :optional t :doc "Identifier of the worker associated with this entry.")
        (:name :args :type :array :ref nil :items (:type :ref :ref "Runtime.RemoteObject") :optional t :doc "Call arguments."))
  :enum nil
  :doc "Log entry." :experimental nil :deprecated nil)

(define-domain-type violation-setting
  :cdp-id "ViolationSetting" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Violation type.")
        (:name :threshold :type :number :ref nil :items nil :optional nil :doc "Time threshold to trigger upon."))
  :enum nil
  :doc "Violation configuration setting." :experimental nil :deprecated nil)

(define-domain-command clear
  :method "Log.clear"
  :params nil
  :returns nil
  :doc "Clears the log." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Log.disable"
  :params nil
  :returns nil
  :doc "Disables log domain, prevents further log entries from being reported to the client." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Log.enable"
  :params nil
  :returns nil
  :doc "Enables log domain, sends the entries collected so far to the client by means of the `entryAdded` notification." :experimental nil :deprecated nil)

(define-domain-command start-violations-report
  :method "Log.startViolationsReport"
  :params (
        (:name :config :type :array :ref nil :items (:type :ref :ref "ViolationSetting") :optional nil :doc "Configuration for violations."))
  :returns nil
  :doc "start violation reporting." :experimental nil :deprecated nil)

(define-domain-command stop-violations-report
  :method "Log.stopViolationsReport"
  :params nil
  :returns nil
  :doc "Stop violation reporting." :experimental nil :deprecated nil)

(define-domain-event entry-added
  :method "Log.entryAdded"
  :params (
        (:name :entry :type :ref :ref "LogEntry" :items nil :optional nil :doc "The entry."))
  :doc "Issued when new message was logged." :experimental nil :deprecated nil)

