;;;; BackgroundService CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/background-service
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/background-service)

(define-domain-type service-name
  :cdp-id "ServiceName" :type :string
  :properties nil
  :enum '("backgroundFetch" "backgroundSync" "pushMessaging" "notifications" "paymentHandler" "periodicBackgroundSync")
  :doc "The Background Service that will be associated with the commands/events. Every Background Service operates independently, but they share the same API." :experimental nil :deprecated nil)

(define-domain-type event-metadata
  :cdp-id "EventMetadata" :type :object
  :properties (
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "A key-value pair for additional event information to pass along." :experimental nil :deprecated nil)

(define-domain-type background-service-event
  :cdp-id "BackgroundServiceEvent" :type :object
  :properties (
        (:name :timestamp :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "Timestamp of the event (in seconds).")
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "The origin this event belongs to.")
        (:name :service-worker-registration-id :type :ref :ref "ServiceWorker.RegistrationID" :items nil :optional nil :doc "The Service Worker ID that initiated the event.")
        (:name :service :type :ref :ref "ServiceName" :items nil :optional nil :doc "The Background Service this event belongs to.")
        (:name :event-name :type :string :ref nil :items nil :optional nil :doc "A description of the event.")
        (:name :instance-id :type :string :ref nil :items nil :optional nil :doc "An identifier that groups related events together.")
        (:name :event-metadata :type :array :ref nil :items (:type :ref :ref "EventMetadata") :optional nil :doc "A list of event-specific information.")
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key this event belongs to."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command start-observing
  :method "BackgroundService.startObserving"
  :params (
        (:name :service :type :ref :ref "ServiceName" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Enables event updates for the service." :experimental nil :deprecated nil)

(define-domain-command stop-observing
  :method "BackgroundService.stopObserving"
  :params (
        (:name :service :type :ref :ref "ServiceName" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Disables event updates for the service." :experimental nil :deprecated nil)

(define-domain-command set-recording
  :method "BackgroundService.setRecording"
  :params (
        (:name :should-record :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :service :type :ref :ref "ServiceName" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Set the recording state for the service." :experimental nil :deprecated nil)

(define-domain-command clear-events
  :method "BackgroundService.clearEvents"
  :params (
        (:name :service :type :ref :ref "ServiceName" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Clears all stored data for the service." :experimental nil :deprecated nil)

(define-domain-event recording-state-changed
  :method "BackgroundService.recordingStateChanged"
  :params (
        (:name :is-recording :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :service :type :ref :ref "ServiceName" :items nil :optional nil :doc ""))
  :doc "Called when the recording state for the service has been updated." :experimental nil :deprecated nil)

(define-domain-event background-service-event-received
  :method "BackgroundService.backgroundServiceEventReceived"
  :params (
        (:name :background-service-event :type :ref :ref "BackgroundServiceEvent" :items nil :optional nil :doc ""))
  :doc "Called with all existing backgroundServiceEvents when enabled, and all new events afterwards if enabled and recording." :experimental nil :deprecated nil)

