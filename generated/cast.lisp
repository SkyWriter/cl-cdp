;;;; Cast CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/cast
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

(in-package #:cdp/cast)

(define-domain-type sink
  :cdp-id "Sink" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :session :type :string :ref nil :items nil :optional t :doc "Text describing the current session. Present only if there is an active session on the sink."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Cast.enable"
  :params (
        (:name :presentation-url :type :string :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "Starts observing for sinks that can be used for tab mirroring, and if set, sinks compatible with |presentationUrl| as well. When sinks are found, a |sinksUpdated| event is fired. Also starts observing for issue messages. When an issue is added or removed, an |issueUpdated| event is fired." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Cast.disable"
  :params nil
  :returns nil
  :doc "Stops observing for sinks and issues." :experimental nil :deprecated nil)

(define-domain-command set-sink-to-use
  :method "Cast.setSinkToUse"
  :params (
        (:name :sink-name :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Sets a sink to be used when the web page requests the browser to choose a sink via Presentation API, Remote Playback API, or Cast SDK." :experimental nil :deprecated nil)

(define-domain-command start-desktop-mirroring
  :method "Cast.startDesktopMirroring"
  :params (
        (:name :sink-name :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Starts mirroring the desktop to the sink." :experimental nil :deprecated nil)

(define-domain-command start-tab-mirroring
  :method "Cast.startTabMirroring"
  :params (
        (:name :sink-name :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Starts mirroring the tab to the sink." :experimental nil :deprecated nil)

(define-domain-command stop-casting
  :method "Cast.stopCasting"
  :params (
        (:name :sink-name :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Stops the active Cast session on the sink." :experimental nil :deprecated nil)

(define-domain-event sinks-updated
  :method "Cast.sinksUpdated"
  :params (
        (:name :sinks :type :array :ref nil :items (:type :ref :ref "Sink") :optional nil :doc ""))
  :doc "This is fired whenever the list of available sinks changes. A sink is a device or a software surface that you can cast to." :experimental nil :deprecated nil)

(define-domain-event issue-updated
  :method "Cast.issueUpdated"
  :params (
        (:name :issue-message :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "This is fired whenever the outstanding issue/error message changes. |issueMessage| is empty if there is no issue." :experimental nil :deprecated nil)

