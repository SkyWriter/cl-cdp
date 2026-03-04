;;;; DOMStorage CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/dom-storage
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

(in-package #:cdp/dom-storage)

(define-domain-type serialized-storage-key
  :cdp-id "SerializedStorageKey" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type storage-id
  :cdp-id "StorageId" :type :object
  :properties (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "Security origin for the storage.")
        (:name :storage-key :type :ref :ref "SerializedStorageKey" :items nil :optional t :doc "Represents a key by which DOM Storage keys its CachedStorageAreas")
        (:name :is-local-storage :type :boolean :ref nil :items nil :optional nil :doc "Whether the storage is local storage (not session storage)."))
  :enum nil
  :doc "DOM Storage identifier." :experimental nil :deprecated nil)

(define-domain-type item
  :cdp-id "Item" :type :array
  :properties nil
  :enum nil
  :doc "DOM Storage item." :experimental nil :deprecated nil)

(define-domain-command clear
  :method "DOMStorage.clear"
  :params (
        (:name :storage-id :type :ref :ref "StorageId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "DOMStorage.disable"
  :params nil
  :returns nil
  :doc "Disables storage tracking, prevents storage events from being sent to the client." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "DOMStorage.enable"
  :params nil
  :returns nil
  :doc "Enables storage tracking, storage events will now be delivered to the client." :experimental nil :deprecated nil)

(define-domain-command get-dom-storage-items
  :method "DOMStorage.getDOMStorageItems"
  :params (
        (:name :storage-id :type :ref :ref "StorageId" :items nil :optional nil :doc ""))
  :returns (
        (:name :entries :type :array :ref nil :items (:type :ref :ref "Item") :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command remove-dom-storage-item
  :method "DOMStorage.removeDOMStorageItem"
  :params (
        (:name :storage-id :type :ref :ref "StorageId" :items nil :optional nil :doc "")
        (:name :key :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command set-dom-storage-item
  :method "DOMStorage.setDOMStorageItem"
  :params (
        (:name :storage-id :type :ref :ref "StorageId" :items nil :optional nil :doc "")
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-event dom-storage-item-added
  :method "DOMStorage.domStorageItemAdded"
  :params (
        (:name :storage-id :type :ref :ref "StorageId" :items nil :optional nil :doc "")
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :new-value :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event dom-storage-item-removed
  :method "DOMStorage.domStorageItemRemoved"
  :params (
        (:name :storage-id :type :ref :ref "StorageId" :items nil :optional nil :doc "")
        (:name :key :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event dom-storage-item-updated
  :method "DOMStorage.domStorageItemUpdated"
  :params (
        (:name :storage-id :type :ref :ref "StorageId" :items nil :optional nil :doc "")
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :old-value :type :string :ref nil :items nil :optional nil :doc "")
        (:name :new-value :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event dom-storage-items-cleared
  :method "DOMStorage.domStorageItemsCleared"
  :params (
        (:name :storage-id :type :ref :ref "StorageId" :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

