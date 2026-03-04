;;;; Storage CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/storage
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/storage)

(define-domain-type serialized-storage-key
  :cdp-id "SerializedStorageKey" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type storage-type
  :cdp-id "StorageType" :type :string
  :properties nil
  :enum '("cookies" "file_systems" "indexeddb" "local_storage" "shader_cache" "websql" "service_workers" "cache_storage" "interest_groups" "shared_storage" "storage_buckets" "all" "other")
  :doc "Enum of possible storage types." :experimental nil :deprecated nil)

(define-domain-type usage-for-type
  :cdp-id "UsageForType" :type :object
  :properties (
        (:name :storage-type :type :ref :ref "StorageType" :items nil :optional nil :doc "Name of storage type.")
        (:name :usage :type :number :ref nil :items nil :optional nil :doc "Storage usage (bytes)."))
  :enum nil
  :doc "Usage for a storage type." :experimental nil :deprecated nil)

(define-domain-type trust-tokens
  :cdp-id "TrustTokens" :type :object
  :properties (
        (:name :issuer-origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :count :type :number :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Pair of issuer origin and number of available (signed, but not used) Trust Tokens from that issuer." :experimental t :deprecated nil)

(define-domain-type interest-group-auction-id
  :cdp-id "InterestGroupAuctionId" :type :string
  :properties nil
  :enum nil
  :doc "Protected audience interest group auction identifier." :experimental nil :deprecated nil)

(define-domain-type interest-group-access-type
  :cdp-id "InterestGroupAccessType" :type :string
  :properties nil
  :enum '("join" "leave" "update" "loaded" "bid" "win" "additionalBid" "additionalBidWin" "topLevelBid" "topLevelAdditionalBid" "clear")
  :doc "Enum of interest group access types." :experimental nil :deprecated nil)

(define-domain-type interest-group-auction-event-type
  :cdp-id "InterestGroupAuctionEventType" :type :string
  :properties nil
  :enum '("started" "configResolved")
  :doc "Enum of auction events." :experimental nil :deprecated nil)

(define-domain-type interest-group-auction-fetch-type
  :cdp-id "InterestGroupAuctionFetchType" :type :string
  :properties nil
  :enum '("bidderJs" "bidderWasm" "sellerJs" "bidderTrustedSignals" "sellerTrustedSignals")
  :doc "Enum of network fetches auctions can do." :experimental nil :deprecated nil)

(define-domain-type shared-storage-access-scope
  :cdp-id "SharedStorageAccessScope" :type :string
  :properties nil
  :enum '("window" "sharedStorageWorklet" "protectedAudienceWorklet" "header")
  :doc "Enum of shared storage access scopes." :experimental nil :deprecated nil)

(define-domain-type shared-storage-access-method
  :cdp-id "SharedStorageAccessMethod" :type :string
  :properties nil
  :enum '("addModule" "createWorklet" "selectURL" "run" "batchUpdate" "set" "append" "delete" "clear" "get" "keys" "values" "entries" "length" "remainingBudget")
  :doc "Enum of shared storage access methods." :experimental nil :deprecated nil)

(define-domain-type shared-storage-entry
  :cdp-id "SharedStorageEntry" :type :object
  :properties (
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Struct for a single key-value pair in an origin's shared storage." :experimental nil :deprecated nil)

(define-domain-type shared-storage-metadata
  :cdp-id "SharedStorageMetadata" :type :object
  :properties (
        (:name :creation-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "Time when the origin's shared storage was last created.")
        (:name :length :type :integer :ref nil :items nil :optional nil :doc "Number of key-value pairs stored in origin's shared storage.")
        (:name :remaining-budget :type :number :ref nil :items nil :optional nil :doc "Current amount of bits of entropy remaining in the navigation budget.")
        (:name :bytes-used :type :integer :ref nil :items nil :optional nil :doc "Total number of bytes stored as key-value pairs in origin's shared storage."))
  :enum nil
  :doc "Details for an origin's shared storage." :experimental nil :deprecated nil)

(define-domain-type shared-storage-private-aggregation-config
  :cdp-id "SharedStoragePrivateAggregationConfig" :type :object
  :properties (
        (:name :aggregation-coordinator-origin :type :string :ref nil :items nil :optional t :doc "The chosen aggregation service deployment.")
        (:name :context-id :type :string :ref nil :items nil :optional t :doc "The context ID provided.")
        (:name :filtering-id-max-bytes :type :integer :ref nil :items nil :optional nil :doc "Configures the maximum size allowed for filtering IDs.")
        (:name :max-contributions :type :integer :ref nil :items nil :optional t :doc "The limit on the number of contributions in the final report."))
  :enum nil
  :doc "Represents a dictionary object passed in as privateAggregationConfig to run or selectURL." :experimental nil :deprecated nil)

(define-domain-type shared-storage-reporting-metadata
  :cdp-id "SharedStorageReportingMetadata" :type :object
  :properties (
        (:name :event-type :type :string :ref nil :items nil :optional nil :doc "")
        (:name :reporting-url :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Pair of reporting metadata details for a candidate URL for `selectURL()`." :experimental nil :deprecated nil)

(define-domain-type shared-storage-url-with-metadata
  :cdp-id "SharedStorageUrlWithMetadata" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Spec of candidate URL.")
        (:name :reporting-metadata :type :array :ref nil :items (:type :ref :ref "SharedStorageReportingMetadata") :optional nil :doc "Any associated reporting metadata."))
  :enum nil
  :doc "Bundles a candidate URL with its reporting metadata." :experimental nil :deprecated nil)

(define-domain-type shared-storage-access-params
  :cdp-id "SharedStorageAccessParams" :type :object
  :properties (
        (:name :script-source-url :type :string :ref nil :items nil :optional t :doc "Spec of the module script URL. Present only for SharedStorageAccessMethods: addModule and createWorklet.")
        (:name :data-origin :type :string :ref nil :items nil :optional t :doc "String denoting \"context-origin\", \"script-origin\", or a custom origin to be used as the worklet's data origin. Present only for SharedStorageAccessMethod: createWorklet.")
        (:name :operation-name :type :string :ref nil :items nil :optional t :doc "Name of the registered operation to be run. Present only for SharedStorageAccessMethods: run and selectURL.")
        (:name :operation-id :type :string :ref nil :items nil :optional t :doc "ID of the operation call. Present only for SharedStorageAccessMethods: run and selectURL.")
        (:name :keep-alive :type :boolean :ref nil :items nil :optional t :doc "Whether or not to keep the worket alive for future run or selectURL calls. Present only for SharedStorageAccessMethods: run and selectURL.")
        (:name :private-aggregation-config :type :ref :ref "SharedStoragePrivateAggregationConfig" :items nil :optional t :doc "Configures the private aggregation options. Present only for SharedStorageAccessMethods: run and selectURL.")
        (:name :serialized-data :type :string :ref nil :items nil :optional t :doc "The operation's serialized data in bytes (converted to a string). Present only for SharedStorageAccessMethods: run and selectURL. TODO(crbug.com/401011862): Consider updating this parameter to binary.")
        (:name :urls-with-metadata :type :array :ref nil :items (:type :ref :ref "SharedStorageUrlWithMetadata") :optional t :doc "Array of candidate URLs' specs, along with any associated metadata. Present only for SharedStorageAccessMethod: selectURL.")
        (:name :urn-uuid :type :string :ref nil :items nil :optional t :doc "Spec of the URN:UUID generated for a selectURL call. Present only for SharedStorageAccessMethod: selectURL.")
        (:name :key :type :string :ref nil :items nil :optional t :doc "Key for a specific entry in an origin's shared storage. Present only for SharedStorageAccessMethods: set, append, delete, and get.")
        (:name :value :type :string :ref nil :items nil :optional t :doc "Value for a specific entry in an origin's shared storage. Present only for SharedStorageAccessMethods: set and append.")
        (:name :ignore-if-present :type :boolean :ref nil :items nil :optional t :doc "Whether or not to set an entry for a key if that key is already present. Present only for SharedStorageAccessMethod: set.")
        (:name :worklet-ordinal :type :integer :ref nil :items nil :optional t :doc "A number denoting the (0-based) order of the worklet's creation relative to all other shared storage worklets created by documents using the current storage partition. Present only for SharedStorageAccessMethods: addModule, createWorklet.")
        (:name :worklet-target-id :type :ref :ref "Target.TargetID" :items nil :optional t :doc "Hex representation of the DevTools token used as the TargetID for the associated shared storage worklet. Present only for SharedStorageAccessMethods: addModule, createWorklet, run, selectURL, and any other SharedStorageAccessMethod when the SharedStorageAccessScope is sharedStorageWorklet.")
        (:name :with-lock :type :string :ref nil :items nil :optional t :doc "Name of the lock to be acquired, if present. Optionally present only for SharedStorageAccessMethods: batchUpdate, set, append, delete, and clear.")
        (:name :batch-update-id :type :string :ref nil :items nil :optional t :doc "If the method has been called as part of a batchUpdate, then this number identifies the batch to which it belongs. Optionally present only for SharedStorageAccessMethods: batchUpdate (required), set, append, delete, and clear.")
        (:name :batch-size :type :integer :ref nil :items nil :optional t :doc "Number of modifier methods sent in batch. Present only for SharedStorageAccessMethod: batchUpdate."))
  :enum nil
  :doc "Bundles the parameters for shared storage access events whose presence/absence can vary according to SharedStorageAccessType." :experimental nil :deprecated nil)

(define-domain-type storage-buckets-durability
  :cdp-id "StorageBucketsDurability" :type :string
  :properties nil
  :enum '("relaxed" "strict")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type storage-bucket
  :cdp-id "StorageBucket" :type :object
  :properties (
        (:name :storage-key :type :ref :ref "SerializedStorageKey" :items nil :optional nil :doc "")
        (:name :name :type :string :ref nil :items nil :optional t :doc "If not specified, it is the default bucket of the storageKey."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type storage-bucket-info
  :cdp-id "StorageBucketInfo" :type :object
  :properties (
        (:name :bucket :type :ref :ref "StorageBucket" :items nil :optional nil :doc "")
        (:name :id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :expiration :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "")
        (:name :quota :type :number :ref nil :items nil :optional nil :doc "Storage quota (bytes).")
        (:name :persistent :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :durability :type :ref :ref "StorageBucketsDurability" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type attribution-reporting-source-type
  :cdp-id "AttributionReportingSourceType" :type :string
  :properties nil
  :enum '("navigation" "event")
  :doc "" :experimental t :deprecated nil)

(define-domain-type unsigned-int64-as-base10
  :cdp-id "UnsignedInt64AsBase10" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type unsigned-int128-as-base16
  :cdp-id "UnsignedInt128AsBase16" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type signed-int64-as-base10
  :cdp-id "SignedInt64AsBase10" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-filter-data-entry
  :cdp-id "AttributionReportingFilterDataEntry" :type :object
  :properties (
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :values :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-filter-config
  :cdp-id "AttributionReportingFilterConfig" :type :object
  :properties (
        (:name :filter-values :type :array :ref nil :items (:type :ref :ref "AttributionReportingFilterDataEntry") :optional nil :doc "")
        (:name :lookback-window :type :integer :ref nil :items nil :optional t :doc "duration in seconds"))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-filter-pair
  :cdp-id "AttributionReportingFilterPair" :type :object
  :properties (
        (:name :filters :type :array :ref nil :items (:type :ref :ref "AttributionReportingFilterConfig") :optional nil :doc "")
        (:name :not-filters :type :array :ref nil :items (:type :ref :ref "AttributionReportingFilterConfig") :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-aggregation-keys-entry
  :cdp-id "AttributionReportingAggregationKeysEntry" :type :object
  :properties (
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :ref :ref "UnsignedInt128AsBase16" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-event-report-windows
  :cdp-id "AttributionReportingEventReportWindows" :type :object
  :properties (
        (:name :start :type :integer :ref nil :items nil :optional nil :doc "duration in seconds")
        (:name :ends :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "duration in seconds"))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-trigger-data-matching
  :cdp-id "AttributionReportingTriggerDataMatching" :type :string
  :properties nil
  :enum '("exact" "modulus")
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-aggregatable-debug-reporting-data
  :cdp-id "AttributionReportingAggregatableDebugReportingData" :type :object
  :properties (
        (:name :key-piece :type :ref :ref "UnsignedInt128AsBase16" :items nil :optional nil :doc "")
        (:name :value :type :number :ref nil :items nil :optional nil :doc "number instead of integer because not all uint32 can be represented by int")
        (:name :types :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-aggregatable-debug-reporting-config
  :cdp-id "AttributionReportingAggregatableDebugReportingConfig" :type :object
  :properties (
        (:name :budget :type :number :ref nil :items nil :optional t :doc "number instead of integer because not all uint32 can be represented by int, only present for source registrations")
        (:name :key-piece :type :ref :ref "UnsignedInt128AsBase16" :items nil :optional nil :doc "")
        (:name :debug-data :type :array :ref nil :items (:type :ref :ref "AttributionReportingAggregatableDebugReportingData") :optional nil :doc "")
        (:name :aggregation-coordinator-origin :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-scopes-data
  :cdp-id "AttributionScopesData" :type :object
  :properties (
        (:name :values :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "")
        (:name :limit :type :number :ref nil :items nil :optional nil :doc "number instead of integer because not all uint32 can be represented by int")
        (:name :max-event-states :type :number :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-named-budget-def
  :cdp-id "AttributionReportingNamedBudgetDef" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :budget :type :integer :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-source-registration
  :cdp-id "AttributionReportingSourceRegistration" :type :object
  :properties (
        (:name :time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "")
        (:name :expiry :type :integer :ref nil :items nil :optional nil :doc "duration in seconds")
        (:name :trigger-data :type :array :ref nil :items (:type :number :ref nil) :optional nil :doc "number instead of integer because not all uint32 can be represented by int")
        (:name :event-report-windows :type :ref :ref "AttributionReportingEventReportWindows" :items nil :optional nil :doc "")
        (:name :aggregatable-report-window :type :integer :ref nil :items nil :optional nil :doc "duration in seconds")
        (:name :type :type :ref :ref "AttributionReportingSourceType" :items nil :optional nil :doc "")
        (:name :source-origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :reporting-origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :destination-sites :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "")
        (:name :event-id :type :ref :ref "UnsignedInt64AsBase10" :items nil :optional nil :doc "")
        (:name :priority :type :ref :ref "SignedInt64AsBase10" :items nil :optional nil :doc "")
        (:name :filter-data :type :array :ref nil :items (:type :ref :ref "AttributionReportingFilterDataEntry") :optional nil :doc "")
        (:name :aggregation-keys :type :array :ref nil :items (:type :ref :ref "AttributionReportingAggregationKeysEntry") :optional nil :doc "")
        (:name :debug-key :type :ref :ref "UnsignedInt64AsBase10" :items nil :optional t :doc "")
        (:name :trigger-data-matching :type :ref :ref "AttributionReportingTriggerDataMatching" :items nil :optional nil :doc "")
        (:name :destination-limit-priority :type :ref :ref "SignedInt64AsBase10" :items nil :optional nil :doc "")
        (:name :aggregatable-debug-reporting-config :type :ref :ref "AttributionReportingAggregatableDebugReportingConfig" :items nil :optional nil :doc "")
        (:name :scopes-data :type :ref :ref "AttributionScopesData" :items nil :optional t :doc "")
        (:name :max-event-level-reports :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :named-budgets :type :array :ref nil :items (:type :ref :ref "AttributionReportingNamedBudgetDef") :optional nil :doc "")
        (:name :debug-reporting :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :event-level-epsilon :type :number :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-source-registration-result
  :cdp-id "AttributionReportingSourceRegistrationResult" :type :string
  :properties nil
  :enum '("success" "internalError" "insufficientSourceCapacity" "insufficientUniqueDestinationCapacity" "excessiveReportingOrigins" "prohibitedByBrowserPolicy" "successNoised" "destinationReportingLimitReached" "destinationGlobalLimitReached" "destinationBothLimitsReached" "reportingOriginsPerSiteLimitReached" "exceedsMaxChannelCapacity" "exceedsMaxScopesChannelCapacity" "exceedsMaxTriggerStateCardinality" "exceedsMaxEventStatesLimit" "destinationPerDayReportingLimitReached")
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-source-registration-time-config
  :cdp-id "AttributionReportingSourceRegistrationTimeConfig" :type :string
  :properties nil
  :enum '("include" "exclude")
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-aggregatable-value-dict-entry
  :cdp-id "AttributionReportingAggregatableValueDictEntry" :type :object
  :properties (
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :number :ref nil :items nil :optional nil :doc "number instead of integer because not all uint32 can be represented by int")
        (:name :filtering-id :type :ref :ref "UnsignedInt64AsBase10" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-aggregatable-value-entry
  :cdp-id "AttributionReportingAggregatableValueEntry" :type :object
  :properties (
        (:name :values :type :array :ref nil :items (:type :ref :ref "AttributionReportingAggregatableValueDictEntry") :optional nil :doc "")
        (:name :filters :type :ref :ref "AttributionReportingFilterPair" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-event-trigger-data
  :cdp-id "AttributionReportingEventTriggerData" :type :object
  :properties (
        (:name :data :type :ref :ref "UnsignedInt64AsBase10" :items nil :optional nil :doc "")
        (:name :priority :type :ref :ref "SignedInt64AsBase10" :items nil :optional nil :doc "")
        (:name :dedup-key :type :ref :ref "UnsignedInt64AsBase10" :items nil :optional t :doc "")
        (:name :filters :type :ref :ref "AttributionReportingFilterPair" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-aggregatable-trigger-data
  :cdp-id "AttributionReportingAggregatableTriggerData" :type :object
  :properties (
        (:name :key-piece :type :ref :ref "UnsignedInt128AsBase16" :items nil :optional nil :doc "")
        (:name :source-keys :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "")
        (:name :filters :type :ref :ref "AttributionReportingFilterPair" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-aggregatable-dedup-key
  :cdp-id "AttributionReportingAggregatableDedupKey" :type :object
  :properties (
        (:name :dedup-key :type :ref :ref "UnsignedInt64AsBase10" :items nil :optional t :doc "")
        (:name :filters :type :ref :ref "AttributionReportingFilterPair" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-named-budget-candidate
  :cdp-id "AttributionReportingNamedBudgetCandidate" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional t :doc "")
        (:name :filters :type :ref :ref "AttributionReportingFilterPair" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-trigger-registration
  :cdp-id "AttributionReportingTriggerRegistration" :type :object
  :properties (
        (:name :filters :type :ref :ref "AttributionReportingFilterPair" :items nil :optional nil :doc "")
        (:name :debug-key :type :ref :ref "UnsignedInt64AsBase10" :items nil :optional t :doc "")
        (:name :aggregatable-dedup-keys :type :array :ref nil :items (:type :ref :ref "AttributionReportingAggregatableDedupKey") :optional nil :doc "")
        (:name :event-trigger-data :type :array :ref nil :items (:type :ref :ref "AttributionReportingEventTriggerData") :optional nil :doc "")
        (:name :aggregatable-trigger-data :type :array :ref nil :items (:type :ref :ref "AttributionReportingAggregatableTriggerData") :optional nil :doc "")
        (:name :aggregatable-values :type :array :ref nil :items (:type :ref :ref "AttributionReportingAggregatableValueEntry") :optional nil :doc "")
        (:name :aggregatable-filtering-id-max-bytes :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :debug-reporting :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :aggregation-coordinator-origin :type :string :ref nil :items nil :optional t :doc "")
        (:name :source-registration-time-config :type :ref :ref "AttributionReportingSourceRegistrationTimeConfig" :items nil :optional nil :doc "")
        (:name :trigger-context-id :type :string :ref nil :items nil :optional t :doc "")
        (:name :aggregatable-debug-reporting-config :type :ref :ref "AttributionReportingAggregatableDebugReportingConfig" :items nil :optional nil :doc "")
        (:name :scopes :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "")
        (:name :named-budgets :type :array :ref nil :items (:type :ref :ref "AttributionReportingNamedBudgetCandidate") :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-event-level-result
  :cdp-id "AttributionReportingEventLevelResult" :type :string
  :properties nil
  :enum '("success" "successDroppedLowerPriority" "internalError" "noCapacityForAttributionDestination" "noMatchingSources" "deduplicated" "excessiveAttributions" "priorityTooLow" "neverAttributedSource" "excessiveReportingOrigins" "noMatchingSourceFilterData" "prohibitedByBrowserPolicy" "noMatchingConfigurations" "excessiveReports" "falselyAttributedSource" "reportWindowPassed" "notRegistered" "reportWindowNotStarted" "noMatchingTriggerData")
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-aggregatable-result
  :cdp-id "AttributionReportingAggregatableResult" :type :string
  :properties nil
  :enum '("success" "internalError" "noCapacityForAttributionDestination" "noMatchingSources" "excessiveAttributions" "excessiveReportingOrigins" "noHistograms" "insufficientBudget" "insufficientNamedBudget" "noMatchingSourceFilterData" "notRegistered" "prohibitedByBrowserPolicy" "deduplicated" "reportWindowPassed" "excessiveReports")
  :doc "" :experimental t :deprecated nil)

(define-domain-type attribution-reporting-report-result
  :cdp-id "AttributionReportingReportResult" :type :string
  :properties nil
  :enum '("sent" "prohibited" "failedToAssemble" "expired")
  :doc "" :experimental t :deprecated nil)

(define-domain-type related-website-set
  :cdp-id "RelatedWebsiteSet" :type :object
  :properties (
        (:name :primary-sites :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "The primary site of this set, along with the ccTLDs if there is any.")
        (:name :associated-sites :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "The associated sites of this set, along with the ccTLDs if there is any.")
        (:name :service-sites :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "The service sites of this set, along with the ccTLDs if there is any."))
  :enum nil
  :doc "A single Related Website Set object." :experimental t :deprecated nil)

(define-domain-command get-storage-key-for-frame
  :method "Storage.getStorageKeyForFrame"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc ""))
  :returns (
        (:name :storage-key :type :ref :ref "SerializedStorageKey" :items nil :optional nil :doc ""))
  :doc "Returns a storage key given a frame id. Deprecated. Please use Storage.getStorageKey instead." :experimental nil :deprecated t)

(define-domain-command get-storage-key
  :method "Storage.getStorageKey"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc ""))
  :returns (
        (:name :storage-key :type :ref :ref "SerializedStorageKey" :items nil :optional nil :doc ""))
  :doc "Returns storage key for the given frame. If no frame ID is provided, the storage key of the target executing this command is returned." :experimental t :deprecated nil)

(define-domain-command clear-data-for-origin
  :method "Storage.clearDataForOrigin"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Security origin.")
        (:name :storage-types :type :string :ref nil :items nil :optional nil :doc "Comma separated list of StorageType to clear."))
  :returns nil
  :doc "Clears storage for origin." :experimental nil :deprecated nil)

(define-domain-command clear-data-for-storage-key
  :method "Storage.clearDataForStorageKey"
  :params (
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key.")
        (:name :storage-types :type :string :ref nil :items nil :optional nil :doc "Comma separated list of StorageType to clear."))
  :returns nil
  :doc "Clears storage for storage key." :experimental nil :deprecated nil)

(define-domain-command get-cookies
  :method "Storage.getCookies"
  :params (
        (:name :browser-context-id :type :ref :ref "Browser.BrowserContextID" :items nil :optional t :doc "Browser context to use when called on the browser endpoint."))
  :returns (
        (:name :cookies :type :array :ref nil :items (:type :ref :ref "Network.Cookie") :optional nil :doc "Array of cookie objects."))
  :doc "Returns all browser cookies." :experimental nil :deprecated nil)

(define-domain-command set-cookies
  :method "Storage.setCookies"
  :params (
        (:name :cookies :type :array :ref nil :items (:type :ref :ref "Network.CookieParam") :optional nil :doc "Cookies to be set.")
        (:name :browser-context-id :type :ref :ref "Browser.BrowserContextID" :items nil :optional t :doc "Browser context to use when called on the browser endpoint."))
  :returns nil
  :doc "Sets given cookies." :experimental nil :deprecated nil)

(define-domain-command clear-cookies
  :method "Storage.clearCookies"
  :params (
        (:name :browser-context-id :type :ref :ref "Browser.BrowserContextID" :items nil :optional t :doc "Browser context to use when called on the browser endpoint."))
  :returns nil
  :doc "Clears cookies." :experimental nil :deprecated nil)

(define-domain-command get-usage-and-quota
  :method "Storage.getUsageAndQuota"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Security origin."))
  :returns (
        (:name :usage :type :number :ref nil :items nil :optional nil :doc "Storage usage (bytes).")
        (:name :quota :type :number :ref nil :items nil :optional nil :doc "Storage quota (bytes).")
        (:name :override-active :type :boolean :ref nil :items nil :optional nil :doc "Whether or not the origin has an active storage quota override")
        (:name :usage-breakdown :type :array :ref nil :items (:type :ref :ref "UsageForType") :optional nil :doc "Storage usage per type (bytes)."))
  :doc "Returns usage and quota in bytes." :experimental nil :deprecated nil)

(define-domain-command override-quota-for-origin
  :method "Storage.overrideQuotaForOrigin"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Security origin.")
        (:name :quota-size :type :number :ref nil :items nil :optional t :doc "The quota size (in bytes) to override the original quota with. If this is called multiple times, the overridden quota will be equal to the quotaSize provided in the final call. If this is called without specifying a quotaSize, the quota will be reset to the default value for the specified origin. If this is called multiple times with different origins, the override will be maintained for each origin until it is disabled (called without a quotaSize)."))
  :returns nil
  :doc "Override quota for the specified origin" :experimental t :deprecated nil)

(define-domain-command track-cache-storage-for-origin
  :method "Storage.trackCacheStorageForOrigin"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Security origin."))
  :returns nil
  :doc "Registers origin to be notified when an update occurs to its cache storage list." :experimental nil :deprecated nil)

(define-domain-command track-cache-storage-for-storage-key
  :method "Storage.trackCacheStorageForStorageKey"
  :params (
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key."))
  :returns nil
  :doc "Registers storage key to be notified when an update occurs to its cache storage list." :experimental nil :deprecated nil)

(define-domain-command track-indexed-db-for-origin
  :method "Storage.trackIndexedDBForOrigin"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Security origin."))
  :returns nil
  :doc "Registers origin to be notified when an update occurs to its IndexedDB." :experimental nil :deprecated nil)

(define-domain-command track-indexed-db-for-storage-key
  :method "Storage.trackIndexedDBForStorageKey"
  :params (
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key."))
  :returns nil
  :doc "Registers storage key to be notified when an update occurs to its IndexedDB." :experimental nil :deprecated nil)

(define-domain-command untrack-cache-storage-for-origin
  :method "Storage.untrackCacheStorageForOrigin"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Security origin."))
  :returns nil
  :doc "Unregisters origin from receiving notifications for cache storage." :experimental nil :deprecated nil)

(define-domain-command untrack-cache-storage-for-storage-key
  :method "Storage.untrackCacheStorageForStorageKey"
  :params (
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key."))
  :returns nil
  :doc "Unregisters storage key from receiving notifications for cache storage." :experimental nil :deprecated nil)

(define-domain-command untrack-indexed-db-for-origin
  :method "Storage.untrackIndexedDBForOrigin"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Security origin."))
  :returns nil
  :doc "Unregisters origin from receiving notifications for IndexedDB." :experimental nil :deprecated nil)

(define-domain-command untrack-indexed-db-for-storage-key
  :method "Storage.untrackIndexedDBForStorageKey"
  :params (
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key."))
  :returns nil
  :doc "Unregisters storage key from receiving notifications for IndexedDB." :experimental nil :deprecated nil)

(define-domain-command get-trust-tokens
  :method "Storage.getTrustTokens"
  :params nil
  :returns (
        (:name :tokens :type :array :ref nil :items (:type :ref :ref "TrustTokens") :optional nil :doc ""))
  :doc "Returns the number of stored Trust Tokens per issuer for the current browsing context." :experimental t :deprecated nil)

(define-domain-command clear-trust-tokens
  :method "Storage.clearTrustTokens"
  :params (
        (:name :issuer-origin :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :did-delete-tokens :type :boolean :ref nil :items nil :optional nil :doc "True if any tokens were deleted, false otherwise."))
  :doc "Removes all Trust Tokens issued by the provided issuerOrigin. Leaves other stored data, including the issuer's Redemption Records, intact." :experimental t :deprecated nil)

(define-domain-command get-interest-group-details
  :method "Storage.getInterestGroupDetails"
  :params (
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :name :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :details :type :object :ref nil :items nil :optional nil :doc "This largely corresponds to: https://wicg.github.io/turtledove/#dictdef-generatebidinterestgroup but has absolute expirationTime instead of relative lifetimeMs and also adds joiningOrigin."))
  :doc "Gets details for a named interest group." :experimental t :deprecated nil)

(define-domain-command set-interest-group-tracking
  :method "Storage.setInterestGroupTracking"
  :params (
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Enables/Disables issuing of interestGroupAccessed events." :experimental t :deprecated nil)

(define-domain-command set-interest-group-auction-tracking
  :method "Storage.setInterestGroupAuctionTracking"
  :params (
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Enables/Disables issuing of interestGroupAuctionEventOccurred and interestGroupAuctionNetworkRequestCreated." :experimental t :deprecated nil)

(define-domain-command get-shared-storage-metadata
  :method "Storage.getSharedStorageMetadata"
  :params (
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :metadata :type :ref :ref "SharedStorageMetadata" :items nil :optional nil :doc ""))
  :doc "Gets metadata for an origin's shared storage." :experimental t :deprecated nil)

(define-domain-command get-shared-storage-entries
  :method "Storage.getSharedStorageEntries"
  :params (
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :entries :type :array :ref nil :items (:type :ref :ref "SharedStorageEntry") :optional nil :doc ""))
  :doc "Gets the entries in an given origin's shared storage." :experimental t :deprecated nil)

(define-domain-command set-shared-storage-entry
  :method "Storage.setSharedStorageEntry"
  :params (
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "")
        (:name :ignore-if-present :type :boolean :ref nil :items nil :optional t :doc "If `ignoreIfPresent` is included and true, then only sets the entry if `key` doesn't already exist."))
  :returns nil
  :doc "Sets entry with `key` and `value` for a given origin's shared storage." :experimental t :deprecated nil)

(define-domain-command delete-shared-storage-entry
  :method "Storage.deleteSharedStorageEntry"
  :params (
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :key :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Deletes entry for `key` (if it exists) for a given origin's shared storage." :experimental t :deprecated nil)

(define-domain-command clear-shared-storage-entries
  :method "Storage.clearSharedStorageEntries"
  :params (
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Clears all entries for a given origin's shared storage." :experimental t :deprecated nil)

(define-domain-command reset-shared-storage-budget
  :method "Storage.resetSharedStorageBudget"
  :params (
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Resets the budget for `ownerOrigin` by clearing all budget withdrawals." :experimental t :deprecated nil)

(define-domain-command set-shared-storage-tracking
  :method "Storage.setSharedStorageTracking"
  :params (
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Enables/disables issuing of sharedStorageAccessed events." :experimental t :deprecated nil)

(define-domain-command set-storage-bucket-tracking
  :method "Storage.setStorageBucketTracking"
  :params (
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "")
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Set tracking for a storage key's buckets." :experimental t :deprecated nil)

(define-domain-command delete-storage-bucket
  :method "Storage.deleteStorageBucket"
  :params (
        (:name :bucket :type :ref :ref "StorageBucket" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Deletes the Storage Bucket with the given storage key and bucket name." :experimental t :deprecated nil)

(define-domain-command run-bounce-tracking-mitigations
  :method "Storage.runBounceTrackingMitigations"
  :params nil
  :returns (
        (:name :deleted-sites :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :doc "Deletes state for sites identified as potential bounce trackers, immediately." :experimental t :deprecated nil)

(define-domain-command set-attribution-reporting-local-testing-mode
  :method "Storage.setAttributionReportingLocalTestingMode"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "If enabled, noise is suppressed and reports are sent immediately."))
  :returns nil
  :doc "https://wicg.github.io/attribution-reporting-api/" :experimental t :deprecated nil)

(define-domain-command set-attribution-reporting-tracking
  :method "Storage.setAttributionReportingTracking"
  :params (
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Enables/disables issuing of Attribution Reporting events." :experimental t :deprecated nil)

(define-domain-command send-pending-attribution-reports
  :method "Storage.sendPendingAttributionReports"
  :params nil
  :returns (
        (:name :num-sent :type :integer :ref nil :items nil :optional nil :doc "The number of reports that were sent."))
  :doc "Sends all pending Attribution Reports immediately, regardless of their scheduled report time." :experimental t :deprecated nil)

(define-domain-command get-related-website-sets
  :method "Storage.getRelatedWebsiteSets"
  :params nil
  :returns (
        (:name :sets :type :array :ref nil :items (:type :ref :ref "RelatedWebsiteSet") :optional nil :doc ""))
  :doc "Returns the effective Related Website Sets in use by this profile for the browser session. The effective Related Website Sets will not change during a browser session." :experimental t :deprecated nil)

(define-domain-command get-affected-urls-for-third-party-cookie-metadata
  :method "Storage.getAffectedUrlsForThirdPartyCookieMetadata"
  :params (
        (:name :first-party-url :type :string :ref nil :items nil :optional nil :doc "The URL of the page currently being visited.")
        (:name :third-party-urls :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "The list of embedded resource URLs from the page."))
  :returns (
        (:name :matched-urls :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Array of matching URLs. If there is a primary pattern match for the first- party URL, only the first-party URL is returned in the array."))
  :doc "Returns the list of URLs from a page and its embedded resources that match existing grace period URL pattern rules. https://developers.google.com/privacy-sandbox/cookies/temporary-exceptions/grace-period" :experimental t :deprecated nil)

(define-domain-command set-protected-audience-k-anonymity
  :method "Storage.setProtectedAudienceKAnonymity"
  :params (
        (:name :owner :type :string :ref nil :items nil :optional nil :doc "")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :hashes :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-event cache-storage-content-updated
  :method "Storage.cacheStorageContentUpdated"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin to update.")
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key to update.")
        (:name :bucket-id :type :string :ref nil :items nil :optional nil :doc "Storage bucket to update.")
        (:name :cache-name :type :string :ref nil :items nil :optional nil :doc "Name of cache in origin."))
  :doc "A cache's contents have been modified." :experimental nil :deprecated nil)

(define-domain-event cache-storage-list-updated
  :method "Storage.cacheStorageListUpdated"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin to update.")
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key to update.")
        (:name :bucket-id :type :string :ref nil :items nil :optional nil :doc "Storage bucket to update."))
  :doc "A cache has been added/deleted." :experimental nil :deprecated nil)

(define-domain-event indexed-db-content-updated
  :method "Storage.indexedDBContentUpdated"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin to update.")
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key to update.")
        (:name :bucket-id :type :string :ref nil :items nil :optional nil :doc "Storage bucket to update.")
        (:name :database-name :type :string :ref nil :items nil :optional nil :doc "Database to update.")
        (:name :object-store-name :type :string :ref nil :items nil :optional nil :doc "ObjectStore to update."))
  :doc "The origin's IndexedDB object store has been modified." :experimental nil :deprecated nil)

(define-domain-event indexed-db-list-updated
  :method "Storage.indexedDBListUpdated"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin to update.")
        (:name :storage-key :type :string :ref nil :items nil :optional nil :doc "Storage key to update.")
        (:name :bucket-id :type :string :ref nil :items nil :optional nil :doc "Storage bucket to update."))
  :doc "The origin's IndexedDB database list has been modified." :experimental nil :deprecated nil)

(define-domain-event interest-group-accessed
  :method "Storage.interestGroupAccessed"
  :params (
        (:name :access-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "InterestGroupAccessType" :items nil :optional nil :doc "")
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc "")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :component-seller-origin :type :string :ref nil :items nil :optional t :doc "For topLevelBid/topLevelAdditionalBid, and when appropriate, win and additionalBidWin")
        (:name :bid :type :number :ref nil :items nil :optional t :doc "For bid or somethingBid event, if done locally and not on a server.")
        (:name :bid-currency :type :string :ref nil :items nil :optional t :doc "")
        (:name :unique-auction-id :type :ref :ref "InterestGroupAuctionId" :items nil :optional t :doc "For non-global events --- links to interestGroupAuctionEvent"))
  :doc "One of the interest groups was accessed. Note that these events are global to all targets sharing an interest group store." :experimental nil :deprecated nil)

(define-domain-event interest-group-auction-event-occurred
  :method "Storage.interestGroupAuctionEventOccurred"
  :params (
        (:name :event-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "InterestGroupAuctionEventType" :items nil :optional nil :doc "")
        (:name :unique-auction-id :type :ref :ref "InterestGroupAuctionId" :items nil :optional nil :doc "")
        (:name :parent-auction-id :type :ref :ref "InterestGroupAuctionId" :items nil :optional t :doc "Set for child auctions.")
        (:name :auction-config :type :object :ref nil :items nil :optional t :doc "Set for started and configResolved"))
  :doc "An auction involving interest groups is taking place. These events are target-specific." :experimental nil :deprecated nil)

(define-domain-event interest-group-auction-network-request-created
  :method "Storage.interestGroupAuctionNetworkRequestCreated"
  :params (
        (:name :type :type :ref :ref "InterestGroupAuctionFetchType" :items nil :optional nil :doc "")
        (:name :request-id :type :ref :ref "Network.RequestId" :items nil :optional nil :doc "")
        (:name :auctions :type :array :ref nil :items (:type :ref :ref "InterestGroupAuctionId") :optional nil :doc "This is the set of the auctions using the worklet that issued this request.  In the case of trusted signals, it's possible that only some of them actually care about the keys being queried."))
  :doc "Specifies which auctions a particular network fetch may be related to, and in what role. Note that it is not ordered with respect to Network.requestWillBeSent (but will happen before loadingFinished loadingFailed)." :experimental nil :deprecated nil)

(define-domain-event shared-storage-accessed
  :method "Storage.sharedStorageAccessed"
  :params (
        (:name :access-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "Time of the access.")
        (:name :scope :type :ref :ref "SharedStorageAccessScope" :items nil :optional nil :doc "Enum value indicating the access scope.")
        (:name :method :type :ref :ref "SharedStorageAccessMethod" :items nil :optional nil :doc "Enum value indicating the Shared Storage API method invoked.")
        (:name :main-frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "DevTools Frame Token for the primary frame tree's root.")
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc "Serialization of the origin owning the Shared Storage data.")
        (:name :owner-site :type :string :ref nil :items nil :optional nil :doc "Serialization of the site owning the Shared Storage data.")
        (:name :params :type :ref :ref "SharedStorageAccessParams" :items nil :optional nil :doc "The sub-parameters wrapped by `params` are all optional and their presence/absence depends on `type`."))
  :doc "Shared storage was accessed by the associated page. The following parameters are included in all events." :experimental nil :deprecated nil)

(define-domain-event shared-storage-worklet-operation-execution-finished
  :method "Storage.sharedStorageWorkletOperationExecutionFinished"
  :params (
        (:name :finished-time :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "Time that the operation finished.")
        (:name :execution-time :type :integer :ref nil :items nil :optional nil :doc "Time, in microseconds, from start of shared storage JS API call until end of operation execution in the worklet.")
        (:name :method :type :ref :ref "SharedStorageAccessMethod" :items nil :optional nil :doc "Enum value indicating the Shared Storage API method invoked.")
        (:name :operation-id :type :string :ref nil :items nil :optional nil :doc "ID of the operation call.")
        (:name :worklet-target-id :type :ref :ref "Target.TargetID" :items nil :optional nil :doc "Hex representation of the DevTools token used as the TargetID for the associated shared storage worklet.")
        (:name :main-frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "DevTools Frame Token for the primary frame tree's root.")
        (:name :owner-origin :type :string :ref nil :items nil :optional nil :doc "Serialization of the origin owning the Shared Storage data."))
  :doc "A shared storage run or selectURL operation finished its execution. The following parameters are included in all events." :experimental nil :deprecated nil)

(define-domain-event storage-bucket-created-or-updated
  :method "Storage.storageBucketCreatedOrUpdated"
  :params (
        (:name :bucket-info :type :ref :ref "StorageBucketInfo" :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event storage-bucket-deleted
  :method "Storage.storageBucketDeleted"
  :params (
        (:name :bucket-id :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event attribution-reporting-source-registered
  :method "Storage.attributionReportingSourceRegistered"
  :params (
        (:name :registration :type :ref :ref "AttributionReportingSourceRegistration" :items nil :optional nil :doc "")
        (:name :result :type :ref :ref "AttributionReportingSourceRegistrationResult" :items nil :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-event attribution-reporting-trigger-registered
  :method "Storage.attributionReportingTriggerRegistered"
  :params (
        (:name :registration :type :ref :ref "AttributionReportingTriggerRegistration" :items nil :optional nil :doc "")
        (:name :event-level :type :ref :ref "AttributionReportingEventLevelResult" :items nil :optional nil :doc "")
        (:name :aggregatable :type :ref :ref "AttributionReportingAggregatableResult" :items nil :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-event attribution-reporting-report-sent
  :method "Storage.attributionReportingReportSent"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :body :type :object :ref nil :items nil :optional nil :doc "")
        (:name :result :type :ref :ref "AttributionReportingReportResult" :items nil :optional nil :doc "")
        (:name :net-error :type :integer :ref nil :items nil :optional t :doc "If result is `sent`, populated with net/HTTP status.")
        (:name :net-error-name :type :string :ref nil :items nil :optional t :doc "")
        (:name :http-status-code :type :integer :ref nil :items nil :optional t :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-event attribution-reporting-verbose-debug-report-sent
  :method "Storage.attributionReportingVerboseDebugReportSent"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :body :type :array :ref nil :items (:type :object :ref nil) :optional t :doc "")
        (:name :net-error :type :integer :ref nil :items nil :optional t :doc "")
        (:name :net-error-name :type :string :ref nil :items nil :optional t :doc "")
        (:name :http-status-code :type :integer :ref nil :items nil :optional t :doc ""))
  :doc "" :experimental t :deprecated nil)

