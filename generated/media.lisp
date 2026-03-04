;;;; Media CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/media
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

(in-package #:cdp/media)

(define-domain-type player-id
  :cdp-id "PlayerId" :type :string
  :properties nil
  :enum nil
  :doc "Players will get an ID that is unique within the agent context." :experimental nil :deprecated nil)

(define-domain-type timestamp
  :cdp-id "Timestamp" :type :number
  :properties nil
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type player-message
  :cdp-id "PlayerMessage" :type :object
  :properties (
        (:name :level :type :string :ref nil :items nil :optional nil :doc "Keep in sync with MediaLogMessageLevel We are currently keeping the message level 'error' separate from the PlayerError type because right now they represent different things, this one being a DVLOG(ERROR) style log message that gets printed based on what log level is selected in the UI, and the other is a representation of a media::PipelineStatus object. Soon however we're going to be moving away from using PipelineStatus for errors and introducing a new error type which should hopefully let us integrate the error log level into the PlayerError type.")
        (:name :message :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Have one type per entry in MediaLogRecord::Type Corresponds to kMessage" :experimental nil :deprecated nil)

(define-domain-type player-property
  :cdp-id "PlayerProperty" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Corresponds to kMediaPropertyChange" :experimental nil :deprecated nil)

(define-domain-type player-event
  :cdp-id "PlayerEvent" :type :object
  :properties (
        (:name :timestamp :type :ref :ref "Timestamp" :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Corresponds to kMediaEventTriggered" :experimental nil :deprecated nil)

(define-domain-type player-error-source-location
  :cdp-id "PlayerErrorSourceLocation" :type :object
  :properties (
        (:name :file :type :string :ref nil :items nil :optional nil :doc "")
        (:name :line :type :integer :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Represents logged source line numbers reported in an error. NOTE: file and line are from chromium c++ implementation code, not js." :experimental nil :deprecated nil)

(define-domain-type player-error
  :cdp-id "PlayerError" :type :object
  :properties (
        (:name :error-type :type :string :ref nil :items nil :optional nil :doc "")
        (:name :code :type :integer :ref nil :items nil :optional nil :doc "Code is the numeric enum entry for a specific set of error codes, such as PipelineStatusCodes in media/base/pipeline_status.h")
        (:name :stack :type :array :ref nil :items (:type :ref :ref "PlayerErrorSourceLocation") :optional nil :doc "A trace of where this error was caused / where it passed through.")
        (:name :cause :type :array :ref nil :items (:type :ref :ref "PlayerError") :optional nil :doc "Errors potentially have a root cause error, ie, a DecoderError might be caused by an WindowsError")
        (:name :data :type :object :ref nil :items nil :optional nil :doc "Extra data attached to an error, such as an HRESULT, Video Codec, etc."))
  :enum nil
  :doc "Corresponds to kMediaError" :experimental nil :deprecated nil)

(define-domain-type player
  :cdp-id "Player" :type :object
  :properties (
        (:name :player-id :type :ref :ref "PlayerId" :items nil :optional nil :doc "")
        (:name :dom-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Media.enable"
  :params nil
  :returns nil
  :doc "Enables the Media domain" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Media.disable"
  :params nil
  :returns nil
  :doc "Disables the Media domain." :experimental nil :deprecated nil)

(define-domain-event player-properties-changed
  :method "Media.playerPropertiesChanged"
  :params (
        (:name :player-id :type :ref :ref "PlayerId" :items nil :optional nil :doc "")
        (:name :properties :type :array :ref nil :items (:type :ref :ref "PlayerProperty") :optional nil :doc ""))
  :doc "This can be called multiple times, and can be used to set / override / remove player properties. A null propValue indicates removal." :experimental nil :deprecated nil)

(define-domain-event player-events-added
  :method "Media.playerEventsAdded"
  :params (
        (:name :player-id :type :ref :ref "PlayerId" :items nil :optional nil :doc "")
        (:name :events :type :array :ref nil :items (:type :ref :ref "PlayerEvent") :optional nil :doc ""))
  :doc "Send events as a list, allowing them to be batched on the browser for less congestion. If batched, events must ALWAYS be in chronological order." :experimental nil :deprecated nil)

(define-domain-event player-messages-logged
  :method "Media.playerMessagesLogged"
  :params (
        (:name :player-id :type :ref :ref "PlayerId" :items nil :optional nil :doc "")
        (:name :messages :type :array :ref nil :items (:type :ref :ref "PlayerMessage") :optional nil :doc ""))
  :doc "Send a list of any messages that need to be delivered." :experimental nil :deprecated nil)

(define-domain-event player-errors-raised
  :method "Media.playerErrorsRaised"
  :params (
        (:name :player-id :type :ref :ref "PlayerId" :items nil :optional nil :doc "")
        (:name :errors :type :array :ref nil :items (:type :ref :ref "PlayerError") :optional nil :doc ""))
  :doc "Send a list of any errors that need to be delivered." :experimental nil :deprecated nil)

(define-domain-event player-created
  :method "Media.playerCreated"
  :params (
        (:name :player :type :ref :ref "Player" :items nil :optional nil :doc ""))
  :doc "Called whenever a player is created, or when a new agent joins and receives a list of active players. If an agent is restored, it will receive one event for each active player." :experimental nil :deprecated nil)

