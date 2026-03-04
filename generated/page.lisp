;;;; Page CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/page
  (:use #:cl)
  (:shadow
    #:close
    #:disable
    #:enable
  )
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/page)

(define-domain-type frame-id
  :cdp-id "FrameId" :type :string
  :properties nil
  :enum nil
  :doc "Unique frame identifier." :experimental nil :deprecated nil)

(define-domain-type ad-frame-type
  :cdp-id "AdFrameType" :type :string
  :properties nil
  :enum '("none" "child" "root")
  :doc "Indicates whether a frame has been identified as an ad." :experimental t :deprecated nil)

(define-domain-type ad-frame-explanation
  :cdp-id "AdFrameExplanation" :type :string
  :properties nil
  :enum '("ParentIsAd" "CreatedByAdScript" "MatchedBlockingRule")
  :doc "" :experimental t :deprecated nil)

(define-domain-type ad-frame-status
  :cdp-id "AdFrameStatus" :type :object
  :properties (
        (:name :ad-frame-type :type :ref :ref "AdFrameType" :items nil :optional nil :doc "")
        (:name :explanations :type :array :ref nil :items (:type :ref :ref "AdFrameExplanation") :optional t :doc ""))
  :enum nil
  :doc "Indicates whether a frame has been identified as an ad and why." :experimental t :deprecated nil)

(define-domain-type ad-script-id
  :cdp-id "AdScriptId" :type :object
  :properties (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Script Id of the script which caused a script or frame to be labelled as an ad.")
        (:name :debugger-id :type :ref :ref "Runtime.UniqueDebuggerId" :items nil :optional nil :doc "Id of scriptId's debugger."))
  :enum nil
  :doc "Identifies the script which caused a script or frame to be labelled as an ad." :experimental t :deprecated nil)

(define-domain-type ad-script-ancestry
  :cdp-id "AdScriptAncestry" :type :object
  :properties (
        (:name :ancestry-chain :type :array :ref nil :items (:type :ref :ref "AdScriptId") :optional nil :doc "A chain of `AdScriptId`s representing the ancestry of an ad script that led to the creation of a frame. The chain is ordered from the script itself (lower level) up to its root ancestor that was flagged by filterlist.")
        (:name :root-script-filterlist-rule :type :string :ref nil :items nil :optional t :doc "The filterlist rule that caused the root (last) script in `ancestryChain` to be ad-tagged. Only populated if the rule is available."))
  :enum nil
  :doc "Encapsulates the script ancestry and the root script filterlist rule that caused the frame to be labelled as an ad. Only created when `ancestryChain` is not empty." :experimental t :deprecated nil)

(define-domain-type secure-context-type
  :cdp-id "SecureContextType" :type :string
  :properties nil
  :enum '("Secure" "SecureLocalhost" "InsecureScheme" "InsecureAncestor")
  :doc "Indicates whether the frame is a secure context and why it is the case." :experimental t :deprecated nil)

(define-domain-type cross-origin-isolated-context-type
  :cdp-id "CrossOriginIsolatedContextType" :type :string
  :properties nil
  :enum '("Isolated" "NotIsolated" "NotIsolatedFeatureDisabled")
  :doc "Indicates whether the frame is cross-origin isolated and why it is the case." :experimental t :deprecated nil)

(define-domain-type gated-api-features
  :cdp-id "GatedAPIFeatures" :type :string
  :properties nil
  :enum '("SharedArrayBuffers" "SharedArrayBuffersTransferAllowed" "PerformanceMeasureMemory" "PerformanceProfile")
  :doc "" :experimental t :deprecated nil)

(define-domain-type permissions-policy-feature
  :cdp-id "PermissionsPolicyFeature" :type :string
  :properties nil
  :enum '("accelerometer" "all-screens-capture" "ambient-light-sensor" "aria-notify" "attribution-reporting" "autofill" "autoplay" "bluetooth" "browsing-topics" "camera" "captured-surface-control" "ch-dpr" "ch-device-memory" "ch-downlink" "ch-ect" "ch-prefers-color-scheme" "ch-prefers-reduced-motion" "ch-prefers-reduced-transparency" "ch-rtt" "ch-save-data" "ch-ua" "ch-ua-arch" "ch-ua-bitness" "ch-ua-high-entropy-values" "ch-ua-platform" "ch-ua-model" "ch-ua-mobile" "ch-ua-form-factors" "ch-ua-full-version" "ch-ua-full-version-list" "ch-ua-platform-version" "ch-ua-wow64" "ch-viewport-height" "ch-viewport-width" "ch-width" "clipboard-read" "clipboard-write" "compute-pressure" "controlled-frame" "cross-origin-isolated" "deferred-fetch" "deferred-fetch-minimal" "device-attributes" "digital-credentials-create" "digital-credentials-get" "direct-sockets" "direct-sockets-multicast" "direct-sockets-private" "display-capture" "document-domain" "encrypted-media" "execution-while-out-of-viewport" "execution-while-not-rendered" "fenced-unpartitioned-storage-read" "focus-without-user-activation" "fullscreen" "frobulate" "gamepad" "geolocation" "gyroscope" "hid" "identity-credentials-get" "idle-detection" "interest-cohort" "join-ad-interest-group" "keyboard-map" "language-detector" "language-model" "local-fonts" "local-network" "local-network-access" "loopback-network" "magnetometer" "manual-text" "media-playback-while-not-visible" "microphone" "midi" "on-device-speech-recognition" "otp-credentials" "payment" "picture-in-picture" "private-aggregation" "private-state-token-issuance" "private-state-token-redemption" "publickey-credentials-create" "publickey-credentials-get" "record-ad-auction-events" "rewriter" "run-ad-auction" "screen-wake-lock" "serial" "shared-storage" "shared-storage-select-url" "smart-card" "speaker-selection" "storage-access" "sub-apps" "summarizer" "sync-xhr" "translator" "unload" "usb" "usb-unrestricted" "vertical-scroll" "web-app-installation" "web-printing" "web-share" "window-management" "writer" "xr-spatial-tracking")
  :doc "All Permissions Policy features. This enum should match the one defined in services/network/public/cpp/permissions_policy/permissions_policy_features.json5. LINT.IfChange(PermissionsPolicyFeature)" :experimental t :deprecated nil)

(define-domain-type permissions-policy-block-reason
  :cdp-id "PermissionsPolicyBlockReason" :type :string
  :properties nil
  :enum '("Header" "IframeAttribute" "InFencedFrameTree" "InIsolatedApp")
  :doc "Reason for a permissions policy feature to be disabled." :experimental t :deprecated nil)

(define-domain-type permissions-policy-block-locator
  :cdp-id "PermissionsPolicyBlockLocator" :type :object
  :properties (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "")
        (:name :block-reason :type :ref :ref "PermissionsPolicyBlockReason" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type permissions-policy-feature-state
  :cdp-id "PermissionsPolicyFeatureState" :type :object
  :properties (
        (:name :feature :type :ref :ref "PermissionsPolicyFeature" :items nil :optional nil :doc "")
        (:name :allowed :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :locator :type :ref :ref "PermissionsPolicyBlockLocator" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type origin-trial-token-status
  :cdp-id "OriginTrialTokenStatus" :type :string
  :properties nil
  :enum '("Success" "NotSupported" "Insecure" "Expired" "WrongOrigin" "InvalidSignature" "Malformed" "WrongVersion" "FeatureDisabled" "TokenDisabled" "FeatureDisabledForUser" "UnknownTrial")
  :doc "Origin Trial(https://www.chromium.org/blink/origin-trials) support. Status for an Origin Trial token." :experimental t :deprecated nil)

(define-domain-type origin-trial-status
  :cdp-id "OriginTrialStatus" :type :string
  :properties nil
  :enum '("Enabled" "ValidTokenNotProvided" "OSNotSupported" "TrialNotAllowed")
  :doc "Status for an Origin Trial." :experimental t :deprecated nil)

(define-domain-type origin-trial-usage-restriction
  :cdp-id "OriginTrialUsageRestriction" :type :string
  :properties nil
  :enum '("None" "Subset")
  :doc "" :experimental t :deprecated nil)

(define-domain-type origin-trial-token
  :cdp-id "OriginTrialToken" :type :object
  :properties (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :match-sub-domains :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :trial-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :expiry-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "")
        (:name :is-third-party :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :usage-restriction :type :ref :ref "OriginTrialUsageRestriction" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type origin-trial-token-with-status
  :cdp-id "OriginTrialTokenWithStatus" :type :object
  :properties (
        (:name :raw-token-text :type :string :ref nil :items nil :optional nil :doc "")
        (:name :parsed-token :type :ref :ref "OriginTrialToken" :items nil :optional t :doc "`parsedToken` is present only when the token is extractable and parsable.")
        (:name :status :type :ref :ref "OriginTrialTokenStatus" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type origin-trial
  :cdp-id "OriginTrial" :type :object
  :properties (
        (:name :trial-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :status :type :ref :ref "OriginTrialStatus" :items nil :optional nil :doc "")
        (:name :tokens-with-status :type :array :ref nil :items (:type :ref :ref "OriginTrialTokenWithStatus") :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type security-origin-details
  :cdp-id "SecurityOriginDetails" :type :object
  :properties (
        (:name :is-localhost :type :boolean :ref nil :items nil :optional nil :doc "Indicates whether the frame document's security origin is one of the local hostnames (e.g. \"localhost\") or IP addresses (IPv4 127.0.0.0/8 or IPv6 ::1)."))
  :enum nil
  :doc "Additional information about the frame document's security origin." :experimental t :deprecated nil)

(define-domain-type frame
  :cdp-id "Frame" :type :object
  :properties (
        (:name :id :type :ref :ref "FrameId" :items nil :optional nil :doc "Frame unique identifier.")
        (:name :parent-id :type :ref :ref "FrameId" :items nil :optional t :doc "Parent frame identifier.")
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional nil :doc "Identifier of the loader associated with this frame.")
        (:name :name :type :string :ref nil :items nil :optional t :doc "Frame's name as specified in the tag.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Frame document's URL without fragment.")
        (:name :url-fragment :type :string :ref nil :items nil :optional t :doc "Frame document's URL fragment including the '#'.")
        (:name :domain-and-registry :type :string :ref nil :items nil :optional nil :doc "Frame document's registered domain, taking the public suffixes list into account. Extracted from the Frame's url. Example URLs: http://www.google.com/file.html -> \"google.com\"               http://a.b.co.uk/file.html      -> \"b.co.uk\"")
        (:name :security-origin :type :string :ref nil :items nil :optional nil :doc "Frame document's security origin.")
        (:name :security-origin-details :type :ref :ref "SecurityOriginDetails" :items nil :optional t :doc "Additional details about the frame document's security origin.")
        (:name :mime-type :type :string :ref nil :items nil :optional nil :doc "Frame document's mimeType as determined by the browser.")
        (:name :unreachable-url :type :string :ref nil :items nil :optional t :doc "If the frame failed to load, this contains the URL that could not be loaded. Note that unlike url above, this URL may contain a fragment.")
        (:name :ad-frame-status :type :ref :ref "AdFrameStatus" :items nil :optional t :doc "Indicates whether this frame was tagged as an ad and why.")
        (:name :secure-context-type :type :ref :ref "SecureContextType" :items nil :optional nil :doc "Indicates whether the main document is a secure context and explains why that is the case.")
        (:name :cross-origin-isolated-context-type :type :ref :ref "CrossOriginIsolatedContextType" :items nil :optional nil :doc "Indicates whether this is a cross origin isolated context.")
        (:name :gated-api-features :type :array :ref nil :items (:type :ref :ref "GatedAPIFeatures") :optional nil :doc "Indicated which gated APIs / features are available."))
  :enum nil
  :doc "Information about the Frame on the page." :experimental nil :deprecated nil)

(define-domain-type frame-resource
  :cdp-id "FrameResource" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Resource URL.")
        (:name :type :type :ref :ref "Network.ResourceType" :items nil :optional nil :doc "Type of this resource.")
        (:name :mime-type :type :string :ref nil :items nil :optional nil :doc "Resource mimeType as determined by the browser.")
        (:name :last-modified :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional t :doc "last-modified timestamp as reported by server.")
        (:name :content-size :type :number :ref nil :items nil :optional t :doc "Resource content size.")
        (:name :failed :type :boolean :ref nil :items nil :optional t :doc "True if the resource failed to load.")
        (:name :canceled :type :boolean :ref nil :items nil :optional t :doc "True if the resource was canceled during loading."))
  :enum nil
  :doc "Information about the Resource on the page." :experimental t :deprecated nil)

(define-domain-type frame-resource-tree
  :cdp-id "FrameResourceTree" :type :object
  :properties (
        (:name :frame :type :ref :ref "Frame" :items nil :optional nil :doc "Frame information for this tree item.")
        (:name :child-frames :type :array :ref nil :items (:type :ref :ref "FrameResourceTree") :optional t :doc "Child frames.")
        (:name :resources :type :array :ref nil :items (:type :ref :ref "FrameResource") :optional nil :doc "Information about frame resources."))
  :enum nil
  :doc "Information about the Frame hierarchy along with their cached resources." :experimental t :deprecated nil)

(define-domain-type frame-tree
  :cdp-id "FrameTree" :type :object
  :properties (
        (:name :frame :type :ref :ref "Frame" :items nil :optional nil :doc "Frame information for this tree item.")
        (:name :child-frames :type :array :ref nil :items (:type :ref :ref "FrameTree") :optional t :doc "Child frames."))
  :enum nil
  :doc "Information about the Frame hierarchy." :experimental nil :deprecated nil)

(define-domain-type script-identifier
  :cdp-id "ScriptIdentifier" :type :string
  :properties nil
  :enum nil
  :doc "Unique script identifier." :experimental nil :deprecated nil)

(define-domain-type transition-type
  :cdp-id "TransitionType" :type :string
  :properties nil
  :enum '("link" "typed" "address_bar" "auto_bookmark" "auto_subframe" "manual_subframe" "generated" "auto_toplevel" "form_submit" "reload" "keyword" "keyword_generated" "other")
  :doc "Transition type." :experimental nil :deprecated nil)

(define-domain-type navigation-entry
  :cdp-id "NavigationEntry" :type :object
  :properties (
        (:name :id :type :integer :ref nil :items nil :optional nil :doc "Unique id of the navigation history entry.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL of the navigation history entry.")
        (:name :user-typed-url :type :string :ref nil :items nil :optional nil :doc "URL that the user typed in the url bar.")
        (:name :title :type :string :ref nil :items nil :optional nil :doc "Title of the navigation history entry.")
        (:name :transition-type :type :ref :ref "TransitionType" :items nil :optional nil :doc "Transition type."))
  :enum nil
  :doc "Navigation history entry." :experimental nil :deprecated nil)

(define-domain-type screencast-frame-metadata
  :cdp-id "ScreencastFrameMetadata" :type :object
  :properties (
        (:name :offset-top :type :number :ref nil :items nil :optional nil :doc "Top offset in DIP.")
        (:name :page-scale-factor :type :number :ref nil :items nil :optional nil :doc "Page scale factor.")
        (:name :device-width :type :number :ref nil :items nil :optional nil :doc "Device screen width in DIP.")
        (:name :device-height :type :number :ref nil :items nil :optional nil :doc "Device screen height in DIP.")
        (:name :scroll-offset-x :type :number :ref nil :items nil :optional nil :doc "Position of horizontal scroll in CSS pixels.")
        (:name :scroll-offset-y :type :number :ref nil :items nil :optional nil :doc "Position of vertical scroll in CSS pixels.")
        (:name :timestamp :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional t :doc "Frame swap timestamp."))
  :enum nil
  :doc "Screencast frame metadata." :experimental t :deprecated nil)

(define-domain-type dialog-type
  :cdp-id "DialogType" :type :string
  :properties nil
  :enum '("alert" "confirm" "prompt" "beforeunload")
  :doc "Javascript dialog type." :experimental nil :deprecated nil)

(define-domain-type app-manifest-error
  :cdp-id "AppManifestError" :type :object
  :properties (
        (:name :message :type :string :ref nil :items nil :optional nil :doc "Error message.")
        (:name :critical :type :integer :ref nil :items nil :optional nil :doc "If critical, this is a non-recoverable parse error.")
        (:name :line :type :integer :ref nil :items nil :optional nil :doc "Error line.")
        (:name :column :type :integer :ref nil :items nil :optional nil :doc "Error column."))
  :enum nil
  :doc "Error while paring app manifest." :experimental nil :deprecated nil)

(define-domain-type app-manifest-parsed-properties
  :cdp-id "AppManifestParsedProperties" :type :object
  :properties (
        (:name :scope :type :string :ref nil :items nil :optional nil :doc "Computed scope value"))
  :enum nil
  :doc "Parsed app manifest properties." :experimental t :deprecated nil)

(define-domain-type layout-viewport
  :cdp-id "LayoutViewport" :type :object
  :properties (
        (:name :page-x :type :integer :ref nil :items nil :optional nil :doc "Horizontal offset relative to the document (CSS pixels).")
        (:name :page-y :type :integer :ref nil :items nil :optional nil :doc "Vertical offset relative to the document (CSS pixels).")
        (:name :client-width :type :integer :ref nil :items nil :optional nil :doc "Width (CSS pixels), excludes scrollbar if present.")
        (:name :client-height :type :integer :ref nil :items nil :optional nil :doc "Height (CSS pixels), excludes scrollbar if present."))
  :enum nil
  :doc "Layout viewport position and dimensions." :experimental nil :deprecated nil)

(define-domain-type visual-viewport
  :cdp-id "VisualViewport" :type :object
  :properties (
        (:name :offset-x :type :number :ref nil :items nil :optional nil :doc "Horizontal offset relative to the layout viewport (CSS pixels).")
        (:name :offset-y :type :number :ref nil :items nil :optional nil :doc "Vertical offset relative to the layout viewport (CSS pixels).")
        (:name :page-x :type :number :ref nil :items nil :optional nil :doc "Horizontal offset relative to the document (CSS pixels).")
        (:name :page-y :type :number :ref nil :items nil :optional nil :doc "Vertical offset relative to the document (CSS pixels).")
        (:name :client-width :type :number :ref nil :items nil :optional nil :doc "Width (CSS pixels), excludes scrollbar if present.")
        (:name :client-height :type :number :ref nil :items nil :optional nil :doc "Height (CSS pixels), excludes scrollbar if present.")
        (:name :scale :type :number :ref nil :items nil :optional nil :doc "Scale relative to the ideal viewport (size at width=device-width).")
        (:name :zoom :type :number :ref nil :items nil :optional t :doc "Page zoom factor (CSS to device independent pixels ratio)."))
  :enum nil
  :doc "Visual viewport position, dimensions, and scale." :experimental nil :deprecated nil)

(define-domain-type viewport
  :cdp-id "Viewport" :type :object
  :properties (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "X offset in device independent pixels (dip).")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Y offset in device independent pixels (dip).")
        (:name :width :type :number :ref nil :items nil :optional nil :doc "Rectangle width in device independent pixels (dip).")
        (:name :height :type :number :ref nil :items nil :optional nil :doc "Rectangle height in device independent pixels (dip).")
        (:name :scale :type :number :ref nil :items nil :optional nil :doc "Page scale factor."))
  :enum nil
  :doc "Viewport for capturing screenshot." :experimental nil :deprecated nil)

(define-domain-type font-families
  :cdp-id "FontFamilies" :type :object
  :properties (
        (:name :standard :type :string :ref nil :items nil :optional t :doc "The standard font-family.")
        (:name :fixed :type :string :ref nil :items nil :optional t :doc "The fixed font-family.")
        (:name :serif :type :string :ref nil :items nil :optional t :doc "The serif font-family.")
        (:name :sans-serif :type :string :ref nil :items nil :optional t :doc "The sansSerif font-family.")
        (:name :cursive :type :string :ref nil :items nil :optional t :doc "The cursive font-family.")
        (:name :fantasy :type :string :ref nil :items nil :optional t :doc "The fantasy font-family.")
        (:name :math :type :string :ref nil :items nil :optional t :doc "The math font-family."))
  :enum nil
  :doc "Generic font families collection." :experimental t :deprecated nil)

(define-domain-type script-font-families
  :cdp-id "ScriptFontFamilies" :type :object
  :properties (
        (:name :script :type :string :ref nil :items nil :optional nil :doc "Name of the script which these font families are defined for.")
        (:name :font-families :type :ref :ref "FontFamilies" :items nil :optional nil :doc "Generic font families collection for the script."))
  :enum nil
  :doc "Font families collection for a script." :experimental t :deprecated nil)

(define-domain-type font-sizes
  :cdp-id "FontSizes" :type :object
  :properties (
        (:name :standard :type :integer :ref nil :items nil :optional t :doc "Default standard font size.")
        (:name :fixed :type :integer :ref nil :items nil :optional t :doc "Default fixed font size."))
  :enum nil
  :doc "Default font sizes." :experimental t :deprecated nil)

(define-domain-type client-navigation-reason
  :cdp-id "ClientNavigationReason" :type :string
  :properties nil
  :enum '("anchorClick" "formSubmissionGet" "formSubmissionPost" "httpHeaderRefresh" "initialFrameNavigation" "metaTagRefresh" "other" "pageBlockInterstitial" "reload" "scriptInitiated")
  :doc "" :experimental t :deprecated nil)

(define-domain-type client-navigation-disposition
  :cdp-id "ClientNavigationDisposition" :type :string
  :properties nil
  :enum '("currentTab" "newTab" "newWindow" "download")
  :doc "" :experimental t :deprecated nil)

(define-domain-type installability-error-argument
  :cdp-id "InstallabilityErrorArgument" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Argument name (e.g. name:'minimum-icon-size-in-pixels').")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Argument value (e.g. value:'64')."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type installability-error
  :cdp-id "InstallabilityError" :type :object
  :properties (
        (:name :error-id :type :string :ref nil :items nil :optional nil :doc "The error id (e.g. 'manifest-missing-suitable-icon').")
        (:name :error-arguments :type :array :ref nil :items (:type :ref :ref "InstallabilityErrorArgument") :optional nil :doc "The list of error arguments (e.g. {name:'minimum-icon-size-in-pixels', value:'64'})."))
  :enum nil
  :doc "The installability error" :experimental t :deprecated nil)

(define-domain-type referrer-policy
  :cdp-id "ReferrerPolicy" :type :string
  :properties nil
  :enum '("noReferrer" "noReferrerWhenDowngrade" "origin" "originWhenCrossOrigin" "sameOrigin" "strictOrigin" "strictOriginWhenCrossOrigin" "unsafeUrl")
  :doc "The referring-policy used for the navigation." :experimental t :deprecated nil)

(define-domain-type compilation-cache-params
  :cdp-id "CompilationCacheParams" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The URL of the script to produce a compilation cache entry for.")
        (:name :eager :type :boolean :ref nil :items nil :optional t :doc "A hint to the backend whether eager compilation is recommended. (the actual compilation mode used is upon backend discretion)."))
  :enum nil
  :doc "Per-script compilation cache parameters for `Page.produceCompilationCache`" :experimental t :deprecated nil)

(define-domain-type file-filter
  :cdp-id "FileFilter" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional t :doc "")
        (:name :accepts :type :array :ref nil :items (:type :string :ref nil) :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type file-handler
  :cdp-id "FileHandler" :type :object
  :properties (
        (:name :action :type :string :ref nil :items nil :optional nil :doc "")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :icons :type :array :ref nil :items (:type :ref :ref "ImageResource") :optional t :doc "")
        (:name :accepts :type :array :ref nil :items (:type :ref :ref "FileFilter") :optional t :doc "Mimic a map, name is the key, accepts is the value.")
        (:name :launch-type :type :string :ref nil :items nil :optional nil :doc "Won't repeat the enums, using string for easy comparison. Same as the other enums below."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type image-resource
  :cdp-id "ImageResource" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The src field in the definition, but changing to url in favor of consistency.")
        (:name :sizes :type :string :ref nil :items nil :optional t :doc "")
        (:name :type :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "The image definition used in both icon and screenshot." :experimental t :deprecated nil)

(define-domain-type launch-handler
  :cdp-id "LaunchHandler" :type :object
  :properties (
        (:name :client-mode :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type protocol-handler
  :cdp-id "ProtocolHandler" :type :object
  :properties (
        (:name :protocol :type :string :ref nil :items nil :optional nil :doc "")
        (:name :url :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type related-application
  :cdp-id "RelatedApplication" :type :object
  :properties (
        (:name :id :type :string :ref nil :items nil :optional t :doc "")
        (:name :url :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type scope-extension
  :cdp-id "ScopeExtension" :type :object
  :properties (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Instead of using tuple, this field always returns the serialized string for easy understanding and comparison.")
        (:name :has-origin-wildcard :type :boolean :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type screenshot
  :cdp-id "Screenshot" :type :object
  :properties (
        (:name :image :type :ref :ref "ImageResource" :items nil :optional nil :doc "")
        (:name :form-factor :type :string :ref nil :items nil :optional nil :doc "")
        (:name :label :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type share-target
  :cdp-id "ShareTarget" :type :object
  :properties (
        (:name :action :type :string :ref nil :items nil :optional nil :doc "")
        (:name :method :type :string :ref nil :items nil :optional nil :doc "")
        (:name :enctype :type :string :ref nil :items nil :optional nil :doc "")
        (:name :title :type :string :ref nil :items nil :optional t :doc "Embed the ShareTargetParams")
        (:name :text :type :string :ref nil :items nil :optional t :doc "")
        (:name :url :type :string :ref nil :items nil :optional t :doc "")
        (:name :files :type :array :ref nil :items (:type :ref :ref "FileFilter") :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type shortcut
  :cdp-id "Shortcut" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :url :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type web-app-manifest
  :cdp-id "WebAppManifest" :type :object
  :properties (
        (:name :background-color :type :string :ref nil :items nil :optional t :doc "")
        (:name :description :type :string :ref nil :items nil :optional t :doc "The extra description provided by the manifest.")
        (:name :dir :type :string :ref nil :items nil :optional t :doc "")
        (:name :display :type :string :ref nil :items nil :optional t :doc "")
        (:name :display-overrides :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "The overrided display mode controlled by the user.")
        (:name :file-handlers :type :array :ref nil :items (:type :ref :ref "FileHandler") :optional t :doc "The handlers to open files.")
        (:name :icons :type :array :ref nil :items (:type :ref :ref "ImageResource") :optional t :doc "")
        (:name :id :type :string :ref nil :items nil :optional t :doc "")
        (:name :lang :type :string :ref nil :items nil :optional t :doc "")
        (:name :launch-handler :type :ref :ref "LaunchHandler" :items nil :optional t :doc "TODO(crbug.com/1231886): This field is non-standard and part of a Chrome experiment. See: https://github.com/WICG/web-app-launch/blob/main/launch_handler.md")
        (:name :name :type :string :ref nil :items nil :optional t :doc "")
        (:name :orientation :type :string :ref nil :items nil :optional t :doc "")
        (:name :prefer-related-applications :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :protocol-handlers :type :array :ref nil :items (:type :ref :ref "ProtocolHandler") :optional t :doc "The handlers to open protocols.")
        (:name :related-applications :type :array :ref nil :items (:type :ref :ref "RelatedApplication") :optional t :doc "")
        (:name :scope :type :string :ref nil :items nil :optional t :doc "")
        (:name :scope-extensions :type :array :ref nil :items (:type :ref :ref "ScopeExtension") :optional t :doc "Non-standard, see https://github.com/WICG/manifest-incubations/blob/gh-pages/scope_extensions-explainer.md")
        (:name :screenshots :type :array :ref nil :items (:type :ref :ref "Screenshot") :optional t :doc "The screenshots used by chromium.")
        (:name :share-target :type :ref :ref "ShareTarget" :items nil :optional t :doc "")
        (:name :short-name :type :string :ref nil :items nil :optional t :doc "")
        (:name :shortcuts :type :array :ref nil :items (:type :ref :ref "Shortcut") :optional t :doc "")
        (:name :start-url :type :string :ref nil :items nil :optional t :doc "")
        (:name :theme-color :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type navigation-type
  :cdp-id "NavigationType" :type :string
  :properties nil
  :enum '("Navigation" "BackForwardCacheRestore")
  :doc "The type of a frameNavigated event." :experimental t :deprecated nil)

(define-domain-type back-forward-cache-not-restored-reason
  :cdp-id "BackForwardCacheNotRestoredReason" :type :string
  :properties nil
  :enum '("NotPrimaryMainFrame" "BackForwardCacheDisabled" "RelatedActiveContentsExist" "HTTPStatusNotOK" "SchemeNotHTTPOrHTTPS" "Loading" "WasGrantedMediaAccess" "DisableForRenderFrameHostCalled" "DomainNotAllowed" "HTTPMethodNotGET" "SubframeIsNavigating" "Timeout" "CacheLimit" "JavaScriptExecution" "RendererProcessKilled" "RendererProcessCrashed" "SchedulerTrackedFeatureUsed" "ConflictingBrowsingInstance" "CacheFlushed" "ServiceWorkerVersionActivation" "SessionRestored" "ServiceWorkerPostMessage" "EnteredBackForwardCacheBeforeServiceWorkerHostAdded" "RenderFrameHostReused_SameSite" "RenderFrameHostReused_CrossSite" "ServiceWorkerClaim" "IgnoreEventAndEvict" "HaveInnerContents" "TimeoutPuttingInCache" "BackForwardCacheDisabledByLowMemory" "BackForwardCacheDisabledByCommandLine" "NetworkRequestDatapipeDrainedAsBytesConsumer" "NetworkRequestRedirected" "NetworkRequestTimeout" "NetworkExceedsBufferLimit" "NavigationCancelledWhileRestoring" "NotMostRecentNavigationEntry" "BackForwardCacheDisabledForPrerender" "UserAgentOverrideDiffers" "ForegroundCacheLimit" "BrowsingInstanceNotSwapped" "BackForwardCacheDisabledForDelegate" "UnloadHandlerExistsInMainFrame" "UnloadHandlerExistsInSubFrame" "ServiceWorkerUnregistration" "CacheControlNoStore" "CacheControlNoStoreCookieModified" "CacheControlNoStoreHTTPOnlyCookieModified" "NoResponseHead" "Unknown" "ActivationNavigationsDisallowedForBug1234857" "ErrorDocument" "FencedFramesEmbedder" "CookieDisabled" "HTTPAuthRequired" "CookieFlushed" "BroadcastChannelOnMessage" "WebViewSettingsChanged" "WebViewJavaScriptObjectChanged" "WebViewMessageListenerInjected" "WebViewSafeBrowsingAllowlistChanged" "WebViewDocumentStartJavascriptChanged" "WebSocket" "WebTransport" "WebRTC" "MainResourceHasCacheControlNoStore" "MainResourceHasCacheControlNoCache" "SubresourceHasCacheControlNoStore" "SubresourceHasCacheControlNoCache" "ContainsPlugins" "DocumentLoaded" "OutstandingNetworkRequestOthers" "RequestedMIDIPermission" "RequestedAudioCapturePermission" "RequestedVideoCapturePermission" "RequestedBackForwardCacheBlockedSensors" "RequestedBackgroundWorkPermission" "BroadcastChannel" "WebXR" "SharedWorker" "SharedWorkerMessage" "SharedWorkerWithNoActiveClient" "WebLocks" "WebLocksContention" "WebHID" "WebBluetooth" "WebShare" "RequestedStorageAccessGrant" "WebNfc" "OutstandingNetworkRequestFetch" "OutstandingNetworkRequestXHR" "AppBanner" "Printing" "WebDatabase" "PictureInPicture" "SpeechRecognizer" "IdleManager" "PaymentManager" "SpeechSynthesis" "KeyboardLock" "WebOTPService" "OutstandingNetworkRequestDirectSocket" "InjectedJavascript" "InjectedStyleSheet" "KeepaliveRequest" "IndexedDBEvent" "Dummy" "JsNetworkRequestReceivedCacheControlNoStoreResource" "WebRTCUsedWithCCNS" "WebTransportUsedWithCCNS" "WebSocketUsedWithCCNS" "SmartCard" "LiveMediaStreamTrack" "UnloadHandler" "ParserAborted" "ContentSecurityHandler" "ContentWebAuthenticationAPI" "ContentFileChooser" "ContentSerial" "ContentFileSystemAccess" "ContentMediaDevicesDispatcherHost" "ContentWebBluetooth" "ContentWebUSB" "ContentMediaSessionService" "ContentScreenReader" "ContentDiscarded" "EmbedderPopupBlockerTabHelper" "EmbedderSafeBrowsingTriggeredPopupBlocker" "EmbedderSafeBrowsingThreatDetails" "EmbedderAppBannerManager" "EmbedderDomDistillerViewerSource" "EmbedderDomDistillerSelfDeletingRequestDelegate" "EmbedderOomInterventionTabHelper" "EmbedderOfflinePage" "EmbedderChromePasswordManagerClientBindCredentialManager" "EmbedderPermissionRequestManager" "EmbedderModalDialog" "EmbedderExtensions" "EmbedderExtensionMessaging" "EmbedderExtensionMessagingForOpenPort" "EmbedderExtensionSentMessageToCachedFrame" "RequestedByWebViewClient" "PostMessageByWebViewClient" "CacheControlNoStoreDeviceBoundSessionTerminated" "CacheLimitPrunedOnModerateMemoryPressure" "CacheLimitPrunedOnCriticalMemoryPressure")
  :doc "List of not restored reasons for back-forward cache." :experimental t :deprecated nil)

(define-domain-type back-forward-cache-not-restored-reason-type
  :cdp-id "BackForwardCacheNotRestoredReasonType" :type :string
  :properties nil
  :enum '("SupportPending" "PageSupportNeeded" "Circumstantial")
  :doc "Types of not restored reasons for back-forward cache." :experimental t :deprecated nil)

(define-domain-type back-forward-cache-blocking-details
  :cdp-id "BackForwardCacheBlockingDetails" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional t :doc "Url of the file where blockage happened. Optional because of tests.")
        (:name :function :type :string :ref nil :items nil :optional t :doc "Function name where blockage happened. Optional because of anonymous functions and tests.")
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "Line number in the script (0-based).")
        (:name :column-number :type :integer :ref nil :items nil :optional nil :doc "Column number in the script (0-based)."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type back-forward-cache-not-restored-explanation
  :cdp-id "BackForwardCacheNotRestoredExplanation" :type :object
  :properties (
        (:name :type :type :ref :ref "BackForwardCacheNotRestoredReasonType" :items nil :optional nil :doc "Type of the reason")
        (:name :reason :type :ref :ref "BackForwardCacheNotRestoredReason" :items nil :optional nil :doc "Not restored reason")
        (:name :context :type :string :ref nil :items nil :optional t :doc "Context associated with the reason. The meaning of this context is dependent on the reason: - EmbedderExtensionSentMessageToCachedFrame: the extension ID.")
        (:name :details :type :array :ref nil :items (:type :ref :ref "BackForwardCacheBlockingDetails") :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type back-forward-cache-not-restored-explanation-tree
  :cdp-id "BackForwardCacheNotRestoredExplanationTree" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL of each frame")
        (:name :explanations :type :array :ref nil :items (:type :ref :ref "BackForwardCacheNotRestoredExplanation") :optional nil :doc "Not restored reasons of each frame")
        (:name :children :type :array :ref nil :items (:type :ref :ref "BackForwardCacheNotRestoredExplanationTree") :optional nil :doc "Array of children frame"))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command add-script-to-evaluate-on-load
  :method "Page.addScriptToEvaluateOnLoad"
  :params (
        (:name :script-source :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :identifier :type :ref :ref "ScriptIdentifier" :items nil :optional nil :doc "Identifier of the added script."))
  :doc "Deprecated, please use addScriptToEvaluateOnNewDocument instead." :experimental t :deprecated t)

(define-domain-command add-script-to-evaluate-on-new-document
  :method "Page.addScriptToEvaluateOnNewDocument"
  :params (
        (:name :source :type :string :ref nil :items nil :optional nil :doc "")
        (:name :world-name :type :string :ref nil :items nil :optional t :doc "If specified, creates an isolated world with the given name and evaluates given script in it. This world name will be used as the ExecutionContextDescription::name when the corresponding event is emitted.")
        (:name :include-command-line-api :type :boolean :ref nil :items nil :optional t :doc "Specifies whether command line API should be available to the script, defaults to false.")
        (:name :run-immediately :type :boolean :ref nil :items nil :optional t :doc "If true, runs the script immediately on existing execution contexts or worlds. Default: false."))
  :returns (
        (:name :identifier :type :ref :ref "ScriptIdentifier" :items nil :optional nil :doc "Identifier of the added script."))
  :doc "Evaluates given script in every frame upon creation (before loading frame's scripts)." :experimental nil :deprecated nil)

(define-domain-command bring-to-front
  :method "Page.bringToFront"
  :params nil
  :returns nil
  :doc "Brings page to front (activates tab)." :experimental nil :deprecated nil)

(define-domain-command capture-screenshot
  :method "Page.captureScreenshot"
  :params (
        (:name :format :type :string :ref nil :items nil :optional t :doc "Image compression format (defaults to png).")
        (:name :quality :type :integer :ref nil :items nil :optional t :doc "Compression quality from range [0..100] (jpeg only).")
        (:name :clip :type :ref :ref "Viewport" :items nil :optional t :doc "Capture the screenshot of a given region only.")
        (:name :from-surface :type :boolean :ref nil :items nil :optional t :doc "Capture the screenshot from the surface, rather than the view. Defaults to true.")
        (:name :capture-beyond-viewport :type :boolean :ref nil :items nil :optional t :doc "Capture the screenshot beyond the viewport. Defaults to false.")
        (:name :optimize-for-speed :type :boolean :ref nil :items nil :optional t :doc "Optimize image encoding for speed, not for resulting size (defaults to false)"))
  :returns (
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Base64-encoded image data. (Encoded as a base64 string when passed over JSON)"))
  :doc "Capture page screenshot." :experimental nil :deprecated nil)

(define-domain-command capture-snapshot
  :method "Page.captureSnapshot"
  :params (
        (:name :format :type :string :ref nil :items nil :optional t :doc "Format (defaults to mhtml)."))
  :returns (
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Serialized page data."))
  :doc "Returns a snapshot of the page as a string. For MHTML format, the serialization includes iframes, shadow DOM, external resources, and element-inline styles." :experimental t :deprecated nil)

(define-domain-command clear-device-metrics-override
  :method "Page.clearDeviceMetricsOverride"
  :params nil
  :returns nil
  :doc "Clears the overridden device metrics." :experimental t :deprecated t)

(define-domain-command clear-device-orientation-override
  :method "Page.clearDeviceOrientationOverride"
  :params nil
  :returns nil
  :doc "Clears the overridden Device Orientation." :experimental t :deprecated t)

(define-domain-command clear-geolocation-override
  :method "Page.clearGeolocationOverride"
  :params nil
  :returns nil
  :doc "Clears the overridden Geolocation Position and Error." :experimental nil :deprecated t)

(define-domain-command create-isolated-world
  :method "Page.createIsolatedWorld"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame in which the isolated world should be created.")
        (:name :world-name :type :string :ref nil :items nil :optional t :doc "An optional name which is reported in the Execution Context.")
        (:name :grant-univeral-access :type :boolean :ref nil :items nil :optional t :doc "Whether or not universal access should be granted to the isolated world. This is a powerful option, use with caution."))
  :returns (
        (:name :execution-context-id :type :ref :ref "Runtime.ExecutionContextId" :items nil :optional nil :doc "Execution context of the isolated world."))
  :doc "Creates an isolated world for the given frame." :experimental nil :deprecated nil)

(define-domain-command delete-cookie
  :method "Page.deleteCookie"
  :params (
        (:name :cookie-name :type :string :ref nil :items nil :optional nil :doc "Name of the cookie to remove.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL to match cooke domain and path."))
  :returns nil
  :doc "Deletes browser cookie with given name, domain and path." :experimental t :deprecated t)

(define-domain-command disable
  :method "Page.disable"
  :params nil
  :returns nil
  :doc "Disables page domain notifications." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Page.enable"
  :params (
        (:name :enable-file-chooser-opened-event :type :boolean :ref nil :items nil :optional t :doc "If true, the `Page.fileChooserOpened` event will be emitted regardless of the state set by `Page.setInterceptFileChooserDialog` command (default: false)."))
  :returns nil
  :doc "Enables page domain notifications." :experimental nil :deprecated nil)

(define-domain-command get-app-manifest
  :method "Page.getAppManifest"
  :params (
        (:name :manifest-id :type :string :ref nil :items nil :optional t :doc ""))
  :returns (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Manifest location.")
        (:name :errors :type :array :ref nil :items (:type :ref :ref "AppManifestError") :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional t :doc "Manifest content.")
        (:name :parsed :type :ref :ref "AppManifestParsedProperties" :items nil :optional t :doc "Parsed manifest properties. Deprecated, use manifest instead.")
        (:name :manifest :type :ref :ref "WebAppManifest" :items nil :optional nil :doc ""))
  :doc "Gets the processed manifest for this current document.   This API always waits for the manifest to be loaded.   If manifestId is provided, and it does not match the manifest of the     current document, this API errors out.   If there is not a loaded page, this API errors out immediately." :experimental nil :deprecated nil)

(define-domain-command get-installability-errors
  :method "Page.getInstallabilityErrors"
  :params nil
  :returns (
        (:name :installability-errors :type :array :ref nil :items (:type :ref :ref "InstallabilityError") :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-command get-manifest-icons
  :method "Page.getManifestIcons"
  :params nil
  :returns (
        (:name :primary-icon :type :string :ref nil :items nil :optional t :doc ""))
  :doc "Deprecated because it's not guaranteed that the returned icon is in fact the one used for PWA installation." :experimental t :deprecated t)

(define-domain-command get-app-id
  :method "Page.getAppId"
  :params nil
  :returns (
        (:name :app-id :type :string :ref nil :items nil :optional t :doc "App id, either from manifest's id attribute or computed from start_url")
        (:name :recommended-id :type :string :ref nil :items nil :optional t :doc "Recommendation for manifest's id attribute to match current id computed from start_url"))
  :doc "Returns the unique (PWA) app id. Only returns values if the feature flag 'WebAppEnableManifestId' is enabled" :experimental t :deprecated nil)

(define-domain-command get-ad-script-ancestry
  :method "Page.getAdScriptAncestry"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc ""))
  :returns (
        (:name :ad-script-ancestry :type :ref :ref "AdScriptAncestry" :items nil :optional t :doc "The ancestry chain of ad script identifiers leading to this frame's creation, along with the root script's filterlist rule. The ancestry chain is ordered from the most immediate script (in the frame creation stack) to more distant ancestors (that created the immediately preceding script). Only sent if frame is labelled as an ad and ids are available."))
  :doc "" :experimental t :deprecated nil)

(define-domain-command get-frame-tree
  :method "Page.getFrameTree"
  :params nil
  :returns (
        (:name :frame-tree :type :ref :ref "FrameTree" :items nil :optional nil :doc "Present frame tree structure."))
  :doc "Returns present frame tree structure." :experimental nil :deprecated nil)

(define-domain-command get-layout-metrics
  :method "Page.getLayoutMetrics"
  :params nil
  :returns (
        (:name :layout-viewport :type :ref :ref "LayoutViewport" :items nil :optional nil :doc "Deprecated metrics relating to the layout viewport. Is in device pixels. Use `cssLayoutViewport` instead.")
        (:name :visual-viewport :type :ref :ref "VisualViewport" :items nil :optional nil :doc "Deprecated metrics relating to the visual viewport. Is in device pixels. Use `cssVisualViewport` instead.")
        (:name :content-size :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "Deprecated size of scrollable area. Is in DP. Use `cssContentSize` instead.")
        (:name :css-layout-viewport :type :ref :ref "LayoutViewport" :items nil :optional nil :doc "Metrics relating to the layout viewport in CSS pixels.")
        (:name :css-visual-viewport :type :ref :ref "VisualViewport" :items nil :optional nil :doc "Metrics relating to the visual viewport in CSS pixels.")
        (:name :css-content-size :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "Size of scrollable area in CSS pixels."))
  :doc "Returns metrics relating to the layouting of the page, such as viewport bounds/scale." :experimental nil :deprecated nil)

(define-domain-command get-navigation-history
  :method "Page.getNavigationHistory"
  :params nil
  :returns (
        (:name :current-index :type :integer :ref nil :items nil :optional nil :doc "Index of the current navigation history entry.")
        (:name :entries :type :array :ref nil :items (:type :ref :ref "NavigationEntry") :optional nil :doc "Array of navigation history entries."))
  :doc "Returns navigation history for the current page." :experimental nil :deprecated nil)

(define-domain-command reset-navigation-history
  :method "Page.resetNavigationHistory"
  :params nil
  :returns nil
  :doc "Resets navigation history for the current page." :experimental nil :deprecated nil)

(define-domain-command get-resource-content
  :method "Page.getResourceContent"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Frame id to get resource for.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL of the resource to get content for."))
  :returns (
        (:name :content :type :string :ref nil :items nil :optional nil :doc "Resource content.")
        (:name :base64-encoded :type :boolean :ref nil :items nil :optional nil :doc "True, if content was served as base64."))
  :doc "Returns content of the given resource." :experimental t :deprecated nil)

(define-domain-command get-resource-tree
  :method "Page.getResourceTree"
  :params nil
  :returns (
        (:name :frame-tree :type :ref :ref "FrameResourceTree" :items nil :optional nil :doc "Present frame / resource tree structure."))
  :doc "Returns present frame / resource tree structure." :experimental t :deprecated nil)

(define-domain-command handle-java-script-dialog
  :method "Page.handleJavaScriptDialog"
  :params (
        (:name :accept :type :boolean :ref nil :items nil :optional nil :doc "Whether to accept or dismiss the dialog.")
        (:name :prompt-text :type :string :ref nil :items nil :optional t :doc "The text to enter into the dialog prompt before accepting. Used only if this is a prompt dialog."))
  :returns nil
  :doc "Accepts or dismisses a JavaScript initiated dialog (alert, confirm, prompt, or onbeforeunload)." :experimental nil :deprecated nil)

(define-domain-command navigate
  :method "Page.navigate"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL to navigate the page to.")
        (:name :referrer :type :string :ref nil :items nil :optional t :doc "Referrer URL.")
        (:name :transition-type :type :ref :ref "TransitionType" :items nil :optional t :doc "Intended transition type.")
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional t :doc "Frame id to navigate, if not specified navigates the top frame.")
        (:name :referrer-policy :type :ref :ref "ReferrerPolicy" :items nil :optional t :doc "Referrer-policy used for the navigation."))
  :returns (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Frame id that has navigated (or failed to navigate)")
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional t :doc "Loader identifier. This is omitted in case of same-document navigation, as the previously committed loaderId would not change.")
        (:name :error-text :type :string :ref nil :items nil :optional t :doc "User friendly error message, present if and only if navigation has failed.")
        (:name :is-download :type :boolean :ref nil :items nil :optional t :doc "Whether the navigation resulted in a download."))
  :doc "Navigates current page to the given URL." :experimental nil :deprecated nil)

(define-domain-command navigate-to-history-entry
  :method "Page.navigateToHistoryEntry"
  :params (
        (:name :entry-id :type :integer :ref nil :items nil :optional nil :doc "Unique id of the entry to navigate to."))
  :returns nil
  :doc "Navigates current page to the given history entry." :experimental nil :deprecated nil)

(define-domain-command print-to-pdf
  :method "Page.printToPDF"
  :params (
        (:name :landscape :type :boolean :ref nil :items nil :optional t :doc "Paper orientation. Defaults to false.")
        (:name :display-header-footer :type :boolean :ref nil :items nil :optional t :doc "Display header and footer. Defaults to false.")
        (:name :print-background :type :boolean :ref nil :items nil :optional t :doc "Print background graphics. Defaults to false.")
        (:name :scale :type :number :ref nil :items nil :optional t :doc "Scale of the webpage rendering. Defaults to 1.")
        (:name :paper-width :type :number :ref nil :items nil :optional t :doc "Paper width in inches. Defaults to 8.5 inches.")
        (:name :paper-height :type :number :ref nil :items nil :optional t :doc "Paper height in inches. Defaults to 11 inches.")
        (:name :margin-top :type :number :ref nil :items nil :optional t :doc "Top margin in inches. Defaults to 1cm (~0.4 inches).")
        (:name :margin-bottom :type :number :ref nil :items nil :optional t :doc "Bottom margin in inches. Defaults to 1cm (~0.4 inches).")
        (:name :margin-left :type :number :ref nil :items nil :optional t :doc "Left margin in inches. Defaults to 1cm (~0.4 inches).")
        (:name :margin-right :type :number :ref nil :items nil :optional t :doc "Right margin in inches. Defaults to 1cm (~0.4 inches).")
        (:name :page-ranges :type :string :ref nil :items nil :optional t :doc "Paper ranges to print, one based, e.g., '1-5, 8, 11-13'. Pages are printed in the document order, not in the order specified, and no more than once. Defaults to empty string, which implies the entire document is printed. The page numbers are quietly capped to actual page count of the document, and ranges beyond the end of the document are ignored. If this results in no pages to print, an error is reported. It is an error to specify a range with start greater than end.")
        (:name :header-template :type :string :ref nil :items nil :optional t :doc "HTML template for the print header. Should be valid HTML markup with following classes used to inject printing values into them: - `date`: formatted print date - `title`: document title - `url`: document location - `pageNumber`: current page number - `totalPages`: total pages in the document  For example, `<span class=title></span>` would generate span containing the title.")
        (:name :footer-template :type :string :ref nil :items nil :optional t :doc "HTML template for the print footer. Should use the same format as the `headerTemplate`.")
        (:name :prefer-css-page-size :type :boolean :ref nil :items nil :optional t :doc "Whether or not to prefer page size as defined by css. Defaults to false, in which case the content will be scaled to fit the paper size.")
        (:name :transfer-mode :type :string :ref nil :items nil :optional t :doc "return as stream")
        (:name :generate-tagged-pdf :type :boolean :ref nil :items nil :optional t :doc "Whether or not to generate tagged (accessible) PDF. Defaults to embedder choice.")
        (:name :generate-document-outline :type :boolean :ref nil :items nil :optional t :doc "Whether or not to embed the document outline into the PDF."))
  :returns (
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Base64-encoded pdf data. Empty if |returnAsStream| is specified. (Encoded as a base64 string when passed over JSON)")
        (:name :stream :type :ref :ref "IO.StreamHandle" :items nil :optional t :doc "A handle of the stream that holds resulting PDF data."))
  :doc "Print page as PDF." :experimental nil :deprecated nil)

(define-domain-command reload
  :method "Page.reload"
  :params (
        (:name :ignore-cache :type :boolean :ref nil :items nil :optional t :doc "If true, browser cache is ignored (as if the user pressed Shift+refresh).")
        (:name :script-to-evaluate-on-load :type :string :ref nil :items nil :optional t :doc "If set, the script will be injected into all frames of the inspected page after reload. Argument will be ignored if reloading dataURL origin.")
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional t :doc "If set, an error will be thrown if the target page's main frame's loader id does not match the provided id. This prevents accidentally reloading an unintended target in case there's a racing navigation."))
  :returns nil
  :doc "Reloads given page optionally ignoring the cache." :experimental nil :deprecated nil)

(define-domain-command remove-script-to-evaluate-on-load
  :method "Page.removeScriptToEvaluateOnLoad"
  :params (
        (:name :identifier :type :ref :ref "ScriptIdentifier" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Deprecated, please use removeScriptToEvaluateOnNewDocument instead." :experimental t :deprecated t)

(define-domain-command remove-script-to-evaluate-on-new-document
  :method "Page.removeScriptToEvaluateOnNewDocument"
  :params (
        (:name :identifier :type :ref :ref "ScriptIdentifier" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Removes given script from the list." :experimental nil :deprecated nil)

(define-domain-command screencast-frame-ack
  :method "Page.screencastFrameAck"
  :params (
        (:name :session-id :type :integer :ref nil :items nil :optional nil :doc "Frame number."))
  :returns nil
  :doc "Acknowledges that a screencast frame has been received by the frontend." :experimental t :deprecated nil)

(define-domain-command search-in-resource
  :method "Page.searchInResource"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Frame id for resource to search in.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL of the resource to search in.")
        (:name :query :type :string :ref nil :items nil :optional nil :doc "String to search for.")
        (:name :case-sensitive :type :boolean :ref nil :items nil :optional t :doc "If true, search is case sensitive.")
        (:name :is-regex :type :boolean :ref nil :items nil :optional t :doc "If true, treats string parameter as regex."))
  :returns (
        (:name :result :type :array :ref nil :items (:type :ref :ref "Debugger.SearchMatch") :optional nil :doc "List of search matches."))
  :doc "Searches for given string in resource content." :experimental t :deprecated nil)

(define-domain-command set-ad-blocking-enabled
  :method "Page.setAdBlockingEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether to block ads."))
  :returns nil
  :doc "Enable Chrome's experimental ad filter on all sites." :experimental t :deprecated nil)

(define-domain-command set-bypass-csp
  :method "Page.setBypassCSP"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether to bypass page CSP."))
  :returns nil
  :doc "Enable page Content Security Policy by-passing." :experimental nil :deprecated nil)

(define-domain-command get-permissions-policy-state
  :method "Page.getPermissionsPolicyState"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc ""))
  :returns (
        (:name :states :type :array :ref nil :items (:type :ref :ref "PermissionsPolicyFeatureState") :optional nil :doc ""))
  :doc "Get Permissions Policy state on given frame." :experimental t :deprecated nil)

(define-domain-command get-origin-trials
  :method "Page.getOriginTrials"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc ""))
  :returns (
        (:name :origin-trials :type :array :ref nil :items (:type :ref :ref "OriginTrial") :optional nil :doc ""))
  :doc "Get Origin Trials on given frame." :experimental t :deprecated nil)

(define-domain-command set-device-metrics-override
  :method "Page.setDeviceMetricsOverride"
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
        (:name :screen-orientation :type :ref :ref "Emulation.ScreenOrientation" :items nil :optional t :doc "Screen orientation override.")
        (:name :viewport :type :ref :ref "Viewport" :items nil :optional t :doc "The viewport dimensions and scale. If not set, the override is cleared."))
  :returns nil
  :doc "Overrides the values of device screen dimensions (window.screen.width, window.screen.height, window.innerWidth, window.innerHeight, and \"device-width\"/\"device-height\"-related CSS media query results)." :experimental t :deprecated t)

(define-domain-command set-device-orientation-override
  :method "Page.setDeviceOrientationOverride"
  :params (
        (:name :alpha :type :number :ref nil :items nil :optional nil :doc "Mock alpha")
        (:name :beta :type :number :ref nil :items nil :optional nil :doc "Mock beta")
        (:name :gamma :type :number :ref nil :items nil :optional nil :doc "Mock gamma"))
  :returns nil
  :doc "Overrides the Device Orientation." :experimental t :deprecated t)

(define-domain-command set-font-families
  :method "Page.setFontFamilies"
  :params (
        (:name :font-families :type :ref :ref "FontFamilies" :items nil :optional nil :doc "Specifies font families to set. If a font family is not specified, it won't be changed.")
        (:name :for-scripts :type :array :ref nil :items (:type :ref :ref "ScriptFontFamilies") :optional t :doc "Specifies font families to set for individual scripts."))
  :returns nil
  :doc "Set generic font families." :experimental t :deprecated nil)

(define-domain-command set-font-sizes
  :method "Page.setFontSizes"
  :params (
        (:name :font-sizes :type :ref :ref "FontSizes" :items nil :optional nil :doc "Specifies font sizes to set. If a font size is not specified, it won't be changed."))
  :returns nil
  :doc "Set default font sizes." :experimental t :deprecated nil)

(define-domain-command set-document-content
  :method "Page.setDocumentContent"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Frame id to set HTML for.")
        (:name :html :type :string :ref nil :items nil :optional nil :doc "HTML content to set."))
  :returns nil
  :doc "Sets given markup as the document's HTML." :experimental nil :deprecated nil)

(define-domain-command set-download-behavior
  :method "Page.setDownloadBehavior"
  :params (
        (:name :behavior :type :string :ref nil :items nil :optional nil :doc "Whether to allow all or deny all download requests, or use default Chrome behavior if available (otherwise deny).")
        (:name :download-path :type :string :ref nil :items nil :optional t :doc "The default path to save downloaded files to. This is required if behavior is set to 'allow'"))
  :returns nil
  :doc "Set the behavior when downloading a file." :experimental t :deprecated t)

(define-domain-command set-geolocation-override
  :method "Page.setGeolocationOverride"
  :params (
        (:name :latitude :type :number :ref nil :items nil :optional t :doc "Mock latitude")
        (:name :longitude :type :number :ref nil :items nil :optional t :doc "Mock longitude")
        (:name :accuracy :type :number :ref nil :items nil :optional t :doc "Mock accuracy"))
  :returns nil
  :doc "Overrides the Geolocation Position or Error. Omitting any of the parameters emulates position unavailable." :experimental nil :deprecated t)

(define-domain-command set-lifecycle-events-enabled
  :method "Page.setLifecycleEventsEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "If true, starts emitting lifecycle events."))
  :returns nil
  :doc "Controls whether page will emit lifecycle events." :experimental nil :deprecated nil)

(define-domain-command set-touch-emulation-enabled
  :method "Page.setTouchEmulationEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether the touch event emulation should be enabled.")
        (:name :configuration :type :string :ref nil :items nil :optional t :doc "Touch/gesture events configuration. Default: current platform."))
  :returns nil
  :doc "Toggles mouse event-based touch event emulation." :experimental t :deprecated t)

(define-domain-command start-screencast
  :method "Page.startScreencast"
  :params (
        (:name :format :type :string :ref nil :items nil :optional t :doc "Image compression format.")
        (:name :quality :type :integer :ref nil :items nil :optional t :doc "Compression quality from range [0..100].")
        (:name :max-width :type :integer :ref nil :items nil :optional t :doc "Maximum screenshot width.")
        (:name :max-height :type :integer :ref nil :items nil :optional t :doc "Maximum screenshot height.")
        (:name :every-nth-frame :type :integer :ref nil :items nil :optional t :doc "Send every n-th frame."))
  :returns nil
  :doc "Starts sending each frame using the `screencastFrame` event." :experimental t :deprecated nil)

(define-domain-command stop-loading
  :method "Page.stopLoading"
  :params nil
  :returns nil
  :doc "Force the page stop all navigations and pending resource fetches." :experimental nil :deprecated nil)

(define-domain-command crash
  :method "Page.crash"
  :params nil
  :returns nil
  :doc "Crashes renderer on the IO thread, generates minidumps." :experimental t :deprecated nil)

(define-domain-command close
  :method "Page.close"
  :params nil
  :returns nil
  :doc "Tries to close page, running its beforeunload hooks, if any." :experimental nil :deprecated nil)

(define-domain-command set-web-lifecycle-state
  :method "Page.setWebLifecycleState"
  :params (
        (:name :state :type :string :ref nil :items nil :optional nil :doc "Target lifecycle state"))
  :returns nil
  :doc "Tries to update the web lifecycle state of the page. It will transition the page to the given state according to: https://github.com/WICG/web-lifecycle/" :experimental t :deprecated nil)

(define-domain-command stop-screencast
  :method "Page.stopScreencast"
  :params nil
  :returns nil
  :doc "Stops sending each frame in the `screencastFrame`." :experimental t :deprecated nil)

(define-domain-command produce-compilation-cache
  :method "Page.produceCompilationCache"
  :params (
        (:name :scripts :type :array :ref nil :items (:type :ref :ref "CompilationCacheParams") :optional nil :doc ""))
  :returns nil
  :doc "Requests backend to produce compilation cache for the specified scripts. `scripts` are appended to the list of scripts for which the cache would be produced. The list may be reset during page navigation. When script with a matching URL is encountered, the cache is optionally produced upon backend discretion, based on internal heuristics. See also: `Page.compilationCacheProduced`." :experimental t :deprecated nil)

(define-domain-command add-compilation-cache
  :method "Page.addCompilationCache"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Base64-encoded data (Encoded as a base64 string when passed over JSON)"))
  :returns nil
  :doc "Seeds compilation cache for given url. Compilation cache does not survive cross-process navigation." :experimental t :deprecated nil)

(define-domain-command clear-compilation-cache
  :method "Page.clearCompilationCache"
  :params nil
  :returns nil
  :doc "Clears seeded compilation cache." :experimental t :deprecated nil)

(define-domain-command set-spc-transaction-mode
  :method "Page.setSPCTransactionMode"
  :params (
        (:name :mode :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Sets the Secure Payment Confirmation transaction mode. https://w3c.github.io/secure-payment-confirmation/#sctn-automation-set-spc-transaction-mode" :experimental t :deprecated nil)

(define-domain-command set-rph-registration-mode
  :method "Page.setRPHRegistrationMode"
  :params (
        (:name :mode :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Extensions for Custom Handlers API: https://html.spec.whatwg.org/multipage/system-state.html#rph-automation" :experimental t :deprecated nil)

(define-domain-command generate-test-report
  :method "Page.generateTestReport"
  :params (
        (:name :message :type :string :ref nil :items nil :optional nil :doc "Message to be displayed in the report.")
        (:name :group :type :string :ref nil :items nil :optional t :doc "Specifies the endpoint group to deliver the report to."))
  :returns nil
  :doc "Generates a report for testing." :experimental t :deprecated nil)

(define-domain-command wait-for-debugger
  :method "Page.waitForDebugger"
  :params nil
  :returns nil
  :doc "Pauses page execution. Can be resumed using generic Runtime.runIfWaitingForDebugger." :experimental t :deprecated nil)

(define-domain-command set-intercept-file-chooser-dialog
  :method "Page.setInterceptFileChooserDialog"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :cancel :type :boolean :ref nil :items nil :optional t :doc "If true, cancels the dialog by emitting relevant events (if any) in addition to not showing it if the interception is enabled (default: false)."))
  :returns nil
  :doc "Intercept file chooser requests and transfer control to protocol clients. When file chooser interception is enabled, native file chooser dialog is not shown. Instead, a protocol event `Page.fileChooserOpened` is emitted." :experimental nil :deprecated nil)

(define-domain-command set-prerendering-allowed
  :method "Page.setPrerenderingAllowed"
  :params (
        (:name :is-allowed :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Enable/disable prerendering manually.  This command is a short-term solution for https://crbug.com/1440085. See https://docs.google.com/document/d/12HVmFxYj5Jc-eJr5OmWsa2bqTJsbgGLKI6ZIyx0_wpA for more details.  TODO(https://crbug.com/1440085): Remove this once Puppeteer supports tab targets." :experimental t :deprecated nil)

(define-domain-command get-annotated-page-content
  :method "Page.getAnnotatedPageContent"
  :params (
        (:name :include-actionable-information :type :boolean :ref nil :items nil :optional t :doc "Whether to include actionable information. Defaults to true."))
  :returns (
        (:name :content :type :string :ref nil :items nil :optional nil :doc "The annotated page content as a base64 encoded protobuf. The format is defined by the `AnnotatedPageContent` message in components/optimization_guide/proto/features/common_quality_data.proto (Encoded as a base64 string when passed over JSON)"))
  :doc "Get the annotated page content for the main frame. This is an experimental command that is subject to change." :experimental t :deprecated nil)

(define-domain-event dom-content-event-fired
  :method "Page.domContentEventFired"
  :params (
        (:name :timestamp :type :ref :ref "Network.MonotonicTime" :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event file-chooser-opened
  :method "Page.fileChooserOpened"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame containing input node.")
        (:name :mode :type :string :ref nil :items nil :optional nil :doc "Input mode.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Input node id. Only present for file choosers opened via an `<input type=\"file\">` element."))
  :doc "Emitted only when `page.interceptFileChooser` is enabled." :experimental nil :deprecated nil)

(define-domain-event frame-attached
  :method "Page.frameAttached"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that has been attached.")
        (:name :parent-frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Parent frame identifier.")
        (:name :stack :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "JavaScript stack trace of when frame was attached, only set if frame initiated from script."))
  :doc "Fired when frame has been attached to its parent." :experimental nil :deprecated nil)

(define-domain-event frame-cleared-scheduled-navigation
  :method "Page.frameClearedScheduledNavigation"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that has cleared its scheduled navigation."))
  :doc "Fired when frame no longer has a scheduled navigation." :experimental nil :deprecated t)

(define-domain-event frame-detached
  :method "Page.frameDetached"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that has been detached.")
        (:name :reason :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when frame has been detached from its parent." :experimental nil :deprecated nil)

(define-domain-event frame-subtree-will-be-detached
  :method "Page.frameSubtreeWillBeDetached"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that is the root of the subtree that will be detached."))
  :doc "Fired before frame subtree is detached. Emitted before any frame of the subtree is actually detached." :experimental t :deprecated nil)

(define-domain-event frame-navigated
  :method "Page.frameNavigated"
  :params (
        (:name :frame :type :ref :ref "Frame" :items nil :optional nil :doc "Frame object.")
        (:name :type :type :ref :ref "NavigationType" :items nil :optional nil :doc ""))
  :doc "Fired once navigation of the frame has completed. Frame is now associated with the new loader." :experimental nil :deprecated nil)

(define-domain-event document-opened
  :method "Page.documentOpened"
  :params (
        (:name :frame :type :ref :ref "Frame" :items nil :optional nil :doc "Frame object."))
  :doc "Fired when opening document to write to." :experimental t :deprecated nil)

(define-domain-event frame-resized
  :method "Page.frameResized"
  :params nil
  :doc "" :experimental t :deprecated nil)

(define-domain-event frame-started-navigating
  :method "Page.frameStartedNavigating"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "ID of the frame that is being navigated.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The URL the navigation started with. The final URL can be different.")
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional nil :doc "Loader identifier. Even though it is present in case of same-document navigation, the previously committed loaderId would not change unless the navigation changes from a same-document to a cross-document navigation.")
        (:name :navigation-type :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when a navigation starts. This event is fired for both renderer-initiated and browser-initiated navigations. For renderer-initiated navigations, the event is fired after `frameRequestedNavigation`. Navigation may still be cancelled after the event is issued. Multiple events can be fired for a single navigation, for example, when a same-document navigation becomes a cross-document navigation (such as in the case of a frameset)." :experimental t :deprecated nil)

(define-domain-event frame-requested-navigation
  :method "Page.frameRequestedNavigation"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that is being navigated.")
        (:name :reason :type :ref :ref "ClientNavigationReason" :items nil :optional nil :doc "The reason for the navigation.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The destination URL for the requested navigation.")
        (:name :disposition :type :ref :ref "ClientNavigationDisposition" :items nil :optional nil :doc "The disposition for the navigation."))
  :doc "Fired when a renderer-initiated navigation is requested. Navigation may still be cancelled after the event is issued." :experimental t :deprecated nil)

(define-domain-event frame-scheduled-navigation
  :method "Page.frameScheduledNavigation"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that has scheduled a navigation.")
        (:name :delay :type :number :ref nil :items nil :optional nil :doc "Delay (in seconds) until the navigation is scheduled to begin. The navigation is not guaranteed to start.")
        (:name :reason :type :ref :ref "ClientNavigationReason" :items nil :optional nil :doc "The reason for the navigation.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The destination URL for the scheduled navigation."))
  :doc "Fired when frame schedules a potential navigation." :experimental nil :deprecated t)

(define-domain-event frame-started-loading
  :method "Page.frameStartedLoading"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that has started loading."))
  :doc "Fired when frame has started loading." :experimental t :deprecated nil)

(define-domain-event frame-stopped-loading
  :method "Page.frameStoppedLoading"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that has stopped loading."))
  :doc "Fired when frame has stopped loading." :experimental t :deprecated nil)

(define-domain-event download-will-begin
  :method "Page.downloadWillBegin"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame that caused download to begin.")
        (:name :guid :type :string :ref nil :items nil :optional nil :doc "Global unique identifier of the download.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL of the resource being downloaded.")
        (:name :suggested-filename :type :string :ref nil :items nil :optional nil :doc "Suggested file name of the resource (the actual name of the file saved on disk may differ)."))
  :doc "Fired when page is about to start a download. Deprecated. Use Browser.downloadWillBegin instead." :experimental t :deprecated t)

(define-domain-event download-progress
  :method "Page.downloadProgress"
  :params (
        (:name :guid :type :string :ref nil :items nil :optional nil :doc "Global unique identifier of the download.")
        (:name :total-bytes :type :number :ref nil :items nil :optional nil :doc "Total expected bytes to download.")
        (:name :received-bytes :type :number :ref nil :items nil :optional nil :doc "Total bytes received.")
        (:name :state :type :string :ref nil :items nil :optional nil :doc "Download status."))
  :doc "Fired when download makes progress. Last call has |done| == true. Deprecated. Use Browser.downloadProgress instead." :experimental t :deprecated t)

(define-domain-event interstitial-hidden
  :method "Page.interstitialHidden"
  :params nil
  :doc "Fired when interstitial page was hidden" :experimental nil :deprecated nil)

(define-domain-event interstitial-shown
  :method "Page.interstitialShown"
  :params nil
  :doc "Fired when interstitial page was shown" :experimental nil :deprecated nil)

(define-domain-event javascript-dialog-closed
  :method "Page.javascriptDialogClosed"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Frame id.")
        (:name :result :type :boolean :ref nil :items nil :optional nil :doc "Whether dialog was confirmed.")
        (:name :user-input :type :string :ref nil :items nil :optional nil :doc "User input in case of prompt."))
  :doc "Fired when a JavaScript initiated dialog (alert, confirm, prompt, or onbeforeunload) has been closed." :experimental nil :deprecated nil)

(define-domain-event javascript-dialog-opening
  :method "Page.javascriptDialogOpening"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Frame url.")
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Frame id.")
        (:name :message :type :string :ref nil :items nil :optional nil :doc "Message that will be displayed by the dialog.")
        (:name :type :type :ref :ref "DialogType" :items nil :optional nil :doc "Dialog type.")
        (:name :has-browser-handler :type :boolean :ref nil :items nil :optional nil :doc "True iff browser is capable showing or acting on the given dialog. When browser has no dialog handler for given target, calling alert while Page domain is engaged will stall the page execution. Execution can be resumed via calling Page.handleJavaScriptDialog.")
        (:name :default-prompt :type :string :ref nil :items nil :optional t :doc "Default dialog prompt."))
  :doc "Fired when a JavaScript initiated dialog (alert, confirm, prompt, or onbeforeunload) is about to open." :experimental nil :deprecated nil)

(define-domain-event lifecycle-event
  :method "Page.lifecycleEvent"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame.")
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional nil :doc "Loader identifier. Empty string if the request is fetched from worker.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "Network.MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired for lifecycle events (navigation, load, paint, etc) in the current target (including local frames)." :experimental nil :deprecated nil)

(define-domain-event back-forward-cache-not-used
  :method "Page.backForwardCacheNotUsed"
  :params (
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional nil :doc "The loader id for the associated navigation.")
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "The frame id of the associated frame.")
        (:name :not-restored-explanations :type :array :ref nil :items (:type :ref :ref "BackForwardCacheNotRestoredExplanation") :optional nil :doc "Array of reasons why the page could not be cached. This must not be empty.")
        (:name :not-restored-explanations-tree :type :ref :ref "BackForwardCacheNotRestoredExplanationTree" :items nil :optional t :doc "Tree structure of reasons why the page could not be cached for each frame."))
  :doc "Fired for failed bfcache history navigations if BackForwardCache feature is enabled. Do not assume any ordering with the Page.frameNavigated event. This event is fired only for main-frame history navigation where the document changes (non-same-document navigations), when bfcache navigation fails." :experimental t :deprecated nil)

(define-domain-event load-event-fired
  :method "Page.loadEventFired"
  :params (
        (:name :timestamp :type :ref :ref "Network.MonotonicTime" :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event navigated-within-document
  :method "Page.navigatedWithinDocument"
  :params (
        (:name :frame-id :type :ref :ref "FrameId" :items nil :optional nil :doc "Id of the frame.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Frame's new url.")
        (:name :navigation-type :type :string :ref nil :items nil :optional nil :doc "Navigation type"))
  :doc "Fired when same-document navigation happens, e.g. due to history API usage or anchor navigation." :experimental t :deprecated nil)

(define-domain-event screencast-frame
  :method "Page.screencastFrame"
  :params (
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Base64-encoded compressed image. (Encoded as a base64 string when passed over JSON)")
        (:name :metadata :type :ref :ref "ScreencastFrameMetadata" :items nil :optional nil :doc "Screencast frame metadata.")
        (:name :session-id :type :integer :ref nil :items nil :optional nil :doc "Frame number."))
  :doc "Compressed image data requested by the `startScreencast`." :experimental t :deprecated nil)

(define-domain-event screencast-visibility-changed
  :method "Page.screencastVisibilityChanged"
  :params (
        (:name :visible :type :boolean :ref nil :items nil :optional nil :doc "True if the page is visible."))
  :doc "Fired when the page with currently enabled screencast was shown or hidden `." :experimental t :deprecated nil)

(define-domain-event window-open
  :method "Page.windowOpen"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The URL for the new window.")
        (:name :window-name :type :string :ref nil :items nil :optional nil :doc "Window name.")
        (:name :window-features :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "An array of enabled window features.")
        (:name :user-gesture :type :boolean :ref nil :items nil :optional nil :doc "Whether or not it was triggered by user gesture."))
  :doc "Fired when a new window is going to be opened, via window.open(), link click, form submission, etc." :experimental nil :deprecated nil)

(define-domain-event compilation-cache-produced
  :method "Page.compilationCacheProduced"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Base64-encoded data (Encoded as a base64 string when passed over JSON)"))
  :doc "Issued for every compilation cache generated." :experimental t :deprecated nil)

