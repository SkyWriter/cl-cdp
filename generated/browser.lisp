;;;; Browser CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/browser
  (:use #:cl)
  (:shadow
    #:close
  )
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/browser)

(define-domain-type browser-context-id
  :cdp-id "BrowserContextID" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type window-id
  :cdp-id "WindowID" :type :integer
  :properties nil
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type window-state
  :cdp-id "WindowState" :type :string
  :properties nil
  :enum '("normal" "minimized" "maximized" "fullscreen")
  :doc "The state of the browser window." :experimental t :deprecated nil)

(define-domain-type bounds
  :cdp-id "Bounds" :type :object
  :properties (
        (:name :left :type :integer :ref nil :items nil :optional t :doc "The offset from the left edge of the screen to the window in pixels.")
        (:name :top :type :integer :ref nil :items nil :optional t :doc "The offset from the top edge of the screen to the window in pixels.")
        (:name :width :type :integer :ref nil :items nil :optional t :doc "The window width in pixels.")
        (:name :height :type :integer :ref nil :items nil :optional t :doc "The window height in pixels.")
        (:name :window-state :type :ref :ref "WindowState" :items nil :optional t :doc "The window state. Default to normal."))
  :enum nil
  :doc "Browser window bounds information" :experimental t :deprecated nil)

(define-domain-type permission-type
  :cdp-id "PermissionType" :type :string
  :properties nil
  :enum '("ar" "audioCapture" "automaticFullscreen" "backgroundFetch" "backgroundSync" "cameraPanTiltZoom" "capturedSurfaceControl" "clipboardReadWrite" "clipboardSanitizedWrite" "displayCapture" "durableStorage" "geolocation" "handTracking" "idleDetection" "keyboardLock" "localFonts" "localNetwork" "localNetworkAccess" "loopbackNetwork" "midi" "midiSysex" "nfc" "notifications" "paymentHandler" "periodicBackgroundSync" "pointerLock" "protectedMediaIdentifier" "sensors" "smartCard" "speakerSelection" "storageAccess" "topLevelStorageAccess" "videoCapture" "vr" "wakeLockScreen" "wakeLockSystem" "webAppInstallation" "webPrinting" "windowManagement")
  :doc "" :experimental t :deprecated nil)

(define-domain-type permission-setting
  :cdp-id "PermissionSetting" :type :string
  :properties nil
  :enum '("granted" "denied" "prompt")
  :doc "" :experimental t :deprecated nil)

(define-domain-type permission-descriptor
  :cdp-id "PermissionDescriptor" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Name of permission. See https://cs.chromium.org/chromium/src/third_party/blink/renderer/modules/permissions/permission_descriptor.idl for valid permission names.")
        (:name :sysex :type :boolean :ref nil :items nil :optional t :doc "For \"midi\" permission, may also specify sysex control.")
        (:name :user-visible-only :type :boolean :ref nil :items nil :optional t :doc "For \"push\" permission, may specify userVisibleOnly. Note that userVisibleOnly = true is the only currently supported type.")
        (:name :allow-without-sanitization :type :boolean :ref nil :items nil :optional t :doc "For \"clipboard\" permission, may specify allowWithoutSanitization.")
        (:name :allow-without-gesture :type :boolean :ref nil :items nil :optional t :doc "For \"fullscreen\" permission, must specify allowWithoutGesture:true.")
        (:name :pan-tilt-zoom :type :boolean :ref nil :items nil :optional t :doc "For \"camera\" permission, may specify panTiltZoom."))
  :enum nil
  :doc "Definition of PermissionDescriptor defined in the Permissions API: https://w3c.github.io/permissions/#dom-permissiondescriptor." :experimental t :deprecated nil)

(define-domain-type browser-command-id
  :cdp-id "BrowserCommandId" :type :string
  :properties nil
  :enum '("openTabSearch" "closeTabSearch" "openGlic")
  :doc "Browser command ids used by executeBrowserCommand." :experimental t :deprecated nil)

(define-domain-type bucket
  :cdp-id "Bucket" :type :object
  :properties (
        (:name :low :type :integer :ref nil :items nil :optional nil :doc "Minimum value (inclusive).")
        (:name :high :type :integer :ref nil :items nil :optional nil :doc "Maximum value (exclusive).")
        (:name :count :type :integer :ref nil :items nil :optional nil :doc "Number of samples."))
  :enum nil
  :doc "Chrome histogram bucket." :experimental t :deprecated nil)

(define-domain-type histogram
  :cdp-id "Histogram" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Name.")
        (:name :sum :type :integer :ref nil :items nil :optional nil :doc "Sum of sample values.")
        (:name :count :type :integer :ref nil :items nil :optional nil :doc "Total number of samples.")
        (:name :buckets :type :array :ref nil :items (:type :ref :ref "Bucket") :optional nil :doc "Buckets."))
  :enum nil
  :doc "Chrome histogram." :experimental t :deprecated nil)

(define-domain-type privacy-sandbox-api
  :cdp-id "PrivacySandboxAPI" :type :string
  :properties nil
  :enum '("BiddingAndAuctionServices" "TrustedKeyValue")
  :doc "" :experimental t :deprecated nil)

(define-domain-command set-permission
  :method "Browser.setPermission"
  :params (
        (:name :permission :type :ref :ref "PermissionDescriptor" :items nil :optional nil :doc "Descriptor of permission to override.")
        (:name :setting :type :ref :ref "PermissionSetting" :items nil :optional nil :doc "Setting of the permission.")
        (:name :origin :type :string :ref nil :items nil :optional t :doc "Embedding origin the permission applies to, all origins if not specified.")
        (:name :embedded-origin :type :string :ref nil :items nil :optional t :doc "Embedded origin the permission applies to. It is ignored unless the embedding origin is present and valid. If the embedding origin is provided but the embedded origin isn't, the embedding origin is used as the embedded origin.")
        (:name :browser-context-id :type :ref :ref "BrowserContextID" :items nil :optional t :doc "Context to override. When omitted, default browser context is used."))
  :returns nil
  :doc "Set permission settings for given embedding and embedded origins." :experimental t :deprecated nil)

(define-domain-command grant-permissions
  :method "Browser.grantPermissions"
  :params (
        (:name :permissions :type :array :ref nil :items (:type :ref :ref "PermissionType") :optional nil :doc "")
        (:name :origin :type :string :ref nil :items nil :optional t :doc "Origin the permission applies to, all origins if not specified.")
        (:name :browser-context-id :type :ref :ref "BrowserContextID" :items nil :optional t :doc "BrowserContext to override permissions. When omitted, default browser context is used."))
  :returns nil
  :doc "Grant specific permissions to the given origin and reject all others. Deprecated. Use setPermission instead." :experimental t :deprecated t)

(define-domain-command reset-permissions
  :method "Browser.resetPermissions"
  :params (
        (:name :browser-context-id :type :ref :ref "BrowserContextID" :items nil :optional t :doc "BrowserContext to reset permissions. When omitted, default browser context is used."))
  :returns nil
  :doc "Reset all permission management for all origins." :experimental nil :deprecated nil)

(define-domain-command set-download-behavior
  :method "Browser.setDownloadBehavior"
  :params (
        (:name :behavior :type :string :ref nil :items nil :optional nil :doc "Whether to allow all or deny all download requests, or use default Chrome behavior if available (otherwise deny). |allowAndName| allows download and names files according to their download guids.")
        (:name :browser-context-id :type :ref :ref "BrowserContextID" :items nil :optional t :doc "BrowserContext to set download behavior. When omitted, default browser context is used.")
        (:name :download-path :type :string :ref nil :items nil :optional t :doc "The default path to save downloaded files to. This is required if behavior is set to 'allow' or 'allowAndName'.")
        (:name :events-enabled :type :boolean :ref nil :items nil :optional t :doc "Whether to emit download events (defaults to false)."))
  :returns nil
  :doc "Set the behavior when downloading a file." :experimental t :deprecated nil)

(define-domain-command cancel-download
  :method "Browser.cancelDownload"
  :params (
        (:name :guid :type :string :ref nil :items nil :optional nil :doc "Global unique identifier of the download.")
        (:name :browser-context-id :type :ref :ref "BrowserContextID" :items nil :optional t :doc "BrowserContext to perform the action in. When omitted, default browser context is used."))
  :returns nil
  :doc "Cancel a download if in progress" :experimental t :deprecated nil)

(define-domain-command close
  :method "Browser.close"
  :params nil
  :returns nil
  :doc "Close browser gracefully." :experimental nil :deprecated nil)

(define-domain-command crash
  :method "Browser.crash"
  :params nil
  :returns nil
  :doc "Crashes browser on the main thread." :experimental t :deprecated nil)

(define-domain-command crash-gpu-process
  :method "Browser.crashGpuProcess"
  :params nil
  :returns nil
  :doc "Crashes GPU process." :experimental t :deprecated nil)

(define-domain-command get-version
  :method "Browser.getVersion"
  :params nil
  :returns (
        (:name :protocol-version :type :string :ref nil :items nil :optional nil :doc "Protocol version.")
        (:name :product :type :string :ref nil :items nil :optional nil :doc "Product name.")
        (:name :revision :type :string :ref nil :items nil :optional nil :doc "Product revision.")
        (:name :user-agent :type :string :ref nil :items nil :optional nil :doc "User-Agent.")
        (:name :js-version :type :string :ref nil :items nil :optional nil :doc "V8 version."))
  :doc "Returns version information." :experimental nil :deprecated nil)

(define-domain-command get-browser-command-line
  :method "Browser.getBrowserCommandLine"
  :params nil
  :returns (
        (:name :arguments :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Commandline parameters"))
  :doc "Returns the command line switches for the browser process if, and only if --enable-automation is on the commandline." :experimental t :deprecated nil)

(define-domain-command get-histograms
  :method "Browser.getHistograms"
  :params (
        (:name :query :type :string :ref nil :items nil :optional t :doc "Requested substring in name. Only histograms which have query as a substring in their name are extracted. An empty or absent query returns all histograms.")
        (:name :delta :type :boolean :ref nil :items nil :optional t :doc "If true, retrieve delta since last delta call."))
  :returns (
        (:name :histograms :type :array :ref nil :items (:type :ref :ref "Histogram") :optional nil :doc "Histograms."))
  :doc "Get Chrome histograms." :experimental t :deprecated nil)

(define-domain-command get-histogram
  :method "Browser.getHistogram"
  :params (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Requested histogram name.")
        (:name :delta :type :boolean :ref nil :items nil :optional t :doc "If true, retrieve delta since last delta call."))
  :returns (
        (:name :histogram :type :ref :ref "Histogram" :items nil :optional nil :doc "Histogram."))
  :doc "Get a Chrome histogram by name." :experimental t :deprecated nil)

(define-domain-command get-window-bounds
  :method "Browser.getWindowBounds"
  :params (
        (:name :window-id :type :ref :ref "WindowID" :items nil :optional nil :doc "Browser window id."))
  :returns (
        (:name :bounds :type :ref :ref "Bounds" :items nil :optional nil :doc "Bounds information of the window. When window state is 'minimized', the restored window position and size are returned."))
  :doc "Get position and size of the browser window." :experimental t :deprecated nil)

(define-domain-command get-window-for-target
  :method "Browser.getWindowForTarget"
  :params (
        (:name :target-id :type :ref :ref "Target.TargetID" :items nil :optional t :doc "Devtools agent host id. If called as a part of the session, associated targetId is used."))
  :returns (
        (:name :window-id :type :ref :ref "WindowID" :items nil :optional nil :doc "Browser window id.")
        (:name :bounds :type :ref :ref "Bounds" :items nil :optional nil :doc "Bounds information of the window. When window state is 'minimized', the restored window position and size are returned."))
  :doc "Get the browser window that contains the devtools target." :experimental t :deprecated nil)

(define-domain-command set-window-bounds
  :method "Browser.setWindowBounds"
  :params (
        (:name :window-id :type :ref :ref "WindowID" :items nil :optional nil :doc "Browser window id.")
        (:name :bounds :type :ref :ref "Bounds" :items nil :optional nil :doc "New window bounds. The 'minimized', 'maximized' and 'fullscreen' states cannot be combined with 'left', 'top', 'width' or 'height'. Leaves unspecified fields unchanged."))
  :returns nil
  :doc "Set position and/or size of the browser window." :experimental t :deprecated nil)

(define-domain-command set-contents-size
  :method "Browser.setContentsSize"
  :params (
        (:name :window-id :type :ref :ref "WindowID" :items nil :optional nil :doc "Browser window id.")
        (:name :width :type :integer :ref nil :items nil :optional t :doc "The window contents width in DIP. Assumes current width if omitted. Must be specified if 'height' is omitted.")
        (:name :height :type :integer :ref nil :items nil :optional t :doc "The window contents height in DIP. Assumes current height if omitted. Must be specified if 'width' is omitted."))
  :returns nil
  :doc "Set size of the browser contents resizing browser window as necessary." :experimental t :deprecated nil)

(define-domain-command set-dock-tile
  :method "Browser.setDockTile"
  :params (
        (:name :badge-label :type :string :ref nil :items nil :optional t :doc "")
        (:name :image :type :string :ref nil :items nil :optional t :doc "Png encoded image. (Encoded as a base64 string when passed over JSON)"))
  :returns nil
  :doc "Set dock tile details, platform-specific." :experimental t :deprecated nil)

(define-domain-command execute-browser-command
  :method "Browser.executeBrowserCommand"
  :params (
        (:name :command-id :type :ref :ref "BrowserCommandId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Invoke custom browser commands used by telemetry." :experimental t :deprecated nil)

(define-domain-command add-privacy-sandbox-enrollment-override
  :method "Browser.addPrivacySandboxEnrollmentOverride"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Allows a site to use privacy sandbox features that require enrollment without the site actually being enrolled. Only supported on page targets." :experimental nil :deprecated nil)

(define-domain-command add-privacy-sandbox-coordinator-key-config
  :method "Browser.addPrivacySandboxCoordinatorKeyConfig"
  :params (
        (:name :api :type :ref :ref "PrivacySandboxAPI" :items nil :optional nil :doc "")
        (:name :coordinator-origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :key-config :type :string :ref nil :items nil :optional nil :doc "")
        (:name :browser-context-id :type :ref :ref "BrowserContextID" :items nil :optional t :doc "BrowserContext to perform the action in. When omitted, default browser context is used."))
  :returns nil
  :doc "Configures encryption keys used with a given privacy sandbox API to talk to a trusted coordinator.  Since this is intended for test automation only, coordinatorOrigin must be a .test domain. No existing coordinator configuration for the origin may exist." :experimental nil :deprecated nil)

(define-domain-event download-will-begin
  :method "Browser.downloadWillBegin"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "Id of the frame that caused the download to begin.")
        (:name :guid :type :string :ref nil :items nil :optional nil :doc "Global unique identifier of the download.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL of the resource being downloaded.")
        (:name :suggested-filename :type :string :ref nil :items nil :optional nil :doc "Suggested file name of the resource (the actual name of the file saved on disk may differ)."))
  :doc "Fired when page is about to start a download." :experimental t :deprecated nil)

(define-domain-event download-progress
  :method "Browser.downloadProgress"
  :params (
        (:name :guid :type :string :ref nil :items nil :optional nil :doc "Global unique identifier of the download.")
        (:name :total-bytes :type :number :ref nil :items nil :optional nil :doc "Total expected bytes to download.")
        (:name :received-bytes :type :number :ref nil :items nil :optional nil :doc "Total bytes received.")
        (:name :state :type :string :ref nil :items nil :optional nil :doc "Download status.")
        (:name :file-path :type :string :ref nil :items nil :optional t :doc "If download is \"completed\", provides the path of the downloaded file. Depending on the platform, it is not guaranteed to be set, nor the file is guaranteed to exist."))
  :doc "Fired when download makes progress. Last call has |done| == true." :experimental t :deprecated nil)

