;;;; HeadlessExperimental CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/headless-experimental
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

(in-package #:cdp/headless-experimental)

(define-domain-type screenshot-params
  :cdp-id "ScreenshotParams" :type :object
  :properties (
        (:name :format :type :string :ref nil :items nil :optional t :doc "Image compression format (defaults to png).")
        (:name :quality :type :integer :ref nil :items nil :optional t :doc "Compression quality from range [0..100] (jpeg and webp only).")
        (:name :optimize-for-speed :type :boolean :ref nil :items nil :optional t :doc "Optimize image encoding for speed, not for resulting size (defaults to false)"))
  :enum nil
  :doc "Encoding options for a screenshot." :experimental nil :deprecated nil)

(define-domain-command begin-frame
  :method "HeadlessExperimental.beginFrame"
  :params (
        (:name :frame-time-ticks :type :number :ref nil :items nil :optional t :doc "Timestamp of this BeginFrame in Renderer TimeTicks (milliseconds of uptime). If not set, the current time will be used.")
        (:name :interval :type :number :ref nil :items nil :optional t :doc "The interval between BeginFrames that is reported to the compositor, in milliseconds. Defaults to a 60 frames/second interval, i.e. about 16.666 milliseconds.")
        (:name :no-display-updates :type :boolean :ref nil :items nil :optional t :doc "Whether updates should not be committed and drawn onto the display. False by default. If true, only side effects of the BeginFrame will be run, such as layout and animations, but any visual updates may not be visible on the display or in screenshots.")
        (:name :screenshot :type :ref :ref "ScreenshotParams" :items nil :optional t :doc "If set, a screenshot of the frame will be captured and returned in the response. Otherwise, no screenshot will be captured. Note that capturing a screenshot can fail, for example, during renderer initialization. In such a case, no screenshot data will be returned."))
  :returns (
        (:name :has-damage :type :boolean :ref nil :items nil :optional nil :doc "Whether the BeginFrame resulted in damage and, thus, a new frame was committed to the display. Reported for diagnostic uses, may be removed in the future.")
        (:name :screenshot-data :type :string :ref nil :items nil :optional t :doc "Base64-encoded image data of the screenshot, if one was requested and successfully taken. (Encoded as a base64 string when passed over JSON)"))
  :doc "Sends a BeginFrame to the target and returns when the frame was completed. Optionally captures a screenshot from the resulting frame. Requires that the target was created with enabled BeginFrameControl. Designed for use with --run-all-compositor-stages-before-draw, see also https://goo.gle/chrome-headless-rendering for more background." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "HeadlessExperimental.disable"
  :params nil
  :returns nil
  :doc "Disables headless events for the target." :experimental nil :deprecated t)

(define-domain-command enable
  :method "HeadlessExperimental.enable"
  :params nil
  :returns nil
  :doc "Enables headless events for the target." :experimental nil :deprecated t)

