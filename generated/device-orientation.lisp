;;;; DeviceOrientation CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/device-orientation
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/device-orientation)

(define-domain-command clear-device-orientation-override
  :method "DeviceOrientation.clearDeviceOrientationOverride"
  :params nil
  :returns nil
  :doc "Clears the overridden Device Orientation." :experimental nil :deprecated nil)

(define-domain-command set-device-orientation-override
  :method "DeviceOrientation.setDeviceOrientationOverride"
  :params (
        (:name :alpha :type :number :ref nil :items nil :optional nil :doc "Mock alpha")
        (:name :beta :type :number :ref nil :items nil :optional nil :doc "Mock beta")
        (:name :gamma :type :number :ref nil :items nil :optional nil :doc "Mock gamma"))
  :returns nil
  :doc "Overrides the Device Orientation." :experimental nil :deprecated nil)

