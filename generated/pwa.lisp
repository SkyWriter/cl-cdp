;;;; PWA CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/pwa
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/pwa)

(define-domain-type file-handler-accept
  :cdp-id "FileHandlerAccept" :type :object
  :properties (
        (:name :media-type :type :string :ref nil :items nil :optional nil :doc "New name of the mimetype according to https://www.iana.org/assignments/media-types/media-types.xhtml")
        (:name :file-extensions :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :enum nil
  :doc "The following types are the replica of https://crsrc.org/c/chrome/browser/web_applications/proto/web_app_os_integration_state.proto;drc=9910d3be894c8f142c977ba1023f30a656bc13fc;l=67" :experimental nil :deprecated nil)

(define-domain-type file-handler
  :cdp-id "FileHandler" :type :object
  :properties (
        (:name :action :type :string :ref nil :items nil :optional nil :doc "")
        (:name :accepts :type :array :ref nil :items (:type :ref :ref "FileHandlerAccept") :optional nil :doc "")
        (:name :display-name :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type display-mode
  :cdp-id "DisplayMode" :type :string
  :properties nil
  :enum '("standalone" "browser")
  :doc "If user prefers opening the app in browser or an app window." :experimental nil :deprecated nil)

(define-domain-command get-os-app-state
  :method "PWA.getOsAppState"
  :params (
        (:name :manifest-id :type :string :ref nil :items nil :optional nil :doc "The id from the webapp's manifest file, commonly it's the url of the site installing the webapp. See https://web.dev/learn/pwa/web-app-manifest."))
  :returns (
        (:name :badge-count :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :file-handlers :type :array :ref nil :items (:type :ref :ref "FileHandler") :optional nil :doc ""))
  :doc "Returns the following OS state for the given manifest id." :experimental nil :deprecated nil)

(define-domain-command install
  :method "PWA.install"
  :params (
        (:name :manifest-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :install-url-or-bundle-url :type :string :ref nil :items nil :optional t :doc "The location of the app or bundle overriding the one derived from the manifestId."))
  :returns nil
  :doc "Installs the given manifest identity, optionally using the given installUrlOrBundleUrl  IWA-specific install description: manifestId corresponds to isolated-app:// + web_package::SignedWebBundleId  File installation mode: The installUrlOrBundleUrl can be either file:// or http(s):// pointing to a signed web bundle (.swbn). In this case SignedWebBundleId must correspond to The .swbn file's signing key.  Dev proxy installation mode: installUrlOrBundleUrl must be http(s):// that serves dev mode IWA. web_package::SignedWebBundleId must be of type dev proxy.  The advantage of dev proxy mode is that all changes to IWA automatically will be reflected in the running app without reinstallation.  To generate bundle id for proxy mode: 1. Generate 32 random bytes. 2. Add a specific suffix at the end following the documentation    https://github.com/WICG/isolated-web-apps/blob/main/Scheme.md#suffix 3. Encode the entire sequence using Base32 without padding.  If Chrome is not in IWA dev mode, the installation will fail, regardless of the state of the allowlist." :experimental nil :deprecated nil)

(define-domain-command uninstall
  :method "PWA.uninstall"
  :params (
        (:name :manifest-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Uninstalls the given manifest_id and closes any opened app windows." :experimental nil :deprecated nil)

(define-domain-command launch
  :method "PWA.launch"
  :params (
        (:name :manifest-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :url :type :string :ref nil :items nil :optional t :doc ""))
  :returns (
        (:name :target-id :type :ref :ref "Target.TargetID" :items nil :optional nil :doc "ID of the tab target created as a result."))
  :doc "Launches the installed web app, or an url in the same web app instead of the default start url if it is provided. Returns a page Target.TargetID which can be used to attach to via Target.attachToTarget or similar APIs." :experimental nil :deprecated nil)

(define-domain-command launch-files-in-app
  :method "PWA.launchFilesInApp"
  :params (
        (:name :manifest-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :files :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :returns (
        (:name :target-ids :type :array :ref nil :items (:type :ref :ref "Target.TargetID") :optional nil :doc "IDs of the tab targets created as the result."))
  :doc "Opens one or more local files from an installed web app identified by its manifestId. The web app needs to have file handlers registered to process the files. The API returns one or more page Target.TargetIDs which can be used to attach to via Target.attachToTarget or similar APIs. If some files in the parameters cannot be handled by the web app, they will be ignored. If none of the files can be handled, this API returns an error. If no files are provided as the parameter, this API also returns an error.  According to the definition of the file handlers in the manifest file, one Target.TargetID may represent a page handling one or more files. The order of the returned Target.TargetIDs is not guaranteed.  TODO(crbug.com/339454034): Check the existences of the input files." :experimental nil :deprecated nil)

(define-domain-command open-current-page-in-app
  :method "PWA.openCurrentPageInApp"
  :params (
        (:name :manifest-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Opens the current page in its web app identified by the manifest id, needs to be called on a page target. This function returns immediately without waiting for the app to finish loading." :experimental nil :deprecated nil)

(define-domain-command change-app-user-settings
  :method "PWA.changeAppUserSettings"
  :params (
        (:name :manifest-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :link-capturing :type :boolean :ref nil :items nil :optional t :doc "If user allows the links clicked on by the user in the app's scope, or extended scope if the manifest has scope extensions and the flags `DesktopPWAsLinkCapturingWithScopeExtensions` and `WebAppEnableScopeExtensions` are enabled.  Note, the API does not support resetting the linkCapturing to the initial value, uninstalling and installing the web app again will reset it.  TODO(crbug.com/339453269): Setting this value on ChromeOS is not supported yet.")
        (:name :display-mode :type :ref :ref "DisplayMode" :items nil :optional t :doc ""))
  :returns nil
  :doc "Changes user settings of the web app identified by its manifestId. If the app was not installed, this command returns an error. Unset parameters will be ignored; unrecognized values will cause an error.  Unlike the ones defined in the manifest files of the web apps, these settings are provided by the browser and controlled by the users, they impact the way the browser handling the web apps.  See the comment of each parameter." :experimental nil :deprecated nil)

