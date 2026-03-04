;;;; PerformanceTimeline CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/performance-timeline
  (:use #:cl)
  (:shadow
    #:enable
  )
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/performance-timeline)

(define-domain-type largest-contentful-paint
  :cdp-id "LargestContentfulPaint" :type :object
  :properties (
        (:name :render-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "")
        (:name :load-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "")
        (:name :size :type :number :ref nil :items nil :optional nil :doc "The number of pixels being painted.")
        (:name :element-id :type :string :ref nil :items nil :optional t :doc "The id attribute of the element, if available.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "The URL of the image (may be trimmed).")
        (:name :node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc ""))
  :enum nil
  :doc "See https://github.com/WICG/LargestContentfulPaint and largest_contentful_paint.idl" :experimental nil :deprecated nil)

(define-domain-type layout-shift-attribution
  :cdp-id "LayoutShiftAttribution" :type :object
  :properties (
        (:name :previous-rect :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "")
        (:name :current-rect :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "")
        (:name :node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type layout-shift
  :cdp-id "LayoutShift" :type :object
  :properties (
        (:name :value :type :number :ref nil :items nil :optional nil :doc "Score increment produced by this event.")
        (:name :had-recent-input :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :last-input-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "")
        (:name :sources :type :array :ref nil :items (:type :ref :ref "LayoutShiftAttribution") :optional nil :doc ""))
  :enum nil
  :doc "See https://wicg.github.io/layout-instability/#sec-layout-shift and layout_shift.idl" :experimental nil :deprecated nil)

(define-domain-type timeline-event
  :cdp-id "TimelineEvent" :type :object
  :properties (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "Identifies the frame that this event is related to. Empty for non-frame targets.")
        (:name :type :type :string :ref nil :items nil :optional nil :doc "The event type, as specified in https://w3c.github.io/performance-timeline/#dom-performanceentry-entrytype This determines which of the optional \"details\" fields is present.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Name may be empty depending on the type.")
        (:name :time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "Time in seconds since Epoch, monotonically increasing within document lifetime.")
        (:name :duration :type :number :ref nil :items nil :optional t :doc "Event duration, if applicable.")
        (:name :lcp-details :type :ref :ref "LargestContentfulPaint" :items nil :optional t :doc "")
        (:name :layout-shift-details :type :ref :ref "LayoutShift" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "PerformanceTimeline.enable"
  :params (
        (:name :event-types :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "The types of event to report, as specified in https://w3c.github.io/performance-timeline/#dom-performanceentry-entrytype The specified filter overrides any previous filters, passing empty filter disables recording. Note that not all types exposed to the web platform are currently supported."))
  :returns nil
  :doc "Previously buffered events would be reported before method returns. See also: timelineEventAdded" :experimental nil :deprecated nil)

(define-domain-event timeline-event-added
  :method "PerformanceTimeline.timelineEventAdded"
  :params (
        (:name :event :type :ref :ref "TimelineEvent" :items nil :optional nil :doc ""))
  :doc "Sent when a performance timeline event is added. See reportPerformanceTimeline method." :experimental nil :deprecated nil)

