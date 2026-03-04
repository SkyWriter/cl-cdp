;;;; Extensions CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/extensions
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/extensions)

(define-domain-type storage-area
  :cdp-id "StorageArea" :type :string
  :properties nil
  :enum '("session" "local" "sync" "managed")
  :doc "Storage areas." :experimental nil :deprecated nil)

(define-domain-type extension-info
  :cdp-id "ExtensionInfo" :type :object
  :properties (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "Extension id.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Extension name.")
        (:name :version :type :string :ref nil :items nil :optional nil :doc "Extension version.")
        (:name :path :type :string :ref nil :items nil :optional nil :doc "The path from which the extension was loaded.")
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Extension enabled status."))
  :enum nil
  :doc "Detailed information about an extension." :experimental nil :deprecated nil)

(define-domain-command trigger-action
  :method "Extensions.triggerAction"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "Extension id.")
        (:name :target-id :type :string :ref nil :items nil :optional nil :doc "A tab target ID to trigger the default extension action on."))
  :returns nil
  :doc "Runs an extension default action. Available if the client is connected using the --remote-debugging-pipe flag and the --enable-unsafe-extension-debugging flag is set." :experimental nil :deprecated nil)

(define-domain-command load-unpacked
  :method "Extensions.loadUnpacked"
  :params (
        (:name :path :type :string :ref nil :items nil :optional nil :doc "Absolute file path.")
        (:name :enable-in-incognito :type :boolean :ref nil :items nil :optional t :doc "Enable the extension in incognito"))
  :returns (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "Extension id."))
  :doc "Installs an unpacked extension from the filesystem similar to --load-extension CLI flags. Returns extension ID once the extension has been installed. Available if the client is connected using the --remote-debugging-pipe flag and the --enable-unsafe-extension-debugging flag is set." :experimental nil :deprecated nil)

(define-domain-command get-extensions
  :method "Extensions.getExtensions"
  :params nil
  :returns (
        (:name :extensions :type :array :ref nil :items (:type :ref :ref "ExtensionInfo") :optional nil :doc ""))
  :doc "Gets a list of all unpacked extensions. Available if the client is connected using the --remote-debugging-pipe flag and the --enable-unsafe-extension-debugging flag is set." :experimental nil :deprecated nil)

(define-domain-command uninstall
  :method "Extensions.uninstall"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "Extension id."))
  :returns nil
  :doc "Uninstalls an unpacked extension (others not supported) from the profile. Available if the client is connected using the --remote-debugging-pipe flag and the --enable-unsafe-extension-debugging." :experimental nil :deprecated nil)

(define-domain-command get-storage-items
  :method "Extensions.getStorageItems"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "ID of extension.")
        (:name :storage-area :type :ref :ref "StorageArea" :items nil :optional nil :doc "StorageArea to retrieve data from.")
        (:name :keys :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Keys to retrieve."))
  :returns (
        (:name :data :type :object :ref nil :items nil :optional nil :doc ""))
  :doc "Gets data from extension storage in the given `storageArea`. If `keys` is specified, these are used to filter the result." :experimental nil :deprecated nil)

(define-domain-command remove-storage-items
  :method "Extensions.removeStorageItems"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "ID of extension.")
        (:name :storage-area :type :ref :ref "StorageArea" :items nil :optional nil :doc "StorageArea to remove data from.")
        (:name :keys :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Keys to remove."))
  :returns nil
  :doc "Removes `keys` from extension storage in the given `storageArea`." :experimental nil :deprecated nil)

(define-domain-command clear-storage-items
  :method "Extensions.clearStorageItems"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "ID of extension.")
        (:name :storage-area :type :ref :ref "StorageArea" :items nil :optional nil :doc "StorageArea to remove data from."))
  :returns nil
  :doc "Clears extension storage in the given `storageArea`." :experimental nil :deprecated nil)

(define-domain-command set-storage-items
  :method "Extensions.setStorageItems"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "ID of extension.")
        (:name :storage-area :type :ref :ref "StorageArea" :items nil :optional nil :doc "StorageArea to set data in.")
        (:name :values :type :object :ref nil :items nil :optional nil :doc "Values to set."))
  :returns nil
  :doc "Sets `values` in extension storage in the given `storageArea`. The provided `values` will be merged with existing values in the storage area." :experimental nil :deprecated nil)

