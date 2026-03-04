;;;; Performance CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/performance
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

(in-package #:cdp/performance)

(define-domain-type metric
  :cdp-id "Metric" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Metric name.")
        (:name :value :type :number :ref nil :items nil :optional nil :doc "Metric value."))
  :enum nil
  :doc "Run-time execution metric." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Performance.disable"
  :params nil
  :returns nil
  :doc "Disable collecting and reporting metrics." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Performance.enable"
  :params (
        (:name :time-domain :type :string :ref nil :items nil :optional t :doc "Time domain to use for collecting and reporting duration metrics."))
  :returns nil
  :doc "Enable collecting and reporting metrics." :experimental nil :deprecated nil)

(define-domain-command set-time-domain
  :method "Performance.setTimeDomain"
  :params (
        (:name :time-domain :type :string :ref nil :items nil :optional nil :doc "Time domain"))
  :returns nil
  :doc "Sets time domain to use for collecting and reporting duration metrics. Note that this must be called before enabling metrics collection. Calling this method while metrics collection is enabled returns an error." :experimental t :deprecated t)

(define-domain-command get-metrics
  :method "Performance.getMetrics"
  :params nil
  :returns (
        (:name :metrics :type :array :ref nil :items (:type :ref :ref "Metric") :optional nil :doc "Current values for run-time metrics."))
  :doc "Retrieve current values of run-time metrics." :experimental nil :deprecated nil)

(define-domain-event metrics
  :method "Performance.metrics"
  :params (
        (:name :metrics :type :array :ref nil :items (:type :ref :ref "Metric") :optional nil :doc "Current values of the metrics.")
        (:name :title :type :string :ref nil :items nil :optional nil :doc "Timestamp title."))
  :doc "Current values of the metrics." :experimental nil :deprecated nil)

