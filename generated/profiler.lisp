;;;; Profiler CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/profiler
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

(in-package #:cdp/profiler)

(define-domain-type profile-node
  :cdp-id "ProfileNode" :type :object
  :properties (
        (:name :id :type :integer :ref nil :items nil :optional nil :doc "Unique id of the node.")
        (:name :call-frame :type :ref :ref "Runtime.CallFrame" :items nil :optional nil :doc "Function location.")
        (:name :hit-count :type :integer :ref nil :items nil :optional t :doc "Number of samples where this node was on top of the call stack.")
        (:name :children :type :array :ref nil :items (:type :integer :ref nil) :optional t :doc "Child node ids.")
        (:name :deopt-reason :type :string :ref nil :items nil :optional t :doc "The reason of being not optimized. The function may be deoptimized or marked as don't optimize.")
        (:name :position-ticks :type :array :ref nil :items (:type :ref :ref "PositionTickInfo") :optional t :doc "An array of source position ticks."))
  :enum nil
  :doc "Profile node. Holds callsite information, execution statistics and child nodes." :experimental nil :deprecated nil)

(define-domain-type profile
  :cdp-id "Profile" :type :object
  :properties (
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "ProfileNode") :optional nil :doc "The list of profile nodes. First item is the root node.")
        (:name :start-time :type :number :ref nil :items nil :optional nil :doc "Profiling start timestamp in microseconds.")
        (:name :end-time :type :number :ref nil :items nil :optional nil :doc "Profiling end timestamp in microseconds.")
        (:name :samples :type :array :ref nil :items (:type :integer :ref nil) :optional t :doc "Ids of samples top nodes.")
        (:name :time-deltas :type :array :ref nil :items (:type :integer :ref nil) :optional t :doc "Time intervals between adjacent samples in microseconds. The first delta is relative to the profile startTime."))
  :enum nil
  :doc "Profile." :experimental nil :deprecated nil)

(define-domain-type position-tick-info
  :cdp-id "PositionTickInfo" :type :object
  :properties (
        (:name :line :type :integer :ref nil :items nil :optional nil :doc "Source line number (1-based).")
        (:name :ticks :type :integer :ref nil :items nil :optional nil :doc "Number of samples attributed to the source line."))
  :enum nil
  :doc "Specifies a number of samples attributed to a certain source position." :experimental nil :deprecated nil)

(define-domain-type coverage-range
  :cdp-id "CoverageRange" :type :object
  :properties (
        (:name :start-offset :type :integer :ref nil :items nil :optional nil :doc "JavaScript script source offset for the range start.")
        (:name :end-offset :type :integer :ref nil :items nil :optional nil :doc "JavaScript script source offset for the range end.")
        (:name :count :type :integer :ref nil :items nil :optional nil :doc "Collected execution count of the source range."))
  :enum nil
  :doc "Coverage data for a source range." :experimental nil :deprecated nil)

(define-domain-type function-coverage
  :cdp-id "FunctionCoverage" :type :object
  :properties (
        (:name :function-name :type :string :ref nil :items nil :optional nil :doc "JavaScript function name.")
        (:name :ranges :type :array :ref nil :items (:type :ref :ref "CoverageRange") :optional nil :doc "Source ranges inside the function with coverage data.")
        (:name :is-block-coverage :type :boolean :ref nil :items nil :optional nil :doc "Whether coverage data for this function has block granularity."))
  :enum nil
  :doc "Coverage data for a JavaScript function." :experimental nil :deprecated nil)

(define-domain-type script-coverage
  :cdp-id "ScriptCoverage" :type :object
  :properties (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "JavaScript script id.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "JavaScript script name or url.")
        (:name :functions :type :array :ref nil :items (:type :ref :ref "FunctionCoverage") :optional nil :doc "Functions contained in the script that has coverage data."))
  :enum nil
  :doc "Coverage data for a JavaScript script." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Profiler.disable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Profiler.enable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command get-best-effort-coverage
  :method "Profiler.getBestEffortCoverage"
  :params nil
  :returns (
        (:name :result :type :array :ref nil :items (:type :ref :ref "ScriptCoverage") :optional nil :doc "Coverage data for the current isolate."))
  :doc "Collect coverage data for the current isolate. The coverage data may be incomplete due to garbage collection." :experimental nil :deprecated nil)

(define-domain-command set-sampling-interval
  :method "Profiler.setSamplingInterval"
  :params (
        (:name :interval :type :integer :ref nil :items nil :optional nil :doc "New sampling interval in microseconds."))
  :returns nil
  :doc "Changes CPU profiler sampling interval. Must be called before CPU profiles recording started." :experimental nil :deprecated nil)

(define-domain-command start
  :method "Profiler.start"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command start-precise-coverage
  :method "Profiler.startPreciseCoverage"
  :params (
        (:name :call-count :type :boolean :ref nil :items nil :optional t :doc "Collect accurate call counts beyond simple 'covered' or 'not covered'.")
        (:name :detailed :type :boolean :ref nil :items nil :optional t :doc "Collect block-based coverage.")
        (:name :allow-triggered-updates :type :boolean :ref nil :items nil :optional t :doc "Allow the backend to send updates on its own initiative"))
  :returns (
        (:name :timestamp :type :number :ref nil :items nil :optional nil :doc "Monotonically increasing time (in seconds) when the coverage update was taken in the backend."))
  :doc "Enable precise code coverage. Coverage data for JavaScript executed before enabling precise code coverage may be incomplete. Enabling prevents running optimized code and resets execution counters." :experimental nil :deprecated nil)

(define-domain-command stop
  :method "Profiler.stop"
  :params nil
  :returns (
        (:name :profile :type :ref :ref "Profile" :items nil :optional nil :doc "Recorded profile."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command stop-precise-coverage
  :method "Profiler.stopPreciseCoverage"
  :params nil
  :returns nil
  :doc "Disable precise code coverage. Disabling releases unnecessary execution count records and allows executing optimized code." :experimental nil :deprecated nil)

(define-domain-command take-precise-coverage
  :method "Profiler.takePreciseCoverage"
  :params nil
  :returns (
        (:name :result :type :array :ref nil :items (:type :ref :ref "ScriptCoverage") :optional nil :doc "Coverage data for the current isolate.")
        (:name :timestamp :type :number :ref nil :items nil :optional nil :doc "Monotonically increasing time (in seconds) when the coverage update was taken in the backend."))
  :doc "Collect coverage data for the current isolate, and resets execution counters. Precise code coverage needs to have started." :experimental nil :deprecated nil)

(define-domain-event console-profile-finished
  :method "Profiler.consoleProfileFinished"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :location :type :ref :ref "Debugger.Location" :items nil :optional nil :doc "Location of console.profileEnd().")
        (:name :profile :type :ref :ref "Profile" :items nil :optional nil :doc "")
        (:name :title :type :string :ref nil :items nil :optional t :doc "Profile title passed as an argument to console.profile()."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event console-profile-started
  :method "Profiler.consoleProfileStarted"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :location :type :ref :ref "Debugger.Location" :items nil :optional nil :doc "Location of console.profile().")
        (:name :title :type :string :ref nil :items nil :optional t :doc "Profile title passed as an argument to console.profile()."))
  :doc "Sent when new profile recording is started using console.profile() call." :experimental nil :deprecated nil)

(define-domain-event precise-coverage-delta-update
  :method "Profiler.preciseCoverageDeltaUpdate"
  :params (
        (:name :timestamp :type :number :ref nil :items nil :optional nil :doc "Monotonically increasing time (in seconds) when the coverage update was taken in the backend.")
        (:name :occasion :type :string :ref nil :items nil :optional nil :doc "Identifier for distinguishing coverage events.")
        (:name :result :type :array :ref nil :items (:type :ref :ref "ScriptCoverage") :optional nil :doc "Coverage data for the current isolate."))
  :doc "Reports coverage delta since the last poll (either from an event like this, or from `takePreciseCoverage` for the current isolate. May only be sent if precise code coverage has been started. This event can be trigged by the embedder to, for example, trigger collection of coverage data immediately at a certain point in time." :experimental t :deprecated nil)

