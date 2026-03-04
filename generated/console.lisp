;;;; Console CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/console
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

(in-package #:cdp/console)

(define-domain-type console-message
  :cdp-id "ConsoleMessage" :type :object
  :properties (
        (:name :source :type :string :ref nil :items nil :optional nil :doc "Message source.")
        (:name :level :type :string :ref nil :items nil :optional nil :doc "Message severity.")
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Message text.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "URL of the message origin.")
        (:name :line :type :integer :ref nil :items nil :optional t :doc "Line number in the resource that generated this message (1-based).")
        (:name :column :type :integer :ref nil :items nil :optional t :doc "Column number in the resource that generated this message (1-based)."))
  :enum nil
  :doc "Console message." :experimental nil :deprecated nil)

(define-domain-command clear-messages
  :method "Console.clearMessages"
  :params nil
  :returns nil
  :doc "Does nothing." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Console.disable"
  :params nil
  :returns nil
  :doc "Disables console domain, prevents further console messages from being reported to the client." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Console.enable"
  :params nil
  :returns nil
  :doc "Enables console domain, sends the messages collected so far to the client by means of the `messageAdded` notification." :experimental nil :deprecated nil)

(define-domain-event message-added
  :method "Console.messageAdded"
  :params (
        (:name :message :type :ref :ref "ConsoleMessage" :items nil :optional nil :doc "Console message that has been added."))
  :doc "Issued when new console message is added." :experimental nil :deprecated nil)

