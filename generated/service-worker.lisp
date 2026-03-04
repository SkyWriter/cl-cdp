;;;; ServiceWorker CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/service-worker
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

(in-package #:cdp/service-worker)

(define-domain-type registration-id
  :cdp-id "RegistrationID" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type service-worker-registration
  :cdp-id "ServiceWorkerRegistration" :type :object
  :properties (
        (:name :registration-id :type :ref :ref "RegistrationID" :items nil :optional nil :doc "")
        (:name :scope-url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :is-deleted :type :boolean :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "ServiceWorker registration." :experimental nil :deprecated nil)

(define-domain-type service-worker-version-running-status
  :cdp-id "ServiceWorkerVersionRunningStatus" :type :string
  :properties nil
  :enum '("stopped" "starting" "running" "stopping")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type service-worker-version-status
  :cdp-id "ServiceWorkerVersionStatus" :type :string
  :properties nil
  :enum '("new" "installing" "installed" "activating" "activated" "redundant")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type service-worker-version
  :cdp-id "ServiceWorkerVersion" :type :object
  :properties (
        (:name :version-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :registration-id :type :ref :ref "RegistrationID" :items nil :optional nil :doc "")
        (:name :script-url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :running-status :type :ref :ref "ServiceWorkerVersionRunningStatus" :items nil :optional nil :doc "")
        (:name :status :type :ref :ref "ServiceWorkerVersionStatus" :items nil :optional nil :doc "")
        (:name :script-last-modified :type :number :ref nil :items nil :optional t :doc "The Last-Modified header value of the main script.")
        (:name :script-response-time :type :number :ref nil :items nil :optional t :doc "The time at which the response headers of the main script were received from the server. For cached script it is the last time the cache entry was validated.")
        (:name :controlled-clients :type :array :ref nil :items (:type :ref :ref "Target.TargetID") :optional t :doc "")
        (:name :target-id :type :ref :ref "Target.TargetID" :items nil :optional t :doc "")
        (:name :router-rules :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "ServiceWorker version." :experimental nil :deprecated nil)

(define-domain-type service-worker-error-message
  :cdp-id "ServiceWorkerErrorMessage" :type :object
  :properties (
        (:name :error-message :type :string :ref nil :items nil :optional nil :doc "")
        (:name :registration-id :type :ref :ref "RegistrationID" :items nil :optional nil :doc "")
        (:name :version-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :source-url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :column-number :type :integer :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "ServiceWorker error message." :experimental nil :deprecated nil)

(define-domain-command deliver-push-message
  :method "ServiceWorker.deliverPushMessage"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :registration-id :type :ref :ref "RegistrationID" :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "ServiceWorker.disable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command dispatch-sync-event
  :method "ServiceWorker.dispatchSyncEvent"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :registration-id :type :ref :ref "RegistrationID" :items nil :optional nil :doc "")
        (:name :tag :type :string :ref nil :items nil :optional nil :doc "")
        (:name :last-chance :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command dispatch-periodic-sync-event
  :method "ServiceWorker.dispatchPeriodicSyncEvent"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :registration-id :type :ref :ref "RegistrationID" :items nil :optional nil :doc "")
        (:name :tag :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "ServiceWorker.enable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command set-force-update-on-page-load
  :method "ServiceWorker.setForceUpdateOnPageLoad"
  :params (
        (:name :force-update-on-page-load :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command skip-waiting
  :method "ServiceWorker.skipWaiting"
  :params (
        (:name :scope-url :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command start-worker
  :method "ServiceWorker.startWorker"
  :params (
        (:name :scope-url :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command stop-all-workers
  :method "ServiceWorker.stopAllWorkers"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command stop-worker
  :method "ServiceWorker.stopWorker"
  :params (
        (:name :version-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command unregister
  :method "ServiceWorker.unregister"
  :params (
        (:name :scope-url :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command update-registration
  :method "ServiceWorker.updateRegistration"
  :params (
        (:name :scope-url :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-event worker-error-reported
  :method "ServiceWorker.workerErrorReported"
  :params (
        (:name :error-message :type :ref :ref "ServiceWorkerErrorMessage" :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event worker-registration-updated
  :method "ServiceWorker.workerRegistrationUpdated"
  :params (
        (:name :registrations :type :array :ref nil :items (:type :ref :ref "ServiceWorkerRegistration") :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event worker-version-updated
  :method "ServiceWorker.workerVersionUpdated"
  :params (
        (:name :versions :type :array :ref nil :items (:type :ref :ref "ServiceWorkerVersion") :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

