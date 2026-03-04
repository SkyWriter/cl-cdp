;;;; IndexedDB CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/indexed-db
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

(in-package #:cdp/indexed-db)

(define-domain-type database-with-object-stores
  :cdp-id "DatabaseWithObjectStores" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Database name.")
        (:name :version :type :number :ref nil :items nil :optional nil :doc "Database version (type is not 'integer', as the standard requires the version number to be 'unsigned long long')")
        (:name :object-stores :type :array :ref nil :items (:type :ref :ref "ObjectStore") :optional nil :doc "Object stores in this database."))
  :enum nil
  :doc "Database with an array of object stores." :experimental nil :deprecated nil)

(define-domain-type object-store
  :cdp-id "ObjectStore" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Object store name.")
        (:name :key-path :type :ref :ref "KeyPath" :items nil :optional nil :doc "Object store key path.")
        (:name :auto-increment :type :boolean :ref nil :items nil :optional nil :doc "If true, object store has auto increment flag set.")
        (:name :indexes :type :array :ref nil :items (:type :ref :ref "ObjectStoreIndex") :optional nil :doc "Indexes in this object store."))
  :enum nil
  :doc "Object store." :experimental nil :deprecated nil)

(define-domain-type object-store-index
  :cdp-id "ObjectStoreIndex" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Index name.")
        (:name :key-path :type :ref :ref "KeyPath" :items nil :optional nil :doc "Index key path.")
        (:name :unique :type :boolean :ref nil :items nil :optional nil :doc "If true, index is unique.")
        (:name :multi-entry :type :boolean :ref nil :items nil :optional nil :doc "If true, index allows multiple entries for a key."))
  :enum nil
  :doc "Object store index." :experimental nil :deprecated nil)

(define-domain-type key
  :cdp-id "Key" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Key type.")
        (:name :number :type :number :ref nil :items nil :optional t :doc "Number value.")
        (:name :string :type :string :ref nil :items nil :optional t :doc "String value.")
        (:name :date :type :number :ref nil :items nil :optional t :doc "Date value.")
        (:name :array :type :array :ref nil :items (:type :ref :ref "Key") :optional t :doc "Array value."))
  :enum nil
  :doc "Key." :experimental nil :deprecated nil)

(define-domain-type key-range
  :cdp-id "KeyRange" :type :object
  :properties (
        (:name :lower :type :ref :ref "Key" :items nil :optional t :doc "Lower bound.")
        (:name :upper :type :ref :ref "Key" :items nil :optional t :doc "Upper bound.")
        (:name :lower-open :type :boolean :ref nil :items nil :optional nil :doc "If true lower bound is open.")
        (:name :upper-open :type :boolean :ref nil :items nil :optional nil :doc "If true upper bound is open."))
  :enum nil
  :doc "Key range." :experimental nil :deprecated nil)

(define-domain-type data-entry
  :cdp-id "DataEntry" :type :object
  :properties (
        (:name :key :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "Key object.")
        (:name :primary-key :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "Primary key object.")
        (:name :value :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "Value object."))
  :enum nil
  :doc "Data entry." :experimental nil :deprecated nil)

(define-domain-type key-path
  :cdp-id "KeyPath" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Key path type.")
        (:name :string :type :string :ref nil :items nil :optional t :doc "String value.")
        (:name :array :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Array value."))
  :enum nil
  :doc "Key path." :experimental nil :deprecated nil)

(define-domain-command clear-object-store
  :method "IndexedDB.clearObjectStore"
  :params (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "At least and at most one of securityOrigin, storageKey, or storageBucket must be specified. Security origin.")
        (:name :storage-key :type :string :ref nil :items nil :optional t :doc "Storage key.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket. If not specified, it uses the default bucket.")
        (:name :database-name :type :string :ref nil :items nil :optional nil :doc "Database name.")
        (:name :object-store-name :type :string :ref nil :items nil :optional nil :doc "Object store name."))
  :returns nil
  :doc "Clears all entries from an object store." :experimental nil :deprecated nil)

(define-domain-command delete-database
  :method "IndexedDB.deleteDatabase"
  :params (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "At least and at most one of securityOrigin, storageKey, or storageBucket must be specified. Security origin.")
        (:name :storage-key :type :string :ref nil :items nil :optional t :doc "Storage key.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket. If not specified, it uses the default bucket.")
        (:name :database-name :type :string :ref nil :items nil :optional nil :doc "Database name."))
  :returns nil
  :doc "Deletes a database." :experimental nil :deprecated nil)

(define-domain-command delete-object-store-entries
  :method "IndexedDB.deleteObjectStoreEntries"
  :params (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "At least and at most one of securityOrigin, storageKey, or storageBucket must be specified. Security origin.")
        (:name :storage-key :type :string :ref nil :items nil :optional t :doc "Storage key.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket. If not specified, it uses the default bucket.")
        (:name :database-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :object-store-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :key-range :type :ref :ref "KeyRange" :items nil :optional nil :doc "Range of entry keys to delete"))
  :returns nil
  :doc "Delete a range of entries from an object store" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "IndexedDB.disable"
  :params nil
  :returns nil
  :doc "Disables events from backend." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "IndexedDB.enable"
  :params nil
  :returns nil
  :doc "Enables events from backend." :experimental nil :deprecated nil)

(define-domain-command request-data
  :method "IndexedDB.requestData"
  :params (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "At least and at most one of securityOrigin, storageKey, or storageBucket must be specified. Security origin.")
        (:name :storage-key :type :string :ref nil :items nil :optional t :doc "Storage key.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket. If not specified, it uses the default bucket.")
        (:name :database-name :type :string :ref nil :items nil :optional nil :doc "Database name.")
        (:name :object-store-name :type :string :ref nil :items nil :optional nil :doc "Object store name.")
        (:name :index-name :type :string :ref nil :items nil :optional t :doc "Index name. If not specified, it performs an object store data request.")
        (:name :skip-count :type :integer :ref nil :items nil :optional nil :doc "Number of records to skip.")
        (:name :page-size :type :integer :ref nil :items nil :optional nil :doc "Number of records to fetch.")
        (:name :key-range :type :ref :ref "KeyRange" :items nil :optional t :doc "Key range."))
  :returns (
        (:name :object-store-data-entries :type :array :ref nil :items (:type :ref :ref "DataEntry") :optional nil :doc "Array of object store data entries.")
        (:name :has-more :type :boolean :ref nil :items nil :optional nil :doc "If true, there are more entries to fetch in the given range."))
  :doc "Requests data from object store or index." :experimental nil :deprecated nil)

(define-domain-command get-metadata
  :method "IndexedDB.getMetadata"
  :params (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "At least and at most one of securityOrigin, storageKey, or storageBucket must be specified. Security origin.")
        (:name :storage-key :type :string :ref nil :items nil :optional t :doc "Storage key.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket. If not specified, it uses the default bucket.")
        (:name :database-name :type :string :ref nil :items nil :optional nil :doc "Database name.")
        (:name :object-store-name :type :string :ref nil :items nil :optional nil :doc "Object store name."))
  :returns (
        (:name :entries-count :type :number :ref nil :items nil :optional nil :doc "the entries count")
        (:name :key-generator-value :type :number :ref nil :items nil :optional nil :doc "the current value of key generator, to become the next inserted key into the object store. Valid if objectStore.autoIncrement is true."))
  :doc "Gets metadata of an object store." :experimental nil :deprecated nil)

(define-domain-command request-database
  :method "IndexedDB.requestDatabase"
  :params (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "At least and at most one of securityOrigin, storageKey, or storageBucket must be specified. Security origin.")
        (:name :storage-key :type :string :ref nil :items nil :optional t :doc "Storage key.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket. If not specified, it uses the default bucket.")
        (:name :database-name :type :string :ref nil :items nil :optional nil :doc "Database name."))
  :returns (
        (:name :database-with-object-stores :type :ref :ref "DatabaseWithObjectStores" :items nil :optional nil :doc "Database with an array of object stores."))
  :doc "Requests database with given name in given frame." :experimental nil :deprecated nil)

(define-domain-command request-database-names
  :method "IndexedDB.requestDatabaseNames"
  :params (
        (:name :security-origin :type :string :ref nil :items nil :optional t :doc "At least and at most one of securityOrigin, storageKey, or storageBucket must be specified. Security origin.")
        (:name :storage-key :type :string :ref nil :items nil :optional t :doc "Storage key.")
        (:name :storage-bucket :type :ref :ref "Storage.StorageBucket" :items nil :optional t :doc "Storage bucket. If not specified, it uses the default bucket."))
  :returns (
        (:name :database-names :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Database names for origin."))
  :doc "Requests database names for given security origin." :experimental nil :deprecated nil)

