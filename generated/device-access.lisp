;;;; DeviceAccess CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/device-access
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

(in-package #:cdp/device-access)

(define-domain-type request-id
  :cdp-id "RequestId" :type :string
  :properties nil
  :enum nil
  :doc "Device request id." :experimental nil :deprecated nil)

(define-domain-type device-id
  :cdp-id "DeviceId" :type :string
  :properties nil
  :enum nil
  :doc "A device id." :experimental nil :deprecated nil)

(define-domain-type prompt-device
  :cdp-id "PromptDevice" :type :object
  :properties (
        (:name :id :type :ref :ref "DeviceId" :items nil :optional nil :doc "")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Display name as it appears in a device request user prompt."))
  :enum nil
  :doc "Device information displayed in a user prompt to select a device." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "DeviceAccess.enable"
  :params nil
  :returns nil
  :doc "Enable events in this domain." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "DeviceAccess.disable"
  :params nil
  :returns nil
  :doc "Disable events in this domain." :experimental nil :deprecated nil)

(define-domain-command select-prompt
  :method "DeviceAccess.selectPrompt"
  :params (
        (:name :id :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :device-id :type :ref :ref "DeviceId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Select a device in response to a DeviceAccess.deviceRequestPrompted event." :experimental nil :deprecated nil)

(define-domain-command cancel-prompt
  :method "DeviceAccess.cancelPrompt"
  :params (
        (:name :id :type :ref :ref "RequestId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Cancel a prompt in response to a DeviceAccess.deviceRequestPrompted event." :experimental nil :deprecated nil)

(define-domain-event device-request-prompted
  :method "DeviceAccess.deviceRequestPrompted"
  :params (
        (:name :id :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :devices :type :array :ref nil :items (:type :ref :ref "PromptDevice") :optional nil :doc ""))
  :doc "A device request opened a user prompt to select a device. Respond with the selectPrompt or cancelPrompt command." :experimental nil :deprecated nil)

