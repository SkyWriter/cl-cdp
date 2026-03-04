;;;; Preload CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/preload
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

(in-package #:cdp/preload)

(define-domain-type rule-set-id
  :cdp-id "RuleSetId" :type :string
  :properties nil
  :enum nil
  :doc "Unique id" :experimental nil :deprecated nil)

(define-domain-type rule-set
  :cdp-id "RuleSet" :type :object
  :properties (
        (:name :id :type :ref :ref "RuleSetId" :items nil :optional nil :doc "")
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional nil :doc "Identifies a document which the rule set is associated with.")
        (:name :source-text :type :string :ref nil :items nil :optional nil :doc "Source text of JSON representing the rule set. If it comes from `<script>` tag, it is the textContent of the node. Note that it is a JSON for valid case.  See also: - https://wicg.github.io/nav-speculation/speculation-rules.html - https://github.com/WICG/nav-speculation/blob/main/triggers.md")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "A speculation rule set is either added through an inline `<script>` tag or through an external resource via the 'Speculation-Rules' HTTP header. For the first case, we include the BackendNodeId of the relevant `<script>` tag. For the second case, we include the external URL where the rule set was loaded from, and also RequestId if Network domain is enabled.  See also: - https://wicg.github.io/nav-speculation/speculation-rules.html#speculation-rules-script - https://wicg.github.io/nav-speculation/speculation-rules.html#speculation-rules-header")
        (:name :url :type :string :ref nil :items nil :optional t :doc "")
        (:name :request-id :type :ref :ref "Network.RequestId" :items nil :optional t :doc "")
        (:name :error-type :type :ref :ref "RuleSetErrorType" :items nil :optional t :doc "Error information `errorMessage` is null iff `errorType` is null.")
        (:name :error-message :type :string :ref nil :items nil :optional t :doc "TODO(https://crbug.com/1425354): Replace this property with structured error.")
        (:name :tag :type :string :ref nil :items nil :optional t :doc "For more details, see: https://github.com/WICG/nav-speculation/blob/main/speculation-rules-tags.md"))
  :enum nil
  :doc "Corresponds to SpeculationRuleSet" :experimental nil :deprecated nil)

(define-domain-type rule-set-error-type
  :cdp-id "RuleSetErrorType" :type :string
  :properties nil
  :enum '("SourceIsNotJsonObject" "InvalidRulesSkipped" "InvalidRulesetLevelTag")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type speculation-action
  :cdp-id "SpeculationAction" :type :string
  :properties nil
  :enum '("Prefetch" "Prerender" "PrerenderUntilScript")
  :doc "The type of preloading attempted. It corresponds to mojom::SpeculationAction (although PrefetchWithSubresources is omitted as it isn't being used by clients)." :experimental nil :deprecated nil)

(define-domain-type speculation-target-hint
  :cdp-id "SpeculationTargetHint" :type :string
  :properties nil
  :enum '("Blank" "Self")
  :doc "Corresponds to mojom::SpeculationTargetHint. See https://github.com/WICG/nav-speculation/blob/main/triggers.md#window-name-targeting-hints" :experimental nil :deprecated nil)

(define-domain-type preloading-attempt-key
  :cdp-id "PreloadingAttemptKey" :type :object
  :properties (
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional nil :doc "")
        (:name :action :type :ref :ref "SpeculationAction" :items nil :optional nil :doc "")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :target-hint :type :ref :ref "SpeculationTargetHint" :items nil :optional t :doc ""))
  :enum nil
  :doc "A key that identifies a preloading attempt.  The url used is the url specified by the trigger (i.e. the initial URL), and not the final url that is navigated to. For example, prerendering allows same-origin main frame navigations during the attempt, but the attempt is still keyed with the initial URL." :experimental nil :deprecated nil)

(define-domain-type preloading-attempt-source
  :cdp-id "PreloadingAttemptSource" :type :object
  :properties (
        (:name :key :type :ref :ref "PreloadingAttemptKey" :items nil :optional nil :doc "")
        (:name :rule-set-ids :type :array :ref nil :items (:type :ref :ref "RuleSetId") :optional nil :doc "")
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "DOM.BackendNodeId") :optional nil :doc ""))
  :enum nil
  :doc "Lists sources for a preloading attempt, specifically the ids of rule sets that had a speculation rule that triggered the attempt, and the BackendNodeIds of <a href> or <area href> elements that triggered the attempt (in the case of attempts triggered by a document rule). It is possible for multiple rule sets and links to trigger a single attempt." :experimental nil :deprecated nil)

(define-domain-type preload-pipeline-id
  :cdp-id "PreloadPipelineId" :type :string
  :properties nil
  :enum nil
  :doc "Chrome manages different types of preloads together using a concept of preloading pipeline. For example, if a site uses a SpeculationRules for prerender, Chrome first starts a prefetch and then upgrades it to prerender.  CDP events for them are emitted separately but they share `PreloadPipelineId`." :experimental nil :deprecated nil)

(define-domain-type prerender-final-status
  :cdp-id "PrerenderFinalStatus" :type :string
  :properties nil
  :enum '("Activated" "Destroyed" "LowEndDevice" "InvalidSchemeRedirect" "InvalidSchemeNavigation" "NavigationRequestBlockedByCsp" "MojoBinderPolicy" "RendererProcessCrashed" "RendererProcessKilled" "Download" "TriggerDestroyed" "NavigationNotCommitted" "NavigationBadHttpStatus" "ClientCertRequested" "NavigationRequestNetworkError" "CancelAllHostsForTesting" "DidFailLoad" "Stop" "SslCertificateError" "LoginAuthRequested" "UaChangeRequiresReload" "BlockedByClient" "AudioOutputDeviceRequested" "MixedContent" "TriggerBackgrounded" "MemoryLimitExceeded" "DataSaverEnabled" "TriggerUrlHasEffectiveUrl" "ActivatedBeforeStarted" "InactivePageRestriction" "StartFailed" "TimeoutBackgrounded" "CrossSiteRedirectInInitialNavigation" "CrossSiteNavigationInInitialNavigation" "SameSiteCrossOriginRedirectNotOptInInInitialNavigation" "SameSiteCrossOriginNavigationNotOptInInInitialNavigation" "ActivationNavigationParameterMismatch" "ActivatedInBackground" "EmbedderHostDisallowed" "ActivationNavigationDestroyedBeforeSuccess" "TabClosedByUserGesture" "TabClosedWithoutUserGesture" "PrimaryMainFrameRendererProcessCrashed" "PrimaryMainFrameRendererProcessKilled" "ActivationFramePolicyNotCompatible" "PreloadingDisabled" "BatterySaverEnabled" "ActivatedDuringMainFrameNavigation" "PreloadingUnsupportedByWebContents" "CrossSiteRedirectInMainFrameNavigation" "CrossSiteNavigationInMainFrameNavigation" "SameSiteCrossOriginRedirectNotOptInInMainFrameNavigation" "SameSiteCrossOriginNavigationNotOptInInMainFrameNavigation" "MemoryPressureOnTrigger" "MemoryPressureAfterTriggered" "PrerenderingDisabledByDevTools" "SpeculationRuleRemoved" "ActivatedWithAuxiliaryBrowsingContexts" "MaxNumOfRunningEagerPrerendersExceeded" "MaxNumOfRunningNonEagerPrerendersExceeded" "MaxNumOfRunningEmbedderPrerendersExceeded" "PrerenderingUrlHasEffectiveUrl" "RedirectedPrerenderingUrlHasEffectiveUrl" "ActivationUrlHasEffectiveUrl" "JavaScriptInterfaceAdded" "JavaScriptInterfaceRemoved" "AllPrerenderingCanceled" "WindowClosed" "SlowNetwork" "OtherPrerenderedPageActivated" "V8OptimizerDisabled" "PrerenderFailedDuringPrefetch" "BrowsingDataRemoved" "PrerenderHostReused")
  :doc "List of FinalStatus reasons for Prerender2." :experimental nil :deprecated nil)

(define-domain-type preloading-status
  :cdp-id "PreloadingStatus" :type :string
  :properties nil
  :enum '("Pending" "Running" "Ready" "Success" "Failure" "NotSupported")
  :doc "Preloading status values, see also PreloadingTriggeringOutcome. This status is shared by prefetchStatusUpdated and prerenderStatusUpdated." :experimental nil :deprecated nil)

(define-domain-type prefetch-status
  :cdp-id "PrefetchStatus" :type :string
  :properties nil
  :enum '("PrefetchAllowed" "PrefetchFailedIneligibleRedirect" "PrefetchFailedInvalidRedirect" "PrefetchFailedMIMENotSupported" "PrefetchFailedNetError" "PrefetchFailedNon2XX" "PrefetchEvictedAfterBrowsingDataRemoved" "PrefetchEvictedAfterCandidateRemoved" "PrefetchEvictedForNewerPrefetch" "PrefetchHeldback" "PrefetchIneligibleRetryAfter" "PrefetchIsPrivacyDecoy" "PrefetchIsStale" "PrefetchNotEligibleBrowserContextOffTheRecord" "PrefetchNotEligibleDataSaverEnabled" "PrefetchNotEligibleExistingProxy" "PrefetchNotEligibleHostIsNonUnique" "PrefetchNotEligibleNonDefaultStoragePartition" "PrefetchNotEligibleSameSiteCrossOriginPrefetchRequiredProxy" "PrefetchNotEligibleSchemeIsNotHttps" "PrefetchNotEligibleUserHasCookies" "PrefetchNotEligibleUserHasServiceWorker" "PrefetchNotEligibleUserHasServiceWorkerNoFetchHandler" "PrefetchNotEligibleRedirectFromServiceWorker" "PrefetchNotEligibleRedirectToServiceWorker" "PrefetchNotEligibleBatterySaverEnabled" "PrefetchNotEligiblePreloadingDisabled" "PrefetchNotFinishedInTime" "PrefetchNotStarted" "PrefetchNotUsedCookiesChanged" "PrefetchProxyNotAvailable" "PrefetchResponseUsed" "PrefetchSuccessfulButNotUsed" "PrefetchNotUsedProbeFailed")
  :doc "TODO(https://crbug.com/1384419): revisit the list of PrefetchStatus and filter out the ones that aren't necessary to the developers." :experimental nil :deprecated nil)

(define-domain-type prerender-mismatched-headers
  :cdp-id "PrerenderMismatchedHeaders" :type :object
  :properties (
        (:name :header-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :initial-value :type :string :ref nil :items nil :optional t :doc "")
        (:name :activation-value :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "Information of headers to be displayed when the header mismatch occurred." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Preload.enable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Preload.disable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-event rule-set-updated
  :method "Preload.ruleSetUpdated"
  :params (
        (:name :rule-set :type :ref :ref "RuleSet" :items nil :optional nil :doc ""))
  :doc "Upsert. Currently, it is only emitted when a rule set added." :experimental nil :deprecated nil)

(define-domain-event rule-set-removed
  :method "Preload.ruleSetRemoved"
  :params (
        (:name :id :type :ref :ref "RuleSetId" :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event preload-enabled-state-updated
  :method "Preload.preloadEnabledStateUpdated"
  :params (
        (:name :disabled-by-preference :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :disabled-by-data-saver :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :disabled-by-battery-saver :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :disabled-by-holdback-prefetch-speculation-rules :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :disabled-by-holdback-prerender-speculation-rules :type :boolean :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when a preload enabled state is updated." :experimental nil :deprecated nil)

(define-domain-event prefetch-status-updated
  :method "Preload.prefetchStatusUpdated"
  :params (
        (:name :key :type :ref :ref "PreloadingAttemptKey" :items nil :optional nil :doc "")
        (:name :pipeline-id :type :ref :ref "PreloadPipelineId" :items nil :optional nil :doc "")
        (:name :initiating-frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "The frame id of the frame initiating prefetch.")
        (:name :prefetch-url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :status :type :ref :ref "PreloadingStatus" :items nil :optional nil :doc "")
        (:name :prefetch-status :type :ref :ref "PrefetchStatus" :items nil :optional nil :doc "")
        (:name :request-id :type :ref :ref "Network.RequestId" :items nil :optional nil :doc ""))
  :doc "Fired when a prefetch attempt is updated." :experimental nil :deprecated nil)

(define-domain-event prerender-status-updated
  :method "Preload.prerenderStatusUpdated"
  :params (
        (:name :key :type :ref :ref "PreloadingAttemptKey" :items nil :optional nil :doc "")
        (:name :pipeline-id :type :ref :ref "PreloadPipelineId" :items nil :optional nil :doc "")
        (:name :status :type :ref :ref "PreloadingStatus" :items nil :optional nil :doc "")
        (:name :prerender-status :type :ref :ref "PrerenderFinalStatus" :items nil :optional t :doc "")
        (:name :disallowed-mojo-interface :type :string :ref nil :items nil :optional t :doc "This is used to give users more information about the name of Mojo interface that is incompatible with prerender and has caused the cancellation of the attempt.")
        (:name :mismatched-headers :type :array :ref nil :items (:type :ref :ref "PrerenderMismatchedHeaders") :optional t :doc ""))
  :doc "Fired when a prerender attempt is updated." :experimental nil :deprecated nil)

(define-domain-event preloading-attempt-sources-updated
  :method "Preload.preloadingAttemptSourcesUpdated"
  :params (
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional nil :doc "")
        (:name :preloading-attempt-sources :type :array :ref nil :items (:type :ref :ref "PreloadingAttemptSource") :optional nil :doc ""))
  :doc "Send a list of sources for all preloading attempts in a document." :experimental nil :deprecated nil)

