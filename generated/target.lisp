;;;; Target CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/target
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/target)

(define-domain-type target-id
  :cdp-id "TargetID" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type session-id
  :cdp-id "SessionID" :type :string
  :properties nil
  :enum nil
  :doc "Unique identifier of attached debugging session." :experimental nil :deprecated nil)

(define-domain-type target-info
  :cdp-id "TargetInfo" :type :object
  :properties (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "")
        (:name :type :type :string :ref nil :items nil :optional nil :doc "List of types: https://source.chromium.org/chromium/chromium/src/+/main:content/browser/devtools/devtools_agent_host_impl.cc?ss=chromium&q=f:devtools%20-f:out%20%22::kTypeTab%5B%5D%22")
        (:name :title :type :string :ref nil :items nil :optional nil :doc "")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :attached :type :boolean :ref nil :items nil :optional nil :doc "Whether the target has an attached client.")
        (:name :opener-id :type :ref :ref "TargetID" :items nil :optional t :doc "Opener target Id")
        (:name :can-access-opener :type :boolean :ref nil :items nil :optional nil :doc "Whether the target has access to the originating window.")
        (:name :opener-frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "Frame id of originating window (is only set if target has an opener).")
        (:name :parent-frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "Id of the parent frame, only present for the \"iframe\" targets.")
        (:name :browser-context-id :type :ref :ref "Browser.BrowserContextID" :items nil :optional t :doc "")
        (:name :subtype :type :string :ref nil :items nil :optional t :doc "Provides additional details for specific target types. For example, for the type of \"page\", this may be set to \"prerender\"."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type filter-entry
  :cdp-id "FilterEntry" :type :object
  :properties (
        (:name :exclude :type :boolean :ref nil :items nil :optional t :doc "If set, causes exclusion of matching targets from the list.")
        (:name :type :type :string :ref nil :items nil :optional t :doc "If not present, matches any type."))
  :enum nil
  :doc "A filter used by target query/discovery/auto-attach operations." :experimental t :deprecated nil)

(define-domain-type target-filter
  :cdp-id "TargetFilter" :type :array
  :properties nil
  :enum nil
  :doc "The entries in TargetFilter are matched sequentially against targets and the first entry that matches determines if the target is included or not, depending on the value of `exclude` field in the entry. If filter is not specified, the one assumed is [{type: \"browser\", exclude: true}, {type: \"tab\", exclude: true}, {}] (i.e. include everything but `browser` and `tab`)." :experimental t :deprecated nil)

(define-domain-type remote-location
  :cdp-id "RemoteLocation" :type :object
  :properties (
        (:name :host :type :string :ref nil :items nil :optional nil :doc "")
        (:name :port :type :integer :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type window-state
  :cdp-id "WindowState" :type :string
  :properties nil
  :enum '("normal" "minimized" "maximized" "fullscreen")
  :doc "The state of the target window." :experimental t :deprecated nil)

(define-domain-command activate-target
  :method "Target.activateTarget"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Activates (focuses) the target." :experimental nil :deprecated nil)

(define-domain-command attach-to-target
  :method "Target.attachToTarget"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "")
        (:name :flatten :type :boolean :ref nil :items nil :optional t :doc "Enables \"flat\" access to the session via specifying sessionId attribute in the commands. We plan to make this the default, deprecate non-flattened mode, and eventually retire it. See crbug.com/991325."))
  :returns (
        (:name :session-id :type :ref :ref "SessionID" :items nil :optional nil :doc "Id assigned to the session."))
  :doc "Attaches to the target with given id." :experimental nil :deprecated nil)

(define-domain-command attach-to-browser-target
  :method "Target.attachToBrowserTarget"
  :params nil
  :returns (
        (:name :session-id :type :ref :ref "SessionID" :items nil :optional nil :doc "Id assigned to the session."))
  :doc "Attaches to the browser target, only uses flat sessionId mode." :experimental t :deprecated nil)

(define-domain-command close-target
  :method "Target.closeTarget"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc ""))
  :returns (
        (:name :success :type :boolean :ref nil :items nil :optional nil :doc "Always set to true. If an error occurs, the response indicates protocol error."))
  :doc "Closes the target. If the target is a page that gets closed too." :experimental nil :deprecated nil)

(define-domain-command expose-dev-tools-protocol
  :method "Target.exposeDevToolsProtocol"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "")
        (:name :binding-name :type :string :ref nil :items nil :optional t :doc "Binding name, 'cdp' if not specified.")
        (:name :inherit-permissions :type :boolean :ref nil :items nil :optional t :doc "If true, inherits the current root session's permissions (default: false)."))
  :returns nil
  :doc "Inject object to the target's main frame that provides a communication channel with browser target.  Injected object will be available as `window[bindingName]`.  The object has the following API: - `binding.send(json)` - a method to send messages over the remote debugging protocol - `binding.onmessage = json => handleMessage(json)` - a callback that will be called for the protocol notifications and command responses." :experimental t :deprecated nil)

(define-domain-command create-browser-context
  :method "Target.createBrowserContext"
  :params (
        (:name :dispose-on-detach :type :boolean :ref nil :items nil :optional t :doc "If specified, disposes this context when debugging session disconnects.")
        (:name :proxy-server :type :string :ref nil :items nil :optional t :doc "Proxy server, similar to the one passed to --proxy-server")
        (:name :proxy-bypass-list :type :string :ref nil :items nil :optional t :doc "Proxy bypass list, similar to the one passed to --proxy-bypass-list")
        (:name :origins-with-universal-network-access :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "An optional list of origins to grant unlimited cross-origin access to. Parts of the URL other than those constituting origin are ignored."))
  :returns (
        (:name :browser-context-id :type :ref :ref "Browser.BrowserContextID" :items nil :optional nil :doc "The id of the context created."))
  :doc "Creates a new empty BrowserContext. Similar to an incognito profile but you can have more than one." :experimental nil :deprecated nil)

(define-domain-command get-browser-contexts
  :method "Target.getBrowserContexts"
  :params nil
  :returns (
        (:name :browser-context-ids :type :array :ref nil :items (:type :ref :ref "Browser.BrowserContextID") :optional nil :doc "An array of browser context ids.")
        (:name :default-browser-context-id :type :ref :ref "Browser.BrowserContextID" :items nil :optional t :doc "The id of the default browser context if available."))
  :doc "Returns all browser contexts created with `Target.createBrowserContext` method." :experimental nil :deprecated nil)

(define-domain-command create-target
  :method "Target.createTarget"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The initial URL the page will be navigated to. An empty string indicates about:blank.")
        (:name :left :type :integer :ref nil :items nil :optional t :doc "Frame left origin in DIP (requires newWindow to be true or headless shell).")
        (:name :top :type :integer :ref nil :items nil :optional t :doc "Frame top origin in DIP (requires newWindow to be true or headless shell).")
        (:name :width :type :integer :ref nil :items nil :optional t :doc "Frame width in DIP (requires newWindow to be true or headless shell).")
        (:name :height :type :integer :ref nil :items nil :optional t :doc "Frame height in DIP (requires newWindow to be true or headless shell).")
        (:name :window-state :type :ref :ref "WindowState" :items nil :optional t :doc "Frame window state (requires newWindow to be true or headless shell). Default is normal.")
        (:name :browser-context-id :type :ref :ref "Browser.BrowserContextID" :items nil :optional t :doc "The browser context to create the page in.")
        (:name :enable-begin-frame-control :type :boolean :ref nil :items nil :optional t :doc "Whether BeginFrames for this target will be controlled via DevTools (headless shell only, not supported on MacOS yet, false by default).")
        (:name :new-window :type :boolean :ref nil :items nil :optional t :doc "Whether to create a new Window or Tab (false by default, not supported by headless shell).")
        (:name :background :type :boolean :ref nil :items nil :optional t :doc "Whether to create the target in background or foreground (false by default, not supported by headless shell).")
        (:name :for-tab :type :boolean :ref nil :items nil :optional t :doc "Whether to create the target of type \"tab\".")
        (:name :hidden :type :boolean :ref nil :items nil :optional t :doc "Whether to create a hidden target. The hidden target is observable via protocol, but not present in the tab UI strip. Cannot be created with `forTab: true`, `newWindow: true` or `background: false`. The life-time of the tab is limited to the life-time of the session.")
        (:name :focus :type :boolean :ref nil :items nil :optional t :doc "If specified, the option is used to determine if the new target should be focused or not. By default, the focus behavior depends on the value of the background field. For example, background=false and focus=false will result in the target tab being opened but the browser window remain unchanged (if it was in the background, it will remain in the background) and background=false with focus=undefined will result in the window being focused. Using background: true and focus: true is not supported and will result in an error."))
  :returns (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "The id of the page opened."))
  :doc "Creates a new page." :experimental nil :deprecated nil)

(define-domain-command detach-from-target
  :method "Target.detachFromTarget"
  :params (
        (:name :session-id :type :ref :ref "SessionID" :items nil :optional t :doc "Session to detach.")
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional t :doc "Deprecated."))
  :returns nil
  :doc "Detaches session with given id." :experimental nil :deprecated nil)

(define-domain-command dispose-browser-context
  :method "Target.disposeBrowserContext"
  :params (
        (:name :browser-context-id :type :ref :ref "Browser.BrowserContextID" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Deletes a BrowserContext. All the belonging pages will be closed without calling their beforeunload hooks." :experimental nil :deprecated nil)

(define-domain-command get-target-info
  :method "Target.getTargetInfo"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional t :doc ""))
  :returns (
        (:name :target-info :type :ref :ref "TargetInfo" :items nil :optional nil :doc ""))
  :doc "Returns information about a target." :experimental t :deprecated nil)

(define-domain-command get-targets
  :method "Target.getTargets"
  :params (
        (:name :filter :type :ref :ref "TargetFilter" :items nil :optional t :doc "Only targets matching filter will be reported. If filter is not specified and target discovery is currently enabled, a filter used for target discovery is used for consistency."))
  :returns (
        (:name :target-infos :type :array :ref nil :items (:type :ref :ref "TargetInfo") :optional nil :doc "The list of targets."))
  :doc "Retrieves a list of available targets." :experimental nil :deprecated nil)

(define-domain-command send-message-to-target
  :method "Target.sendMessageToTarget"
  :params (
        (:name :message :type :string :ref nil :items nil :optional nil :doc "")
        (:name :session-id :type :ref :ref "SessionID" :items nil :optional t :doc "Identifier of the session.")
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional t :doc "Deprecated."))
  :returns nil
  :doc "Sends protocol message over session with given id. Consider using flat mode instead; see commands attachToTarget, setAutoAttach, and crbug.com/991325." :experimental nil :deprecated t)

(define-domain-command set-auto-attach
  :method "Target.setAutoAttach"
  :params (
        (:name :auto-attach :type :boolean :ref nil :items nil :optional nil :doc "Whether to auto-attach to related targets.")
        (:name :wait-for-debugger-on-start :type :boolean :ref nil :items nil :optional nil :doc "Whether to pause new targets when attaching to them. Use `Runtime.runIfWaitingForDebugger` to run paused targets.")
        (:name :flatten :type :boolean :ref nil :items nil :optional t :doc "Enables \"flat\" access to the session via specifying sessionId attribute in the commands. We plan to make this the default, deprecate non-flattened mode, and eventually retire it. See crbug.com/991325.")
        (:name :filter :type :ref :ref "TargetFilter" :items nil :optional t :doc "Only targets matching filter will be attached."))
  :returns nil
  :doc "Controls whether to automatically attach to new targets which are considered to be directly related to this one (for example, iframes or workers). When turned on, attaches to all existing related targets as well. When turned off, automatically detaches from all currently attached targets. This also clears all targets added by `autoAttachRelated` from the list of targets to watch for creation of related targets. You might want to call this recursively for auto-attached targets to attach to all available targets." :experimental nil :deprecated nil)

(define-domain-command auto-attach-related
  :method "Target.autoAttachRelated"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "")
        (:name :wait-for-debugger-on-start :type :boolean :ref nil :items nil :optional nil :doc "Whether to pause new targets when attaching to them. Use `Runtime.runIfWaitingForDebugger` to run paused targets.")
        (:name :filter :type :ref :ref "TargetFilter" :items nil :optional t :doc "Only targets matching filter will be attached."))
  :returns nil
  :doc "Adds the specified target to the list of targets that will be monitored for any related target creation (such as child frames, child workers and new versions of service worker) and reported through `attachedToTarget`. The specified target is also auto-attached. This cancels the effect of any previous `setAutoAttach` and is also cancelled by subsequent `setAutoAttach`. Only available at the Browser target." :experimental t :deprecated nil)

(define-domain-command set-discover-targets
  :method "Target.setDiscoverTargets"
  :params (
        (:name :discover :type :boolean :ref nil :items nil :optional nil :doc "Whether to discover available targets.")
        (:name :filter :type :ref :ref "TargetFilter" :items nil :optional t :doc "Only targets matching filter will be attached. If `discover` is false, `filter` must be omitted or empty."))
  :returns nil
  :doc "Controls whether to discover available targets and notify via `targetCreated/targetInfoChanged/targetDestroyed` events." :experimental nil :deprecated nil)

(define-domain-command set-remote-locations
  :method "Target.setRemoteLocations"
  :params (
        (:name :locations :type :array :ref nil :items (:type :ref :ref "RemoteLocation") :optional nil :doc "List of remote locations."))
  :returns nil
  :doc "Enables target discovery for the specified locations, when `setDiscoverTargets` was set to `true`." :experimental t :deprecated nil)

(define-domain-command get-dev-tools-target
  :method "Target.getDevToolsTarget"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "Page or tab target ID."))
  :returns (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional t :doc "The targetId of DevTools page target if exists."))
  :doc "Gets the targetId of the DevTools page target opened for the given target (if any)." :experimental t :deprecated nil)

(define-domain-command open-dev-tools
  :method "Target.openDevTools"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "This can be the page or tab target ID.")
        (:name :panel-id :type :string :ref nil :items nil :optional t :doc "The id of the panel we want DevTools to open initially. Currently supported panels are elements, console, network, sources, resources and performance."))
  :returns (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "The targetId of DevTools page target."))
  :doc "Opens a DevTools window for the target." :experimental t :deprecated nil)

(define-domain-event attached-to-target
  :method "Target.attachedToTarget"
  :params (
        (:name :session-id :type :ref :ref "SessionID" :items nil :optional nil :doc "Identifier assigned to the session used to send/receive messages.")
        (:name :target-info :type :ref :ref "TargetInfo" :items nil :optional nil :doc "")
        (:name :waiting-for-debugger :type :boolean :ref nil :items nil :optional nil :doc ""))
  :doc "Issued when attached to target because of auto-attach or `attachToTarget` command." :experimental t :deprecated nil)

(define-domain-event detached-from-target
  :method "Target.detachedFromTarget"
  :params (
        (:name :session-id :type :ref :ref "SessionID" :items nil :optional nil :doc "Detached session identifier.")
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional t :doc "Deprecated."))
  :doc "Issued when detached from target for any reason (including `detachFromTarget` command). Can be issued multiple times per target if multiple sessions have been attached to it." :experimental t :deprecated nil)

(define-domain-event received-message-from-target
  :method "Target.receivedMessageFromTarget"
  :params (
        (:name :session-id :type :ref :ref "SessionID" :items nil :optional nil :doc "Identifier of a session which sends a message.")
        (:name :message :type :string :ref nil :items nil :optional nil :doc "")
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional t :doc "Deprecated."))
  :doc "Notifies about a new protocol message received from the session (as reported in `attachedToTarget` event)." :experimental nil :deprecated nil)

(define-domain-event target-created
  :method "Target.targetCreated"
  :params (
        (:name :target-info :type :ref :ref "TargetInfo" :items nil :optional nil :doc ""))
  :doc "Issued when a possible inspection target is created." :experimental nil :deprecated nil)

(define-domain-event target-destroyed
  :method "Target.targetDestroyed"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc ""))
  :doc "Issued when a target is destroyed." :experimental nil :deprecated nil)

(define-domain-event target-crashed
  :method "Target.targetCrashed"
  :params (
        (:name :target-id :type :ref :ref "TargetID" :items nil :optional nil :doc "")
        (:name :status :type :string :ref nil :items nil :optional nil :doc "Termination status type.")
        (:name :error-code :type :integer :ref nil :items nil :optional nil :doc "Termination error code."))
  :doc "Issued when a target has crashed." :experimental nil :deprecated nil)

(define-domain-event target-info-changed
  :method "Target.targetInfoChanged"
  :params (
        (:name :target-info :type :ref :ref "TargetInfo" :items nil :optional nil :doc ""))
  :doc "Issued when some information about a target has changed. This only happens between `targetCreated` and `targetDestroyed`." :experimental nil :deprecated nil)

