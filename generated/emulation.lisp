;;;; Emulation CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/emulation
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/emulation)

(define-domain-type safe-area-insets
  :cdp-id "SafeAreaInsets" :type :object
  :properties (
        (:name :top :type :integer :ref nil :items nil :optional t :doc "Overrides safe-area-inset-top.")
        (:name :top-max :type :integer :ref nil :items nil :optional t :doc "Overrides safe-area-max-inset-top.")
        (:name :left :type :integer :ref nil :items nil :optional t :doc "Overrides safe-area-inset-left.")
        (:name :left-max :type :integer :ref nil :items nil :optional t :doc "Overrides safe-area-max-inset-left.")
        (:name :bottom :type :integer :ref nil :items nil :optional t :doc "Overrides safe-area-inset-bottom.")
        (:name :bottom-max :type :integer :ref nil :items nil :optional t :doc "Overrides safe-area-max-inset-bottom.")
        (:name :right :type :integer :ref nil :items nil :optional t :doc "Overrides safe-area-inset-right.")
        (:name :right-max :type :integer :ref nil :items nil :optional t :doc "Overrides safe-area-max-inset-right."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type screen-orientation
  :cdp-id "ScreenOrientation" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Orientation type.")
        (:name :angle :type :integer :ref nil :items nil :optional nil :doc "Orientation angle."))
  :enum nil
  :doc "Screen orientation." :experimental nil :deprecated nil)

(define-domain-type display-feature
  :cdp-id "DisplayFeature" :type :object
  :properties (
        (:name :orientation :type :string :ref nil :items nil :optional nil :doc "Orientation of a display feature in relation to screen")
        (:name :offset :type :integer :ref nil :items nil :optional nil :doc "The offset from the screen origin in either the x (for vertical orientation) or y (for horizontal orientation) direction.")
        (:name :mask-length :type :integer :ref nil :items nil :optional nil :doc "A display feature may mask content such that it is not physically displayed - this length along with the offset describes this area. A display feature that only splits content will have a 0 mask_length."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type device-posture
  :cdp-id "DevicePosture" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Current posture of the device"))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type media-feature
  :cdp-id "MediaFeature" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type virtual-time-policy
  :cdp-id "VirtualTimePolicy" :type :string
  :properties nil
  :enum '("advance" "pause" "pauseIfNetworkFetchesPending")
  :doc "advance: If the scheduler runs out of immediate work, the virtual time base may fast forward to allow the next delayed task (if any) to run; pause: The virtual time base may not advance; pauseIfNetworkFetchesPending: The virtual time base may not advance if there are any pending resource fetches." :experimental t :deprecated nil)

(define-domain-type user-agent-brand-version
  :cdp-id "UserAgentBrandVersion" :type :object
  :properties (
        (:name :brand :type :string :ref nil :items nil :optional nil :doc "")
        (:name :version :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Used to specify User Agent Client Hints to emulate. See https://wicg.github.io/ua-client-hints" :experimental t :deprecated nil)

(define-domain-type user-agent-metadata
  :cdp-id "UserAgentMetadata" :type :object
  :properties (
        (:name :brands :type :array :ref nil :items (:type :ref :ref "UserAgentBrandVersion") :optional t :doc "Brands appearing in Sec-CH-UA.")
        (:name :full-version-list :type :array :ref nil :items (:type :ref :ref "UserAgentBrandVersion") :optional t :doc "Brands appearing in Sec-CH-UA-Full-Version-List.")
        (:name :full-version :type :string :ref nil :items nil :optional t :doc "")
        (:name :platform :type :string :ref nil :items nil :optional nil :doc "")
        (:name :platform-version :type :string :ref nil :items nil :optional nil :doc "")
        (:name :architecture :type :string :ref nil :items nil :optional nil :doc "")
        (:name :model :type :string :ref nil :items nil :optional nil :doc "")
        (:name :mobile :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :bitness :type :string :ref nil :items nil :optional t :doc "")
        (:name :wow64 :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :form-factors :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Used to specify User Agent form-factor values. See https://wicg.github.io/ua-client-hints/#sec-ch-ua-form-factors"))
  :enum nil
  :doc "Used to specify User Agent Client Hints to emulate. See https://wicg.github.io/ua-client-hints Missing optional values will be filled in by the target with what it would normally use." :experimental t :deprecated nil)

(define-domain-type sensor-type
  :cdp-id "SensorType" :type :string
  :properties nil
  :enum '("absolute-orientation" "accelerometer" "ambient-light" "gravity" "gyroscope" "linear-acceleration" "magnetometer" "relative-orientation")
  :doc "Used to specify sensor types to emulate. See https://w3c.github.io/sensors/#automation for more information." :experimental t :deprecated nil)

(define-domain-type sensor-metadata
  :cdp-id "SensorMetadata" :type :object
  :properties (
        (:name :available :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :minimum-frequency :type :number :ref nil :items nil :optional t :doc "")
        (:name :maximum-frequency :type :number :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type sensor-reading-single
  :cdp-id "SensorReadingSingle" :type :object
  :properties (
        (:name :value :type :number :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type sensor-reading-xyz
  :cdp-id "SensorReadingXYZ" :type :object
  :properties (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "")
        (:name :z :type :number :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type sensor-reading-quaternion
  :cdp-id "SensorReadingQuaternion" :type :object
  :properties (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "")
        (:name :z :type :number :ref nil :items nil :optional nil :doc "")
        (:name :w :type :number :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type sensor-reading
  :cdp-id "SensorReading" :type :object
  :properties (
        (:name :single :type :ref :ref "SensorReadingSingle" :items nil :optional t :doc "")
        (:name :xyz :type :ref :ref "SensorReadingXYZ" :items nil :optional t :doc "")
        (:name :quaternion :type :ref :ref "SensorReadingQuaternion" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type pressure-source
  :cdp-id "PressureSource" :type :string
  :properties nil
  :enum '("cpu")
  :doc "" :experimental t :deprecated nil)

(define-domain-type pressure-state
  :cdp-id "PressureState" :type :string
  :properties nil
  :enum '("nominal" "fair" "serious" "critical")
  :doc "" :experimental t :deprecated nil)

(define-domain-type pressure-metadata
  :cdp-id "PressureMetadata" :type :object
  :properties (
        (:name :available :type :boolean :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type work-area-insets
  :cdp-id "WorkAreaInsets" :type :object
  :properties (
        (:name :top :type :integer :ref nil :items nil :optional t :doc "Work area top inset in pixels. Default is 0;")
        (:name :left :type :integer :ref nil :items nil :optional t :doc "Work area left inset in pixels. Default is 0;")
        (:name :bottom :type :integer :ref nil :items nil :optional t :doc "Work area bottom inset in pixels. Default is 0;")
        (:name :right :type :integer :ref nil :items nil :optional t :doc "Work area right inset in pixels. Default is 0;"))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type screen-id
  :cdp-id "ScreenId" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type screen-info
  :cdp-id "ScreenInfo" :type :object
  :properties (
        (:name :left :type :integer :ref nil :items nil :optional nil :doc "Offset of the left edge of the screen.")
        (:name :top :type :integer :ref nil :items nil :optional nil :doc "Offset of the top edge of the screen.")
        (:name :width :type :integer :ref nil :items nil :optional nil :doc "Width of the screen.")
        (:name :height :type :integer :ref nil :items nil :optional nil :doc "Height of the screen.")
        (:name :avail-left :type :integer :ref nil :items nil :optional nil :doc "Offset of the left edge of the available screen area.")
        (:name :avail-top :type :integer :ref nil :items nil :optional nil :doc "Offset of the top edge of the available screen area.")
        (:name :avail-width :type :integer :ref nil :items nil :optional nil :doc "Width of the available screen area.")
        (:name :avail-height :type :integer :ref nil :items nil :optional nil :doc "Height of the available screen area.")
        (:name :device-pixel-ratio :type :number :ref nil :items nil :optional nil :doc "Specifies the screen's device pixel ratio.")
        (:name :orientation :type :ref :ref "ScreenOrientation" :items nil :optional nil :doc "Specifies the screen's orientation.")
        (:name :color-depth :type :integer :ref nil :items nil :optional nil :doc "Specifies the screen's color depth in bits.")
        (:name :is-extended :type :boolean :ref nil :items nil :optional nil :doc "Indicates whether the device has multiple screens.")
        (:name :is-internal :type :boolean :ref nil :items nil :optional nil :doc "Indicates whether the screen is internal to the device or external, attached to the device.")
        (:name :is-primary :type :boolean :ref nil :items nil :optional nil :doc "Indicates whether the screen is set as the the operating system primary screen.")
        (:name :label :type :string :ref nil :items nil :optional nil :doc "Specifies the descriptive label for the screen.")
        (:name :id :type :ref :ref "ScreenId" :items nil :optional nil :doc "Specifies the unique identifier of the screen."))
  :enum nil
  :doc "Screen information similar to the one returned by window.getScreenDetails() method, see https://w3c.github.io/window-management/#screendetailed." :experimental t :deprecated nil)

(define-domain-type disabled-image-type
  :cdp-id "DisabledImageType" :type :string
  :properties nil
  :enum '("avif" "jxl" "webp")
  :doc "Enum of image types that can be disabled." :experimental t :deprecated nil)

(define-domain-command can-emulate
  :method "Emulation.canEmulate"
  :params nil
  :returns (
        (:name :result :type :boolean :ref nil :items nil :optional nil :doc "True if emulation is supported."))
  :doc "Tells whether emulation is supported." :experimental nil :deprecated t)

(define-domain-command clear-device-metrics-override
  :method "Emulation.clearDeviceMetricsOverride"
  :params nil
  :returns nil
  :doc "Clears the overridden device metrics." :experimental nil :deprecated nil)

(define-domain-command clear-geolocation-override
  :method "Emulation.clearGeolocationOverride"
  :params nil
  :returns nil
  :doc "Clears the overridden Geolocation Position and Error." :experimental nil :deprecated nil)

(define-domain-command reset-page-scale-factor
  :method "Emulation.resetPageScaleFactor"
  :params nil
  :returns nil
  :doc "Requests that page scale factor is reset to initial values." :experimental t :deprecated nil)

(define-domain-command set-focus-emulation-enabled
  :method "Emulation.setFocusEmulationEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether to enable to disable focus emulation."))
  :returns nil
  :doc "Enables or disables simulating a focused and active page." :experimental t :deprecated nil)

(define-domain-command set-auto-dark-mode-override
  :method "Emulation.setAutoDarkModeOverride"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional t :doc "Whether to enable or disable automatic dark mode. If not specified, any existing override will be cleared."))
  :returns nil
  :doc "Automatically render all web contents using a dark theme." :experimental t :deprecated nil)

(define-domain-command set-cpu-throttling-rate
  :method "Emulation.setCPUThrottlingRate"
  :params (
        (:name :rate :type :number :ref nil :items nil :optional nil :doc "Throttling rate as a slowdown factor (1 is no throttle, 2 is 2x slowdown, etc)."))
  :returns nil
  :doc "Enables CPU throttling to emulate slow CPUs." :experimental nil :deprecated nil)

(define-domain-command set-default-background-color-override
  :method "Emulation.setDefaultBackgroundColorOverride"
  :params (
        (:name :color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "RGBA of the default background color. If not specified, any existing override will be cleared."))
  :returns nil
  :doc "Sets or clears an override of the default background color of the frame. This override is used if the content does not specify one." :experimental nil :deprecated nil)

(define-domain-command set-safe-area-insets-override
  :method "Emulation.setSafeAreaInsetsOverride"
  :params (
        (:name :insets :type :ref :ref "SafeAreaInsets" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Overrides the values for env(safe-area-inset-*) and env(safe-area-max-inset-*). Unset values will cause the respective variables to be undefined, even if previously overridden." :experimental t :deprecated nil)

(define-domain-command set-device-metrics-override
  :method "Emulation.setDeviceMetricsOverride"
  :params (
        (:name :width :type :integer :ref nil :items nil :optional nil :doc "Overriding width value in pixels (minimum 0, maximum 10000000). 0 disables the override.")
        (:name :height :type :integer :ref nil :items nil :optional nil :doc "Overriding height value in pixels (minimum 0, maximum 10000000). 0 disables the override.")
        (:name :device-scale-factor :type :number :ref nil :items nil :optional nil :doc "Overriding device scale factor value. 0 disables the override.")
        (:name :mobile :type :boolean :ref nil :items nil :optional nil :doc "Whether to emulate mobile device. This includes viewport meta tag, overlay scrollbars, text autosizing and more.")
        (:name :scale :type :number :ref nil :items nil :optional t :doc "Scale to apply to resulting view image.")
        (:name :screen-width :type :integer :ref nil :items nil :optional t :doc "Overriding screen width value in pixels (minimum 0, maximum 10000000).")
        (:name :screen-height :type :integer :ref nil :items nil :optional t :doc "Overriding screen height value in pixels (minimum 0, maximum 10000000).")
        (:name :position-x :type :integer :ref nil :items nil :optional t :doc "Overriding view X position on screen in pixels (minimum 0, maximum 10000000).")
        (:name :position-y :type :integer :ref nil :items nil :optional t :doc "Overriding view Y position on screen in pixels (minimum 0, maximum 10000000).")
        (:name :dont-set-visible-size :type :boolean :ref nil :items nil :optional t :doc "Do not set visible view size, rely upon explicit setVisibleSize call.")
        (:name :screen-orientation :type :ref :ref "ScreenOrientation" :items nil :optional t :doc "Screen orientation override.")
        (:name :viewport :type :ref :ref "Page.Viewport" :items nil :optional t :doc "If set, the visible area of the page will be overridden to this viewport. This viewport change is not observed by the page, e.g. viewport-relative elements do not change positions.")
        (:name :display-feature :type :ref :ref "DisplayFeature" :items nil :optional t :doc "If set, the display feature of a multi-segment screen. If not set, multi-segment support is turned-off. Deprecated, use Emulation.setDisplayFeaturesOverride.")
        (:name :device-posture :type :ref :ref "DevicePosture" :items nil :optional t :doc "If set, the posture of a foldable device. If not set the posture is set to continuous. Deprecated, use Emulation.setDevicePostureOverride.")
        (:name :scrollbar-type :type :string :ref nil :items nil :optional t :doc "Scrollbar type. Default: `default`.")
        (:name :screen-orientation-lock-emulation :type :boolean :ref nil :items nil :optional t :doc "If set to true, enables screen orientation lock emulation, which intercepts screen.orientation.lock() calls from the page and reports orientation changes via screenOrientationLockChanged events. This is useful for emulating mobile device orientation lock behavior in responsive design mode."))
  :returns nil
  :doc "Overrides the values of device screen dimensions (window.screen.width, window.screen.height, window.innerWidth, window.innerHeight, and \"device-width\"/\"device-height\"-related CSS media query results)." :experimental nil :deprecated nil)

(define-domain-command set-device-posture-override
  :method "Emulation.setDevicePostureOverride"
  :params (
        (:name :posture :type :ref :ref "DevicePosture" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Start reporting the given posture value to the Device Posture API. This override can also be set in setDeviceMetricsOverride()." :experimental t :deprecated nil)

(define-domain-command clear-device-posture-override
  :method "Emulation.clearDevicePostureOverride"
  :params nil
  :returns nil
  :doc "Clears a device posture override set with either setDeviceMetricsOverride() or setDevicePostureOverride() and starts using posture information from the platform again. Does nothing if no override is set." :experimental t :deprecated nil)

(define-domain-command set-display-features-override
  :method "Emulation.setDisplayFeaturesOverride"
  :params (
        (:name :features :type :array :ref nil :items (:type :ref :ref "DisplayFeature") :optional nil :doc ""))
  :returns nil
  :doc "Start using the given display features to pupulate the Viewport Segments API. This override can also be set in setDeviceMetricsOverride()." :experimental t :deprecated nil)

(define-domain-command clear-display-features-override
  :method "Emulation.clearDisplayFeaturesOverride"
  :params nil
  :returns nil
  :doc "Clears the display features override set with either setDeviceMetricsOverride() or setDisplayFeaturesOverride() and starts using display features from the platform again. Does nothing if no override is set." :experimental t :deprecated nil)

(define-domain-command set-scrollbars-hidden
  :method "Emulation.setScrollbarsHidden"
  :params (
        (:name :hidden :type :boolean :ref nil :items nil :optional nil :doc "Whether scrollbars should be always hidden."))
  :returns nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command set-document-cookie-disabled
  :method "Emulation.setDocumentCookieDisabled"
  :params (
        (:name :disabled :type :boolean :ref nil :items nil :optional nil :doc "Whether document.coookie API should be disabled."))
  :returns nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command set-emit-touch-events-for-mouse
  :method "Emulation.setEmitTouchEventsForMouse"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether touch emulation based on mouse input should be enabled.")
        (:name :configuration :type :string :ref nil :items nil :optional t :doc "Touch/gesture events configuration. Default: current platform."))
  :returns nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command set-emulated-media
  :method "Emulation.setEmulatedMedia"
  :params (
        (:name :media :type :string :ref nil :items nil :optional t :doc "Media type to emulate. Empty string disables the override.")
        (:name :features :type :array :ref nil :items (:type :ref :ref "MediaFeature") :optional t :doc "Media features to emulate."))
  :returns nil
  :doc "Emulates the given media type or media feature for CSS media queries." :experimental nil :deprecated nil)

(define-domain-command set-emulated-vision-deficiency
  :method "Emulation.setEmulatedVisionDeficiency"
  :params (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Vision deficiency to emulate. Order: best-effort emulations come first, followed by any physiologically accurate emulations for medically recognized color vision deficiencies."))
  :returns nil
  :doc "Emulates the given vision deficiency." :experimental nil :deprecated nil)

(define-domain-command set-emulated-os-text-scale
  :method "Emulation.setEmulatedOSTextScale"
  :params (
        (:name :scale :type :number :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "Emulates the given OS text scale." :experimental nil :deprecated nil)

(define-domain-command set-geolocation-override
  :method "Emulation.setGeolocationOverride"
  :params (
        (:name :latitude :type :number :ref nil :items nil :optional t :doc "Mock latitude")
        (:name :longitude :type :number :ref nil :items nil :optional t :doc "Mock longitude")
        (:name :accuracy :type :number :ref nil :items nil :optional t :doc "Mock accuracy")
        (:name :altitude :type :number :ref nil :items nil :optional t :doc "Mock altitude")
        (:name :altitude-accuracy :type :number :ref nil :items nil :optional t :doc "Mock altitudeAccuracy")
        (:name :heading :type :number :ref nil :items nil :optional t :doc "Mock heading")
        (:name :speed :type :number :ref nil :items nil :optional t :doc "Mock speed"))
  :returns nil
  :doc "Overrides the Geolocation Position or Error. Omitting latitude, longitude or accuracy emulates position unavailable." :experimental nil :deprecated nil)

(define-domain-command get-overridden-sensor-information
  :method "Emulation.getOverriddenSensorInformation"
  :params (
        (:name :type :type :ref :ref "SensorType" :items nil :optional nil :doc ""))
  :returns (
        (:name :requested-sampling-frequency :type :number :ref nil :items nil :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-command set-sensor-override-enabled
  :method "Emulation.setSensorOverrideEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "SensorType" :items nil :optional nil :doc "")
        (:name :metadata :type :ref :ref "SensorMetadata" :items nil :optional t :doc ""))
  :returns nil
  :doc "Overrides a platform sensor of a given type. If |enabled| is true, calls to Sensor.start() will use a virtual sensor as backend rather than fetching data from a real hardware sensor. Otherwise, existing virtual sensor-backend Sensor objects will fire an error event and new calls to Sensor.start() will attempt to use a real sensor instead." :experimental t :deprecated nil)

(define-domain-command set-sensor-override-readings
  :method "Emulation.setSensorOverrideReadings"
  :params (
        (:name :type :type :ref :ref "SensorType" :items nil :optional nil :doc "")
        (:name :reading :type :ref :ref "SensorReading" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Updates the sensor readings reported by a sensor type previously overridden by setSensorOverrideEnabled." :experimental t :deprecated nil)

(define-domain-command set-pressure-source-override-enabled
  :method "Emulation.setPressureSourceOverrideEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :source :type :ref :ref "PressureSource" :items nil :optional nil :doc "")
        (:name :metadata :type :ref :ref "PressureMetadata" :items nil :optional t :doc ""))
  :returns nil
  :doc "Overrides a pressure source of a given type, as used by the Compute Pressure API, so that updates to PressureObserver.observe() are provided via setPressureStateOverride instead of being retrieved from platform-provided telemetry data." :experimental t :deprecated nil)

(define-domain-command set-pressure-state-override
  :method "Emulation.setPressureStateOverride"
  :params (
        (:name :source :type :ref :ref "PressureSource" :items nil :optional nil :doc "")
        (:name :state :type :ref :ref "PressureState" :items nil :optional nil :doc ""))
  :returns nil
  :doc "TODO: OBSOLETE: To remove when setPressureDataOverride is merged. Provides a given pressure state that will be processed and eventually be delivered to PressureObserver users. |source| must have been previously overridden by setPressureSourceOverrideEnabled." :experimental t :deprecated nil)

(define-domain-command set-pressure-data-override
  :method "Emulation.setPressureDataOverride"
  :params (
        (:name :source :type :ref :ref "PressureSource" :items nil :optional nil :doc "")
        (:name :state :type :ref :ref "PressureState" :items nil :optional nil :doc "")
        (:name :own-contribution-estimate :type :number :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "Provides a given pressure data set that will be processed and eventually be delivered to PressureObserver users. |source| must have been previously overridden by setPressureSourceOverrideEnabled." :experimental t :deprecated nil)

(define-domain-command set-idle-override
  :method "Emulation.setIdleOverride"
  :params (
        (:name :is-user-active :type :boolean :ref nil :items nil :optional nil :doc "Mock isUserActive")
        (:name :is-screen-unlocked :type :boolean :ref nil :items nil :optional nil :doc "Mock isScreenUnlocked"))
  :returns nil
  :doc "Overrides the Idle state." :experimental nil :deprecated nil)

(define-domain-command clear-idle-override
  :method "Emulation.clearIdleOverride"
  :params nil
  :returns nil
  :doc "Clears Idle state overrides." :experimental nil :deprecated nil)

(define-domain-command set-navigator-overrides
  :method "Emulation.setNavigatorOverrides"
  :params (
        (:name :platform :type :string :ref nil :items nil :optional nil :doc "The platform navigator.platform should return."))
  :returns nil
  :doc "Overrides value returned by the javascript navigator object." :experimental t :deprecated t)

(define-domain-command set-page-scale-factor
  :method "Emulation.setPageScaleFactor"
  :params (
        (:name :page-scale-factor :type :number :ref nil :items nil :optional nil :doc "Page scale factor."))
  :returns nil
  :doc "Sets a specified page scale factor." :experimental t :deprecated nil)

(define-domain-command set-script-execution-disabled
  :method "Emulation.setScriptExecutionDisabled"
  :params (
        (:name :value :type :boolean :ref nil :items nil :optional nil :doc "Whether script execution should be disabled in the page."))
  :returns nil
  :doc "Switches script execution in the page." :experimental nil :deprecated nil)

(define-domain-command set-touch-emulation-enabled
  :method "Emulation.setTouchEmulationEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether the touch event emulation should be enabled.")
        (:name :max-touch-points :type :integer :ref nil :items nil :optional t :doc "Maximum touch points supported. Defaults to one."))
  :returns nil
  :doc "Enables touch on platforms which do not support them." :experimental nil :deprecated nil)

(define-domain-command set-virtual-time-policy
  :method "Emulation.setVirtualTimePolicy"
  :params (
        (:name :policy :type :ref :ref "VirtualTimePolicy" :items nil :optional nil :doc "")
        (:name :budget :type :number :ref nil :items nil :optional t :doc "If set, after this many virtual milliseconds have elapsed virtual time will be paused and a virtualTimeBudgetExpired event is sent.")
        (:name :max-virtual-time-task-starvation-count :type :integer :ref nil :items nil :optional t :doc "If set this specifies the maximum number of tasks that can be run before virtual is forced forwards to prevent deadlock.")
        (:name :initial-virtual-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional t :doc "If set, base::Time::Now will be overridden to initially return this value."))
  :returns (
        (:name :virtual-time-ticks-base :type :number :ref nil :items nil :optional nil :doc "Absolute timestamp at which virtual time was first enabled (up time in milliseconds)."))
  :doc "Turns on virtual time for all frames (replacing real-time with a synthetic time source) and sets the current virtual time policy.  Note this supersedes any previous time budget." :experimental t :deprecated nil)

(define-domain-command set-locale-override
  :method "Emulation.setLocaleOverride"
  :params (
        (:name :locale :type :string :ref nil :items nil :optional t :doc "ICU style C locale (e.g. \"en_US\"). If not specified or empty, disables the override and restores default host system locale."))
  :returns nil
  :doc "Overrides default host system locale with the specified one." :experimental t :deprecated nil)

(define-domain-command set-timezone-override
  :method "Emulation.setTimezoneOverride"
  :params (
        (:name :timezone-id :type :string :ref nil :items nil :optional nil :doc "The timezone identifier. List of supported timezones: https://source.chromium.org/chromium/chromium/deps/icu.git/+/faee8bc70570192d82d2978a71e2a615788597d1:source/data/misc/metaZones.txt If empty, disables the override and restores default host system timezone."))
  :returns nil
  :doc "Overrides default host system timezone with the specified one." :experimental nil :deprecated nil)

(define-domain-command set-visible-size
  :method "Emulation.setVisibleSize"
  :params (
        (:name :width :type :integer :ref nil :items nil :optional nil :doc "Frame width (DIP).")
        (:name :height :type :integer :ref nil :items nil :optional nil :doc "Frame height (DIP)."))
  :returns nil
  :doc "Resizes the frame/viewport of the page. Note that this does not affect the frame's container (e.g. browser window). Can be used to produce screenshots of the specified size. Not supported on Android." :experimental t :deprecated t)

(define-domain-command set-disabled-image-types
  :method "Emulation.setDisabledImageTypes"
  :params (
        (:name :image-types :type :array :ref nil :items (:type :ref :ref "DisabledImageType") :optional nil :doc "Image types to disable."))
  :returns nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command set-data-saver-override
  :method "Emulation.setDataSaverOverride"
  :params (
        (:name :data-saver-enabled :type :boolean :ref nil :items nil :optional t :doc "Override value. Omitting the parameter disables the override."))
  :returns nil
  :doc "Override the value of navigator.connection.saveData" :experimental t :deprecated nil)

(define-domain-command set-hardware-concurrency-override
  :method "Emulation.setHardwareConcurrencyOverride"
  :params (
        (:name :hardware-concurrency :type :integer :ref nil :items nil :optional nil :doc "Hardware concurrency to report"))
  :returns nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command set-user-agent-override
  :method "Emulation.setUserAgentOverride"
  :params (
        (:name :user-agent :type :string :ref nil :items nil :optional nil :doc "User agent to use.")
        (:name :accept-language :type :string :ref nil :items nil :optional t :doc "Browser language to emulate.")
        (:name :platform :type :string :ref nil :items nil :optional t :doc "The platform navigator.platform should return.")
        (:name :user-agent-metadata :type :ref :ref "UserAgentMetadata" :items nil :optional t :doc "To be sent in Sec-CH-UA-* headers and returned in navigator.userAgentData"))
  :returns nil
  :doc "Allows overriding user agent with the given string. `userAgentMetadata` must be set for Client Hint headers to be sent." :experimental nil :deprecated nil)

(define-domain-command set-automation-override
  :method "Emulation.setAutomationOverride"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether the override should be enabled."))
  :returns nil
  :doc "Allows overriding the automation flag." :experimental t :deprecated nil)

(define-domain-command set-small-viewport-height-difference-override
  :method "Emulation.setSmallViewportHeightDifferenceOverride"
  :params (
        (:name :difference :type :integer :ref nil :items nil :optional nil :doc "This will cause an element of size 100svh to be `difference` pixels smaller than an element of size 100lvh."))
  :returns nil
  :doc "Allows overriding the difference between the small and large viewport sizes, which determine the value of the `svh` and `lvh` unit, respectively. Only supported for top-level frames." :experimental t :deprecated nil)

(define-domain-command get-screen-infos
  :method "Emulation.getScreenInfos"
  :params nil
  :returns (
        (:name :screen-infos :type :array :ref nil :items (:type :ref :ref "ScreenInfo") :optional nil :doc ""))
  :doc "Returns device's screen configuration. In headful mode, the physical screens configuration is returned, whereas in headless mode, a virtual headless screen configuration is provided instead." :experimental t :deprecated nil)

(define-domain-command add-screen
  :method "Emulation.addScreen"
  :params (
        (:name :left :type :integer :ref nil :items nil :optional nil :doc "Offset of the left edge of the screen in pixels.")
        (:name :top :type :integer :ref nil :items nil :optional nil :doc "Offset of the top edge of the screen in pixels.")
        (:name :width :type :integer :ref nil :items nil :optional nil :doc "The width of the screen in pixels.")
        (:name :height :type :integer :ref nil :items nil :optional nil :doc "The height of the screen in pixels.")
        (:name :work-area-insets :type :ref :ref "WorkAreaInsets" :items nil :optional t :doc "Specifies the screen's work area. Default is entire screen.")
        (:name :device-pixel-ratio :type :number :ref nil :items nil :optional t :doc "Specifies the screen's device pixel ratio. Default is 1.")
        (:name :rotation :type :integer :ref nil :items nil :optional t :doc "Specifies the screen's rotation angle. Available values are 0, 90, 180 and 270. Default is 0.")
        (:name :color-depth :type :integer :ref nil :items nil :optional t :doc "Specifies the screen's color depth in bits. Default is 24.")
        (:name :label :type :string :ref nil :items nil :optional t :doc "Specifies the descriptive label for the screen. Default is none.")
        (:name :is-internal :type :boolean :ref nil :items nil :optional t :doc "Indicates whether the screen is internal to the device or external, attached to the device. Default is false."))
  :returns (
        (:name :screen-info :type :ref :ref "ScreenInfo" :items nil :optional nil :doc ""))
  :doc "Add a new screen to the device. Only supported in headless mode." :experimental t :deprecated nil)

(define-domain-command update-screen
  :method "Emulation.updateScreen"
  :params (
        (:name :screen-id :type :ref :ref "ScreenId" :items nil :optional nil :doc "Target screen identifier.")
        (:name :left :type :integer :ref nil :items nil :optional t :doc "Offset of the left edge of the screen in pixels.")
        (:name :top :type :integer :ref nil :items nil :optional t :doc "Offset of the top edge of the screen in pixels.")
        (:name :width :type :integer :ref nil :items nil :optional t :doc "The width of the screen in pixels.")
        (:name :height :type :integer :ref nil :items nil :optional t :doc "The height of the screen in pixels.")
        (:name :work-area-insets :type :ref :ref "WorkAreaInsets" :items nil :optional t :doc "Specifies the screen's work area.")
        (:name :device-pixel-ratio :type :number :ref nil :items nil :optional t :doc "Specifies the screen's device pixel ratio.")
        (:name :rotation :type :integer :ref nil :items nil :optional t :doc "Specifies the screen's rotation angle. Available values are 0, 90, 180 and 270.")
        (:name :color-depth :type :integer :ref nil :items nil :optional t :doc "Specifies the screen's color depth in bits.")
        (:name :label :type :string :ref nil :items nil :optional t :doc "Specifies the descriptive label for the screen.")
        (:name :is-internal :type :boolean :ref nil :items nil :optional t :doc "Indicates whether the screen is internal to the device or external, attached to the device. Default is false."))
  :returns (
        (:name :screen-info :type :ref :ref "ScreenInfo" :items nil :optional nil :doc ""))
  :doc "Updates specified screen parameters. Only supported in headless mode." :experimental t :deprecated nil)

(define-domain-command remove-screen
  :method "Emulation.removeScreen"
  :params (
        (:name :screen-id :type :ref :ref "ScreenId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Remove screen from the device. Only supported in headless mode." :experimental t :deprecated nil)

(define-domain-command set-primary-screen
  :method "Emulation.setPrimaryScreen"
  :params (
        (:name :screen-id :type :ref :ref "ScreenId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Set primary screen. Only supported in headless mode. Note that this changes the coordinate system origin to the top-left of the new primary screen, updating the bounds and work areas of all existing screens accordingly." :experimental t :deprecated nil)

(define-domain-event virtual-time-budget-expired
  :method "Emulation.virtualTimeBudgetExpired"
  :params nil
  :doc "Notification sent after the virtual time budget for the current VirtualTimePolicy has run out." :experimental t :deprecated nil)

(define-domain-event screen-orientation-lock-changed
  :method "Emulation.screenOrientationLockChanged"
  :params (
        (:name :locked :type :boolean :ref nil :items nil :optional nil :doc "Whether the screen orientation is currently locked.")
        (:name :orientation :type :ref :ref "ScreenOrientation" :items nil :optional t :doc "The orientation lock type requested by the page. Only set when locked is true."))
  :doc "Fired when a page calls screen.orientation.lock() or screen.orientation.unlock() while device emulation is enabled. This allows the DevTools frontend to update the emulated device orientation accordingly." :experimental t :deprecated nil)

