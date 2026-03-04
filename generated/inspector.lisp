;;;; Inspector CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/inspector
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

(in-package #:cdp/inspector)

(define-domain-command disable
  :method "Inspector.disable"
  :params nil
  :returns nil
  :doc "Disables inspector domain notifications." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Inspector.enable"
  :params nil
  :returns nil
  :doc "Enables inspector domain notifications." :experimental nil :deprecated nil)

(define-domain-event detached
  :method "Inspector.detached"
  :params (
        (:name :reason :type :string :ref nil :items nil :optional nil :doc "The reason why connection has been terminated."))
  :doc "Fired when remote debugging connection is about to be terminated. Contains detach reason." :experimental nil :deprecated nil)

(define-domain-event target-crashed
  :method "Inspector.targetCrashed"
  :params nil
  :doc "Fired when debugging target has crashed" :experimental nil :deprecated nil)

(define-domain-event target-reloaded-after-crash
  :method "Inspector.targetReloadedAfterCrash"
  :params nil
  :doc "Fired when debugging target has reloaded after crash" :experimental nil :deprecated nil)

(define-domain-event worker-script-loaded
  :method "Inspector.workerScriptLoaded"
  :params nil
  :doc "Fired on worker targets when main worker script and any imported scripts have been evaluated." :experimental t :deprecated nil)

