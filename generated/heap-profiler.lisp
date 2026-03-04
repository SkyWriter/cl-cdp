;;;; HeapProfiler CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/heap-profiler
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

(in-package #:cdp/heap-profiler)

(define-domain-type heap-snapshot-object-id
  :cdp-id "HeapSnapshotObjectId" :type :string
  :properties nil
  :enum nil
  :doc "Heap snapshot object id." :experimental nil :deprecated nil)

(define-domain-type sampling-heap-profile-node
  :cdp-id "SamplingHeapProfileNode" :type :object
  :properties (
        (:name :call-frame :type :ref :ref "Runtime.CallFrame" :items nil :optional nil :doc "Function location.")
        (:name :self-size :type :number :ref nil :items nil :optional nil :doc "Allocations size in bytes for the node excluding children.")
        (:name :id :type :integer :ref nil :items nil :optional nil :doc "Node id. Ids are unique across all profiles collected between startSampling and stopSampling.")
        (:name :children :type :array :ref nil :items (:type :ref :ref "SamplingHeapProfileNode") :optional nil :doc "Child nodes."))
  :enum nil
  :doc "Sampling Heap Profile node. Holds callsite information, allocation statistics and child nodes." :experimental nil :deprecated nil)

(define-domain-type sampling-heap-profile-sample
  :cdp-id "SamplingHeapProfileSample" :type :object
  :properties (
        (:name :size :type :number :ref nil :items nil :optional nil :doc "Allocation size in bytes attributed to the sample.")
        (:name :node-id :type :integer :ref nil :items nil :optional nil :doc "Id of the corresponding profile tree node.")
        (:name :ordinal :type :number :ref nil :items nil :optional nil :doc "Time-ordered sample ordinal number. It is unique across all profiles retrieved between startSampling and stopSampling."))
  :enum nil
  :doc "A single sample from a sampling profile." :experimental nil :deprecated nil)

(define-domain-type sampling-heap-profile
  :cdp-id "SamplingHeapProfile" :type :object
  :properties (
        (:name :head :type :ref :ref "SamplingHeapProfileNode" :items nil :optional nil :doc "")
        (:name :samples :type :array :ref nil :items (:type :ref :ref "SamplingHeapProfileSample") :optional nil :doc ""))
  :enum nil
  :doc "Sampling profile." :experimental nil :deprecated nil)

(define-domain-command add-inspected-heap-object
  :method "HeapProfiler.addInspectedHeapObject"
  :params (
        (:name :heap-object-id :type :ref :ref "HeapSnapshotObjectId" :items nil :optional nil :doc "Heap snapshot object id to be accessible by means of $x command line API."))
  :returns nil
  :doc "Enables console to refer to the node with given id via $x (see Command Line API for more details $x functions)." :experimental nil :deprecated nil)

(define-domain-command collect-garbage
  :method "HeapProfiler.collectGarbage"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "HeapProfiler.disable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "HeapProfiler.enable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command get-heap-object-id
  :method "HeapProfiler.getHeapObjectId"
  :params (
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional nil :doc "Identifier of the object to get heap object id for."))
  :returns (
        (:name :heap-snapshot-object-id :type :ref :ref "HeapSnapshotObjectId" :items nil :optional nil :doc "Id of the heap snapshot object corresponding to the passed remote object id."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command get-object-by-heap-object-id
  :method "HeapProfiler.getObjectByHeapObjectId"
  :params (
        (:name :object-id :type :ref :ref "HeapSnapshotObjectId" :items nil :optional nil :doc "")
        (:name :object-group :type :string :ref nil :items nil :optional t :doc "Symbolic group name that can be used to release multiple objects."))
  :returns (
        (:name :result :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "Evaluation result."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command get-sampling-profile
  :method "HeapProfiler.getSamplingProfile"
  :params nil
  :returns (
        (:name :profile :type :ref :ref "SamplingHeapProfile" :items nil :optional nil :doc "Return the sampling profile being collected."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command start-sampling
  :method "HeapProfiler.startSampling"
  :params (
        (:name :sampling-interval :type :number :ref nil :items nil :optional t :doc "Average sample interval in bytes. Poisson distribution is used for the intervals. The default value is 32768 bytes.")
        (:name :stack-depth :type :number :ref nil :items nil :optional t :doc "Maximum stack depth. The default value is 128.")
        (:name :include-objects-collected-by-major-gc :type :boolean :ref nil :items nil :optional t :doc "By default, the sampling heap profiler reports only objects which are still alive when the profile is returned via getSamplingProfile or stopSampling, which is useful for determining what functions contribute the most to steady-state memory usage. This flag instructs the sampling heap profiler to also include information about objects discarded by major GC, which will show which functions cause large temporary memory usage or long GC pauses.")
        (:name :include-objects-collected-by-minor-gc :type :boolean :ref nil :items nil :optional t :doc "By default, the sampling heap profiler reports only objects which are still alive when the profile is returned via getSamplingProfile or stopSampling, which is useful for determining what functions contribute the most to steady-state memory usage. This flag instructs the sampling heap profiler to also include information about objects discarded by minor GC, which is useful when tuning a latency-sensitive application for minimal GC activity."))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command start-tracking-heap-objects
  :method "HeapProfiler.startTrackingHeapObjects"
  :params (
        (:name :track-allocations :type :boolean :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command stop-sampling
  :method "HeapProfiler.stopSampling"
  :params nil
  :returns (
        (:name :profile :type :ref :ref "SamplingHeapProfile" :items nil :optional nil :doc "Recorded sampling heap profile."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command stop-tracking-heap-objects
  :method "HeapProfiler.stopTrackingHeapObjects"
  :params (
        (:name :report-progress :type :boolean :ref nil :items nil :optional t :doc "If true 'reportHeapSnapshotProgress' events will be generated while snapshot is being taken when the tracking is stopped.")
        (:name :treat-global-objects-as-roots :type :boolean :ref nil :items nil :optional t :doc "Deprecated in favor of `exposeInternals`.")
        (:name :capture-numeric-value :type :boolean :ref nil :items nil :optional t :doc "If true, numerical values are included in the snapshot")
        (:name :expose-internals :type :boolean :ref nil :items nil :optional t :doc "If true, exposes internals of the snapshot."))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command take-heap-snapshot
  :method "HeapProfiler.takeHeapSnapshot"
  :params (
        (:name :report-progress :type :boolean :ref nil :items nil :optional t :doc "If true 'reportHeapSnapshotProgress' events will be generated while snapshot is being taken.")
        (:name :treat-global-objects-as-roots :type :boolean :ref nil :items nil :optional t :doc "If true, a raw snapshot without artificial roots will be generated. Deprecated in favor of `exposeInternals`.")
        (:name :capture-numeric-value :type :boolean :ref nil :items nil :optional t :doc "If true, numerical values are included in the snapshot")
        (:name :expose-internals :type :boolean :ref nil :items nil :optional t :doc "If true, exposes internals of the snapshot."))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-event add-heap-snapshot-chunk
  :method "HeapProfiler.addHeapSnapshotChunk"
  :params (
        (:name :chunk :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event heap-stats-update
  :method "HeapProfiler.heapStatsUpdate"
  :params (
        (:name :stats-update :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "An array of triplets. Each triplet describes a fragment. The first integer is the fragment index, the second integer is a total count of objects for the fragment, the third integer is a total size of the objects for the fragment."))
  :doc "If heap objects tracking has been started then backend may send update for one or more fragments" :experimental nil :deprecated nil)

(define-domain-event last-seen-object-id
  :method "HeapProfiler.lastSeenObjectId"
  :params (
        (:name :last-seen-object-id :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :timestamp :type :number :ref nil :items nil :optional nil :doc ""))
  :doc "If heap objects tracking has been started then backend regularly sends a current value for last seen object id and corresponding timestamp. If the were changes in the heap since last event then one or more heapStatsUpdate events will be sent before a new lastSeenObjectId event." :experimental nil :deprecated nil)

(define-domain-event report-heap-snapshot-progress
  :method "HeapProfiler.reportHeapSnapshotProgress"
  :params (
        (:name :done :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :total :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :finished :type :boolean :ref nil :items nil :optional t :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event reset-profiles
  :method "HeapProfiler.resetProfiles"
  :params nil
  :doc "" :experimental nil :deprecated nil)

