;;;; SystemInfo CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/system-info
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/system-info)

(define-domain-type gpu-device
  :cdp-id "GPUDevice" :type :object
  :properties (
        (:name :vendor-id :type :number :ref nil :items nil :optional nil :doc "PCI ID of the GPU vendor, if available; 0 otherwise.")
        (:name :device-id :type :number :ref nil :items nil :optional nil :doc "PCI ID of the GPU device, if available; 0 otherwise.")
        (:name :sub-sys-id :type :number :ref nil :items nil :optional t :doc "Sub sys ID of the GPU, only available on Windows.")
        (:name :revision :type :number :ref nil :items nil :optional t :doc "Revision of the GPU, only available on Windows.")
        (:name :vendor-string :type :string :ref nil :items nil :optional nil :doc "String description of the GPU vendor, if the PCI ID is not available.")
        (:name :device-string :type :string :ref nil :items nil :optional nil :doc "String description of the GPU device, if the PCI ID is not available.")
        (:name :driver-vendor :type :string :ref nil :items nil :optional nil :doc "String description of the GPU driver vendor.")
        (:name :driver-version :type :string :ref nil :items nil :optional nil :doc "String description of the GPU driver version."))
  :enum nil
  :doc "Describes a single graphics processor (GPU)." :experimental nil :deprecated nil)

(define-domain-type size
  :cdp-id "Size" :type :object
  :properties (
        (:name :width :type :integer :ref nil :items nil :optional nil :doc "Width in pixels.")
        (:name :height :type :integer :ref nil :items nil :optional nil :doc "Height in pixels."))
  :enum nil
  :doc "Describes the width and height dimensions of an entity." :experimental nil :deprecated nil)

(define-domain-type video-decode-accelerator-capability
  :cdp-id "VideoDecodeAcceleratorCapability" :type :object
  :properties (
        (:name :profile :type :string :ref nil :items nil :optional nil :doc "Video codec profile that is supported, e.g. VP9 Profile 2.")
        (:name :max-resolution :type :ref :ref "Size" :items nil :optional nil :doc "Maximum video dimensions in pixels supported for this |profile|.")
        (:name :min-resolution :type :ref :ref "Size" :items nil :optional nil :doc "Minimum video dimensions in pixels supported for this |profile|."))
  :enum nil
  :doc "Describes a supported video decoding profile with its associated minimum and maximum resolutions." :experimental nil :deprecated nil)

(define-domain-type video-encode-accelerator-capability
  :cdp-id "VideoEncodeAcceleratorCapability" :type :object
  :properties (
        (:name :profile :type :string :ref nil :items nil :optional nil :doc "Video codec profile that is supported, e.g H264 Main.")
        (:name :max-resolution :type :ref :ref "Size" :items nil :optional nil :doc "Maximum video dimensions in pixels supported for this |profile|.")
        (:name :max-framerate-numerator :type :integer :ref nil :items nil :optional nil :doc "Maximum encoding framerate in frames per second supported for this |profile|, as fraction's numerator and denominator, e.g. 24/1 fps, 24000/1001 fps, etc.")
        (:name :max-framerate-denominator :type :integer :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Describes a supported video encoding profile with its associated maximum resolution and maximum framerate." :experimental nil :deprecated nil)

(define-domain-type subsampling-format
  :cdp-id "SubsamplingFormat" :type :string
  :properties nil
  :enum '("yuv420" "yuv422" "yuv444")
  :doc "YUV subsampling type of the pixels of a given image." :experimental nil :deprecated nil)

(define-domain-type image-type
  :cdp-id "ImageType" :type :string
  :properties nil
  :enum '("jpeg" "webp" "unknown")
  :doc "Image format of a given image." :experimental nil :deprecated nil)

(define-domain-type gpu-info
  :cdp-id "GPUInfo" :type :object
  :properties (
        (:name :devices :type :array :ref nil :items (:type :ref :ref "GPUDevice") :optional nil :doc "The graphics devices on the system. Element 0 is the primary GPU.")
        (:name :aux-attributes :type :object :ref nil :items nil :optional t :doc "An optional dictionary of additional GPU related attributes.")
        (:name :feature-status :type :object :ref nil :items nil :optional t :doc "An optional dictionary of graphics features and their status.")
        (:name :driver-bug-workarounds :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "An optional array of GPU driver bug workarounds.")
        (:name :video-decoding :type :array :ref nil :items (:type :ref :ref "VideoDecodeAcceleratorCapability") :optional nil :doc "Supported accelerated video decoding capabilities.")
        (:name :video-encoding :type :array :ref nil :items (:type :ref :ref "VideoEncodeAcceleratorCapability") :optional nil :doc "Supported accelerated video encoding capabilities."))
  :enum nil
  :doc "Provides information about the GPU(s) on the system." :experimental nil :deprecated nil)

(define-domain-type process-info
  :cdp-id "ProcessInfo" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Specifies process type.")
        (:name :id :type :integer :ref nil :items nil :optional nil :doc "Specifies process id.")
        (:name :cpu-time :type :number :ref nil :items nil :optional nil :doc "Specifies cumulative CPU usage in seconds across all threads of the process since the process start."))
  :enum nil
  :doc "Represents process info." :experimental nil :deprecated nil)

(define-domain-command get-info
  :method "SystemInfo.getInfo"
  :params nil
  :returns (
        (:name :gpu :type :ref :ref "GPUInfo" :items nil :optional nil :doc "Information about the GPUs on the system.")
        (:name :model-name :type :string :ref nil :items nil :optional nil :doc "A platform-dependent description of the model of the machine. On Mac OS, this is, for example, 'MacBookPro'. Will be the empty string if not supported.")
        (:name :model-version :type :string :ref nil :items nil :optional nil :doc "A platform-dependent description of the version of the machine. On Mac OS, this is, for example, '10.1'. Will be the empty string if not supported.")
        (:name :command-line :type :string :ref nil :items nil :optional nil :doc "The command line string used to launch the browser. Will be the empty string if not supported."))
  :doc "Returns information about the system." :experimental nil :deprecated nil)

(define-domain-command get-feature-state
  :method "SystemInfo.getFeatureState"
  :params (
        (:name :feature-state :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :feature-enabled :type :boolean :ref nil :items nil :optional nil :doc ""))
  :doc "Returns information about the feature state." :experimental nil :deprecated nil)

(define-domain-command get-process-info
  :method "SystemInfo.getProcessInfo"
  :params nil
  :returns (
        (:name :process-info :type :array :ref nil :items (:type :ref :ref "ProcessInfo") :optional nil :doc "An array of process info blocks."))
  :doc "Returns information about all running processes." :experimental nil :deprecated nil)

