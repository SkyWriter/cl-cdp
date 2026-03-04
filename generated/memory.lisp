;;;; Memory CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/memory
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/memory)

(define-domain-type pressure-level
  :cdp-id "PressureLevel" :type :string
  :properties nil
  :enum '("moderate" "critical")
  :doc "Memory pressure level." :experimental nil :deprecated nil)

(define-domain-type sampling-profile-node
  :cdp-id "SamplingProfileNode" :type :object
  :properties (
        (:name :size :type :number :ref nil :items nil :optional nil :doc "Size of the sampled allocation.")
        (:name :total :type :number :ref nil :items nil :optional nil :doc "Total bytes attributed to this sample.")
        (:name :stack :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Execution stack at the point of allocation."))
  :enum nil
  :doc "Heap profile sample." :experimental nil :deprecated nil)

(define-domain-type sampling-profile
  :cdp-id "SamplingProfile" :type :object
  :properties (
        (:name :samples :type :array :ref nil :items (:type :ref :ref "SamplingProfileNode") :optional nil :doc "")
        (:name :modules :type :array :ref nil :items (:type :ref :ref "Module") :optional nil :doc ""))
  :enum nil
  :doc "Array of heap profile samples." :experimental nil :deprecated nil)

(define-domain-type module
  :cdp-id "Module" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Name of the module.")
        (:name :uuid :type :string :ref nil :items nil :optional nil :doc "UUID of the module.")
        (:name :base-address :type :string :ref nil :items nil :optional nil :doc "Base address where the module is loaded into memory. Encoded as a decimal or hexadecimal (0x prefixed) string.")
        (:name :size :type :number :ref nil :items nil :optional nil :doc "Size of the module in bytes."))
  :enum nil
  :doc "Executable module information" :experimental nil :deprecated nil)

(define-domain-type dom-counter
  :cdp-id "DOMCounter" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Object name. Note: object names should be presumed volatile and clients should not expect the returned names to be consistent across runs.")
        (:name :count :type :integer :ref nil :items nil :optional nil :doc "Object count."))
  :enum nil
  :doc "DOM object counter data." :experimental nil :deprecated nil)

(define-domain-command get-dom-counters
  :method "Memory.getDOMCounters"
  :params nil
  :returns (
        (:name :documents :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :nodes :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :js-event-listeners :type :integer :ref nil :items nil :optional nil :doc ""))
  :doc "Retruns current DOM object counters." :experimental nil :deprecated nil)

(define-domain-command get-dom-counters-for-leak-detection
  :method "Memory.getDOMCountersForLeakDetection"
  :params nil
  :returns (
        (:name :counters :type :array :ref nil :items (:type :ref :ref "DOMCounter") :optional nil :doc "DOM object counters."))
  :doc "Retruns DOM object counters after preparing renderer for leak detection." :experimental nil :deprecated nil)

(define-domain-command prepare-for-leak-detection
  :method "Memory.prepareForLeakDetection"
  :params nil
  :returns nil
  :doc "Prepares for leak detection by terminating workers, stopping spellcheckers, dropping non-essential internal caches, running garbage collections, etc." :experimental nil :deprecated nil)

(define-domain-command forcibly-purge-java-script-memory
  :method "Memory.forciblyPurgeJavaScriptMemory"
  :params nil
  :returns nil
  :doc "Simulate OomIntervention by purging V8 memory." :experimental nil :deprecated nil)

(define-domain-command set-pressure-notifications-suppressed
  :method "Memory.setPressureNotificationsSuppressed"
  :params (
        (:name :suppressed :type :boolean :ref nil :items nil :optional nil :doc "If true, memory pressure notifications will be suppressed."))
  :returns nil
  :doc "Enable/disable suppressing memory pressure notifications in all processes." :experimental nil :deprecated nil)

(define-domain-command simulate-pressure-notification
  :method "Memory.simulatePressureNotification"
  :params (
        (:name :level :type :ref :ref "PressureLevel" :items nil :optional nil :doc "Memory pressure level of the notification."))
  :returns nil
  :doc "Simulate a memory pressure notification in all processes." :experimental nil :deprecated nil)

(define-domain-command start-sampling
  :method "Memory.startSampling"
  :params (
        (:name :sampling-interval :type :integer :ref nil :items nil :optional t :doc "Average number of bytes between samples.")
        (:name :suppress-randomness :type :boolean :ref nil :items nil :optional t :doc "Do not randomize intervals between samples."))
  :returns nil
  :doc "Start collecting native memory profile." :experimental nil :deprecated nil)

(define-domain-command stop-sampling
  :method "Memory.stopSampling"
  :params nil
  :returns nil
  :doc "Stop collecting native memory profile." :experimental nil :deprecated nil)

(define-domain-command get-all-time-sampling-profile
  :method "Memory.getAllTimeSamplingProfile"
  :params nil
  :returns (
        (:name :profile :type :ref :ref "SamplingProfile" :items nil :optional nil :doc ""))
  :doc "Retrieve native memory allocations profile collected since renderer process startup." :experimental nil :deprecated nil)

(define-domain-command get-browser-sampling-profile
  :method "Memory.getBrowserSamplingProfile"
  :params nil
  :returns (
        (:name :profile :type :ref :ref "SamplingProfile" :items nil :optional nil :doc ""))
  :doc "Retrieve native memory allocations profile collected since browser process startup." :experimental nil :deprecated nil)

(define-domain-command get-sampling-profile
  :method "Memory.getSamplingProfile"
  :params nil
  :returns (
        (:name :profile :type :ref :ref "SamplingProfile" :items nil :optional nil :doc ""))
  :doc "Retrieve native memory allocations profile collected since last `startSampling` call." :experimental nil :deprecated nil)

