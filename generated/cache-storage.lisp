;;;; CacheStorage CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/cache-storage
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/cache-storage)

(define-domain-type cache-id
  :cdp-id "CacheId" :type :string
  :properties nil
  :enum nil
  :doc "Unique identifier of the Cache object." :experimental nil :deprecated nil)

(define-domain-type cached-response-type
  :cdp-id "CachedResponseType" :type :string
  :properties nil
  :enum '("basic" "cors" "default" "error" "opaqueResponse" "opaqueRedirect")
  :doc "type of HTTP response cached" :experimental nil :deprecated nil)

(define-domain-type data-entry
  :cdp-id "DataEntry" :type :object
  :properties (
        (:name :request-url :type :string :ref nil :items nil :optional nil :doc "Request URL.")
        (:name :request-method :type :string :ref nil :items nil :optional nil :doc "Request method.")
        (:name :request-headers :type :array :ref nil :items (:type :ref :ref "Header") :optional nil :doc "Request headers")
        (:name :response-time :type :number :ref nil :items nil :optional nil :doc "Number of seconds since epoch.")
        (:name :response-status :type :integer :ref nil :items nil :optional nil :doc "HTTP response status code.")
        (:name :response-status-text :type :string :ref nil :items nil :optional nil :doc "HTTP response status text.")
        (:name :response-type :type :ref :ref "CachedResponseType" :items nil :optional nil :doc "HTTP response type")
        (:name :response-headers :type :array :ref nil :items (:type :ref :ref "Header") :optional nil :doc "Response headers"))
  :enum nil
  :doc "Data entry." :experimental nil :deprecated nil)

(define-domain-type cache
  :cdp-id "Cache" :type :object
  :properties (
        (:name :cache-id :type :ref :ref "CacheId" :items nil :optional nil :doc "An opaque unique id of the cache.")
        (:name :security-origin :type :string :ref nil :items nil :optional nil :doc "Security origin of the cache.")
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key of the cache.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket of the cache.")
        (:name :cache-name :type :string :ref nil :items nil :optional nil :doc "The name of the cache."))
  :enum nil
  :doc "Cache identifier." :experimental nil :deprecated nil)

(define-domain-type header
  :cdp-id "Header" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type cached-response
  :cdp-id "CachedResponse" :type :object
  :properties (
        (:name :body :type :string :ref nil :items nil :optional nil :doc "Entry content, base64-encoded. (Encoded as a base64 string when passed over JSON)"))
  :enum nil
  :doc "Cached response" :experimental nil :deprecated nil)

(define-domain-command delete-cache
  :method "CacheStorage.deleteCache"
  :params (
        (:name :cache-id :type :ref :ref "CacheId" :items nil :optional nil :doc "Id of cache for deletion."))
  :returns nil
  :doc "Deletes a cache." :experimental nil :deprecated nil)

(define-domain-command delete-entry
  :method "CacheStorage.deleteEntry"
  :params (
        (:name :cache-id :type :ref :ref "CacheId" :items nil :optional nil :doc "Id of cache where the entry will be deleted.")
        (:name :request :type :string :ref nil :items nil :optional nil :doc "URL spec of the request."))
  :returns nil
  :doc "Deletes a cache entry." :experimental nil :deprecated nil)

(define-domain-command request-cache-names
  :method "CacheStorage.requestCacheNames"
  :params (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "At least and at most one of securityOrigin, storageKey, storageBucket must be specified. Security origin.")
        (:name :storage-key :type :string :ref nil :items nil :optional t :doc "Storage key.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket. If not specified, it uses the default bucket."))
  :returns (
        (:name :caches :type :array :ref nil :items (:type :ref :ref "Cache") :optional nil :doc "Caches for the security origin."))
  :doc "Requests cache names." :experimental nil :deprecated nil)

(define-domain-command request-cached-response
  :method "CacheStorage.requestCachedResponse"
  :params (
        (:name :cache-id :type :ref :ref "CacheId" :items nil :optional nil :doc "Id of cache that contains the entry.")
        (:name :request-url :type :string :ref nil :items nil :optional nil :doc "URL spec of the request.")
        (:name :request-headers :type :array :ref nil :items (:type :ref :ref "Header") :optional nil :doc "headers of the request."))
  :returns (
        (:name :response :type :ref :ref "CachedResponse" :items nil :optional nil :doc "Response read from the cache."))
  :doc "Fetches cache entry." :experimental nil :deprecated nil)

(define-domain-command request-entries
  :method "CacheStorage.requestEntries"
  :params (
        (:name :cache-id :type :ref :ref "CacheId" :items nil :optional nil :doc "ID of cache to get entries from.")
        (:name :skip-count :type :integer :ref nil :items nil :optional t :doc "Number of records to skip.")
        (:name :page-size :type :integer :ref nil :items nil :optional t :doc "Number of records to fetch.")
        (:name :path-filter :type :string :ref nil :items nil :optional t :doc "If present, only return the entries containing this substring in the path"))
  :returns (
        (:name :cache-data-entries :type :array :ref nil :items (:type :ref :ref "DataEntry") :optional nil :doc "Array of object store data entries.")
        (:name :return-count :type :number :ref nil :items nil :optional nil :doc "Count of returned entries from this storage. If pathFilter is empty, it is the count of all entries from this storage."))
  :doc "Requests data from cache." :experimental nil :deprecated nil)

