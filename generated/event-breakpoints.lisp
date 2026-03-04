;;;; EventBreakpoints CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/event-breakpoints
  (:use #:cl)
  (:shadow
    #:disable
  )
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/event-breakpoints)

(define-domain-command set-instrumentation-breakpoint
  :method "EventBreakpoints.setInstrumentationBreakpoint"
  :params (
        (:name :event-name :type :string :ref nil :items nil :optional nil :doc "Instrumentation name to stop on."))
  :returns nil
  :doc "Sets breakpoint on particular native event." :experimental nil :deprecated nil)

(define-domain-command remove-instrumentation-breakpoint
  :method "EventBreakpoints.removeInstrumentationBreakpoint"
  :params (
        (:name :event-name :type :string :ref nil :items nil :optional nil :doc "Instrumentation name to stop on."))
  :returns nil
  :doc "Removes breakpoint on particular native event." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "EventBreakpoints.disable"
  :params nil
  :returns nil
  :doc "Removes all breakpoints" :experimental nil :deprecated nil)

