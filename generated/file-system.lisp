;;;; FileSystem CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/file-system
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/file-system)

(define-domain-type file
  :cdp-id "File" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :last-modified :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "Timestamp")
        (:name :size :type :number :ref nil :items nil :optional nil :doc "Size in bytes")
        (:name :type :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type directory
  :cdp-id "Directory" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :nested-directories :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "")
        (:name :nested-files :type :array :ref nil :items (:type :ref :ref "File") :optional nil :doc "Files that are directly nested under this directory."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type bucket-file-system-locator
  :cdp-id "BucketFileSystemLocator" :type :object
  :properties (
        (:name :storage-key :type :ref :ref "Storage.SerializedStorageKey" :items nil :optional nil :doc "Storage key")
        (:name :bucket-name :type :string :ref nil :items nil :optional t :doc "Bucket name. Not passing a `bucketName` will retrieve the default Bucket. (https://developer.mozilla.org/en-US/docs/Web/API/Storage_API#storage_buckets)")
        (:name :path-components :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Path to the directory using each path component as an array item."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command get-directory
  :method "FileSystem.getDirectory"
  :params (
        (:name :bucket-file-system-locator :type :ref :ref "BucketFileSystemLocator" :items nil :optional nil :doc ""))
  :returns (
        (:name :directory :type :ref :ref "Directory" :items nil :optional nil :doc "Returns the directory object at the path."))
  :doc "" :experimental nil :deprecated nil)

