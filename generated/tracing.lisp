;;;; Tracing CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/tracing
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/tracing)

(define-domain-type memory-dump-config
  :cdp-id "MemoryDumpConfig" :type :object
  :properties nil
  :enum nil
  :doc "Configuration for memory dump. Used only when \"memory-infra\" category is enabled." :experimental t :deprecated nil)

(define-domain-type trace-config
  :cdp-id "TraceConfig" :type :object
  :properties (
        (:name :record-mode :type :string :ref nil :items nil :optional t :doc "Controls how the trace buffer stores data. The default is `recordUntilFull`.")
        (:name :trace-buffer-size-in-kb :type :number :ref nil :items nil :optional t :doc "Size of the trace buffer in kilobytes. If not specified or zero is passed, a default value of 200 MB would be used.")
        (:name :enable-sampling :type :boolean :ref nil :items nil :optional t :doc "Turns on JavaScript stack sampling.")
        (:name :enable-systrace :type :boolean :ref nil :items nil :optional t :doc "Turns on system tracing.")
        (:name :enable-argument-filter :type :boolean :ref nil :items nil :optional t :doc "Turns on argument filter.")
        (:name :included-categories :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Included category filters.")
        (:name :excluded-categories :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Excluded category filters.")
        (:name :synthetic-delays :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Configuration to synthesize the delays in tracing.")
        (:name :memory-dump-config :type :ref :ref "MemoryDumpConfig" :items nil :optional t :doc "Configuration for memory dump triggers. Used only when \"memory-infra\" category is enabled."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type stream-format
  :cdp-id "StreamFormat" :type :string
  :properties nil
  :enum '("json" "proto")
  :doc "Data format of a trace. Can be either the legacy JSON format or the protocol buffer format. Note that the JSON format will be deprecated soon." :experimental t :deprecated nil)

(define-domain-type stream-compression
  :cdp-id "StreamCompression" :type :string
  :properties nil
  :enum '("none" "gzip")
  :doc "Compression type to use for traces returned via streams." :experimental t :deprecated nil)

(define-domain-type memory-dump-level-of-detail
  :cdp-id "MemoryDumpLevelOfDetail" :type :string
  :properties nil
  :enum '("background" "light" "detailed")
  :doc "Details exposed when memory request explicitly declared. Keep consistent with memory_dump_request_args.h and memory_instrumentation.mojom" :experimental t :deprecated nil)

(define-domain-type tracing-backend
  :cdp-id "TracingBackend" :type :string
  :properties nil
  :enum '("auto" "chrome" "system")
  :doc "Backend type to use for tracing. `chrome` uses the Chrome-integrated tracing service and is supported on all platforms. `system` is only supported on Chrome OS and uses the Perfetto system tracing service. `auto` chooses `system` when the perfettoConfig provided to Tracing.start specifies at least one non-Chrome data source; otherwise uses `chrome`." :experimental t :deprecated nil)

(define-domain-command end
  :method "Tracing.end"
  :params nil
  :returns nil
  :doc "Stop trace events collection." :experimental nil :deprecated nil)

(define-domain-command get-categories
  :method "Tracing.getCategories"
  :params nil
  :returns (
        (:name :categories :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "A list of supported tracing categories."))
  :doc "Gets supported tracing categories." :experimental t :deprecated nil)

(define-domain-command get-track-event-descriptor
  :method "Tracing.getTrackEventDescriptor"
  :params nil
  :returns (
        (:name :descriptor :type :string :ref nil :items nil :optional nil :doc "Base64-encoded serialized perfetto.protos.TrackEventDescriptor protobuf message. (Encoded as a base64 string when passed over JSON)"))
  :doc "Return a descriptor for all available tracing categories." :experimental t :deprecated nil)

(define-domain-command record-clock-sync-marker
  :method "Tracing.recordClockSyncMarker"
  :params (
        (:name :sync-id :type :string :ref nil :items nil :optional nil :doc "The ID of this clock sync marker"))
  :returns nil
  :doc "Record a clock sync marker in the trace." :experimental t :deprecated nil)

(define-domain-command request-memory-dump
  :method "Tracing.requestMemoryDump"
  :params (
        (:name :deterministic :type :boolean :ref nil :items nil :optional t :doc "Enables more deterministic results by forcing garbage collection")
        (:name :level-of-detail :type :ref :ref "MemoryDumpLevelOfDetail" :items nil :optional t :doc "Specifies level of details in memory dump. Defaults to \"detailed\"."))
  :returns (
        (:name :dump-guid :type :string :ref nil :items nil :optional nil :doc "GUID of the resulting global memory dump.")
        (:name :success :type :boolean :ref nil :items nil :optional nil :doc "True iff the global memory dump succeeded."))
  :doc "Request a global memory dump." :experimental t :deprecated nil)

(define-domain-command start
  :method "Tracing.start"
  :params (
        (:name :categories :type :string :ref nil :items nil :optional t :doc "Category/tag filter")
        (:name :options :type :string :ref nil :items nil :optional t :doc "Tracing options")
        (:name :buffer-usage-reporting-interval :type :number :ref nil :items nil :optional t :doc "If set, the agent will issue bufferUsage events at this interval, specified in milliseconds")
        (:name :transfer-mode :type :string :ref nil :items nil :optional t :doc "Whether to report trace events as series of dataCollected events or to save trace to a stream (defaults to `ReportEvents`).")
        (:name :stream-format :type :ref :ref "StreamFormat" :items nil :optional t :doc "Trace data format to use. This only applies when using `ReturnAsStream` transfer mode (defaults to `json`).")
        (:name :stream-compression :type :ref :ref "StreamCompression" :items nil :optional t :doc "Compression format to use. This only applies when using `ReturnAsStream` transfer mode (defaults to `none`)")
        (:name :trace-config :type :ref :ref "TraceConfig" :items nil :optional t :doc "")
        (:name :perfetto-config :type :string :ref nil :items nil :optional t :doc "Base64-encoded serialized perfetto.protos.TraceConfig protobuf message When specified, the parameters `categories`, `options`, `traceConfig` are ignored. (Encoded as a base64 string when passed over JSON)")
        (:name :tracing-backend :type :ref :ref "TracingBackend" :items nil :optional t :doc "Backend type (defaults to `auto`)"))
  :returns nil
  :doc "Start trace events collection." :experimental nil :deprecated nil)

(define-domain-event buffer-usage
  :method "Tracing.bufferUsage"
  :params (
        (:name :percent-full :type :number :ref nil :items nil :optional t :doc "A number in range [0..1] that indicates the used size of event buffer as a fraction of its total size.")
        (:name :event-count :type :number :ref nil :items nil :optional t :doc "An approximate number of events in the trace log.")
        (:name :value :type :number :ref nil :items nil :optional t :doc "A number in range [0..1] that indicates the used size of event buffer as a fraction of its total size."))
  :doc "" :experimental t :deprecated nil)

(define-domain-event data-collected
  :method "Tracing.dataCollected"
  :params (
        (:name :value :type :array :ref nil :items (:type :object :ref nil) :optional nil :doc ""))
  :doc "Contains a bucket of collected trace events. When tracing is stopped collected events will be sent as a sequence of dataCollected events followed by tracingComplete event." :experimental t :deprecated nil)

(define-domain-event tracing-complete
  :method "Tracing.tracingComplete"
  :params (
        (:name :data-loss-occurred :type :boolean :ref nil :items nil :optional nil :doc "Indicates whether some trace data is known to have been lost, e.g. because the trace ring buffer wrapped around.")
        (:name :stream :type :ref :ref "IO.StreamHandle" :items nil :optional t :doc "A handle of the stream that holds resulting trace data.")
        (:name :trace-format :type :ref :ref "StreamFormat" :items nil :optional t :doc "Trace data format of returned stream.")
        (:name :stream-compression :type :ref :ref "StreamCompression" :items nil :optional t :doc "Compression format of returned stream."))
  :doc "Signals that tracing is stopped and there is no trace buffers pending flush, all data were delivered via dataCollected events." :experimental nil :deprecated nil)

