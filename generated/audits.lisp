;;;; Audits CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/audits
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

(in-package #:cdp/audits)

(define-domain-type affected-cookie
  :cdp-id "AffectedCookie" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "The following three properties uniquely identify a cookie")
        (:name :path :type :string :ref nil :items nil :optional nil :doc "")
        (:name :domain :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Information about a cookie that is affected by an inspector issue." :experimental nil :deprecated nil)

(define-domain-type affected-request
  :cdp-id "AffectedRequest" :type :object
  :properties (
        (:name :request-id :type :ref :ref "Network.RequestId" :items nil :optional t :doc "The unique request id.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Information about a request that is affected by an inspector issue." :experimental nil :deprecated nil)

(define-domain-type affected-frame
  :cdp-id "AffectedFrame" :type :object
  :properties (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Information about the frame affected by an inspector issue." :experimental nil :deprecated nil)

(define-domain-type cookie-exclusion-reason
  :cdp-id "CookieExclusionReason" :type :string
  :properties nil
  :enum '("ExcludeSameSiteUnspecifiedTreatedAsLax" "ExcludeSameSiteNoneInsecure" "ExcludeSameSiteLax" "ExcludeSameSiteStrict" "ExcludeDomainNonASCII" "ExcludeThirdPartyCookieBlockedInFirstPartySet" "ExcludeThirdPartyPhaseout" "ExcludePortMismatch" "ExcludeSchemeMismatch")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type cookie-warning-reason
  :cdp-id "CookieWarningReason" :type :string
  :properties nil
  :enum '("WarnSameSiteUnspecifiedCrossSiteContext" "WarnSameSiteNoneInsecure" "WarnSameSiteUnspecifiedLaxAllowUnsafe" "WarnSameSiteStrictLaxDowngradeStrict" "WarnSameSiteStrictCrossDowngradeStrict" "WarnSameSiteStrictCrossDowngradeLax" "WarnSameSiteLaxCrossDowngradeStrict" "WarnSameSiteLaxCrossDowngradeLax" "WarnAttributeValueExceedsMaxSize" "WarnDomainNonASCII" "WarnThirdPartyPhaseout" "WarnCrossSiteRedirectDowngradeChangesInclusion" "WarnDeprecationTrialMetadata" "WarnThirdPartyCookieHeuristic")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type cookie-operation
  :cdp-id "CookieOperation" :type :string
  :properties nil
  :enum '("SetCookie" "ReadCookie")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type insight-type
  :cdp-id "InsightType" :type :string
  :properties nil
  :enum '("GitHubResource" "GracePeriod" "Heuristics")
  :doc "Represents the category of insight that a cookie issue falls under." :experimental nil :deprecated nil)

(define-domain-type cookie-issue-insight
  :cdp-id "CookieIssueInsight" :type :object
  :properties (
        (:name :type :type :ref :ref "InsightType" :items nil :optional nil :doc "")
        (:name :table-entry-url :type :string :ref nil :items nil :optional t :doc "Link to table entry in third-party cookie migration readiness list."))
  :enum nil
  :doc "Information about the suggested solution to a cookie issue." :experimental nil :deprecated nil)

(define-domain-type cookie-issue-details
  :cdp-id "CookieIssueDetails" :type :object
  :properties (
        (:name :cookie :type :ref :ref "AffectedCookie" :items nil :optional t :doc "If AffectedCookie is not set then rawCookieLine contains the raw Set-Cookie header string. This hints at a problem where the cookie line is syntactically or semantically malformed in a way that no valid cookie could be created.")
        (:name :raw-cookie-line :type :string :ref nil :items nil :optional t :doc "")
        (:name :cookie-warning-reasons :type :array :ref nil :items (:type :ref :ref "CookieWarningReason") :optional nil :doc "")
        (:name :cookie-exclusion-reasons :type :array :ref nil :items (:type :ref :ref "CookieExclusionReason") :optional nil :doc "")
        (:name :operation :type :ref :ref "CookieOperation" :items nil :optional nil :doc "Optionally identifies the site-for-cookies and the cookie url, which may be used by the front-end as additional context.")
        (:name :site-for-cookies :type :string :ref nil :items nil :optional t :doc "")
        (:name :cookie-url :type :string :ref nil :items nil :optional t :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional t :doc "")
        (:name :insight :type :ref :ref "CookieIssueInsight" :items nil :optional t :doc "The recommended solution to the issue."))
  :enum nil
  :doc "This information is currently necessary, as the front-end has a difficult time finding a specific cookie. With this, we can convey specific error information without the cookie." :experimental nil :deprecated nil)

(define-domain-type performance-issue-type
  :cdp-id "PerformanceIssueType" :type :string
  :properties nil
  :enum '("DocumentCookie")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type performance-issue-details
  :cdp-id "PerformanceIssueDetails" :type :object
  :properties (
        (:name :performance-issue-type :type :ref :ref "PerformanceIssueType" :items nil :optional nil :doc "")
        (:name :source-code-location :type :ref :ref "SourceCodeLocation" :items nil :optional t :doc ""))
  :enum nil
  :doc "Details for a performance issue." :experimental nil :deprecated nil)

(define-domain-type mixed-content-resolution-status
  :cdp-id "MixedContentResolutionStatus" :type :string
  :properties nil
  :enum '("MixedContentBlocked" "MixedContentAutomaticallyUpgraded" "MixedContentWarning")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type mixed-content-resource-type
  :cdp-id "MixedContentResourceType" :type :string
  :properties nil
  :enum '("AttributionSrc" "Audio" "Beacon" "CSPReport" "Download" "EventSource" "Favicon" "Font" "Form" "Frame" "Image" "Import" "JSON" "Manifest" "Ping" "PluginData" "PluginResource" "Prefetch" "Resource" "Script" "ServiceWorker" "SharedWorker" "SpeculationRules" "Stylesheet" "Track" "Video" "Worker" "XMLHttpRequest" "XSLT")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type mixed-content-issue-details
  :cdp-id "MixedContentIssueDetails" :type :object
  :properties (
        (:name :resource-type :type :ref :ref "MixedContentResourceType" :items nil :optional t :doc "The type of resource causing the mixed content issue (css, js, iframe, form,...). Marked as optional because it is mapped to from blink::mojom::RequestContextType, which will be replaced by network::mojom::RequestDestination")
        (:name :resolution-status :type :ref :ref "MixedContentResolutionStatus" :items nil :optional nil :doc "The way the mixed content issue is being resolved.")
        (:name :insecure-url :type :string :ref nil :items nil :optional nil :doc "The unsafe http url causing the mixed content issue.")
        (:name :main-resource-url :type :string :ref nil :items nil :optional nil :doc "The url responsible for the call to an unsafe url.")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional t :doc "The mixed content request. Does not always exist (e.g. for unsafe form submission urls).")
        (:name :frame :type :ref :ref "AffectedFrame" :items nil :optional t :doc "Optional because not every mixed content issue is necessarily linked to a frame."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type blocked-by-response-reason
  :cdp-id "BlockedByResponseReason" :type :string
  :properties nil
  :enum '("CoepFrameResourceNeedsCoepHeader" "CoopSandboxedIFrameCannotNavigateToCoopPage" "CorpNotSameOrigin" "CorpNotSameOriginAfterDefaultedToSameOriginByCoep" "CorpNotSameOriginAfterDefaultedToSameOriginByDip" "CorpNotSameOriginAfterDefaultedToSameOriginByCoepAndDip" "CorpNotSameSite" "SRIMessageSignatureMismatch")
  :doc "Enum indicating the reason a response has been blocked. These reasons are refinements of the net error BLOCKED_BY_RESPONSE." :experimental nil :deprecated nil)

(define-domain-type blocked-by-response-issue-details
  :cdp-id "BlockedByResponseIssueDetails" :type :object
  :properties (
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional nil :doc "")
        (:name :parent-frame :type :ref :ref "AffectedFrame" :items nil :optional t :doc "")
        (:name :blocked-frame :type :ref :ref "AffectedFrame" :items nil :optional t :doc "")
        (:name :reason :type :ref :ref "BlockedByResponseReason" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Details for a request that has been blocked with the BLOCKED_BY_RESPONSE code. Currently only used for COEP/COOP, but may be extended to include some CSP errors in the future." :experimental nil :deprecated nil)

(define-domain-type heavy-ad-resolution-status
  :cdp-id "HeavyAdResolutionStatus" :type :string
  :properties nil
  :enum '("HeavyAdBlocked" "HeavyAdWarning")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type heavy-ad-reason
  :cdp-id "HeavyAdReason" :type :string
  :properties nil
  :enum '("NetworkTotalLimit" "CpuTotalLimit" "CpuPeakLimit")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type heavy-ad-issue-details
  :cdp-id "HeavyAdIssueDetails" :type :object
  :properties (
        (:name :resolution :type :ref :ref "HeavyAdResolutionStatus" :items nil :optional nil :doc "The resolution status, either blocking the content or warning.")
        (:name :reason :type :ref :ref "HeavyAdReason" :items nil :optional nil :doc "The reason the ad was blocked, total network or cpu or peak cpu.")
        (:name :frame :type :ref :ref "AffectedFrame" :items nil :optional nil :doc "The frame that was blocked."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type content-security-policy-violation-type
  :cdp-id "ContentSecurityPolicyViolationType" :type :string
  :properties nil
  :enum '("kInlineViolation" "kEvalViolation" "kURLViolation" "kSRIViolation" "kTrustedTypesSinkViolation" "kTrustedTypesPolicyViolation" "kWasmEvalViolation")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type source-code-location
  :cdp-id "SourceCodeLocation" :type :object
  :properties (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional t :doc "")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :column-number :type :integer :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type content-security-policy-issue-details
  :cdp-id "ContentSecurityPolicyIssueDetails" :type :object
  :properties (
        (:name :blocked-url :type :string :ref nil :items nil :optional t :doc "The url not included in allowed sources.")
        (:name :violated-directive :type :string :ref nil :items nil :optional nil :doc "Specific directive that is violated, causing the CSP issue.")
        (:name :is-report-only :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :content-security-policy-violation-type :type :ref :ref "ContentSecurityPolicyViolationType" :items nil :optional nil :doc "")
        (:name :frame-ancestor :type :ref :ref "AffectedFrame" :items nil :optional t :doc "")
        (:name :source-code-location :type :ref :ref "SourceCodeLocation" :items nil :optional t :doc "")
        (:name :violating-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type shared-array-buffer-issue-type
  :cdp-id "SharedArrayBufferIssueType" :type :string
  :properties nil
  :enum '("TransferIssue" "CreationIssue")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type shared-array-buffer-issue-details
  :cdp-id "SharedArrayBufferIssueDetails" :type :object
  :properties (
        (:name :source-code-location :type :ref :ref "SourceCodeLocation" :items nil :optional nil :doc "")
        (:name :is-warning :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :type :type :ref :ref "SharedArrayBufferIssueType" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Details for a issue arising from an SAB being instantiated in, or transferred to a context that is not cross-origin isolated." :experimental nil :deprecated nil)

(define-domain-type low-text-contrast-issue-details
  :cdp-id "LowTextContrastIssueDetails" :type :object
  :properties (
        (:name :violating-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "")
        (:name :violating-node-selector :type :string :ref nil :items nil :optional nil :doc "")
        (:name :contrast-ratio :type :number :ref nil :items nil :optional nil :doc "")
        (:name :threshold-aa :type :number :ref nil :items nil :optional nil :doc "")
        (:name :threshold-aaa :type :number :ref nil :items nil :optional nil :doc "")
        (:name :font-size :type :string :ref nil :items nil :optional nil :doc "")
        (:name :font-weight :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type cors-issue-details
  :cdp-id "CorsIssueDetails" :type :object
  :properties (
        (:name :cors-error-status :type :ref :ref "Network.CorsErrorStatus" :items nil :optional nil :doc "")
        (:name :is-warning :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional nil :doc "")
        (:name :location :type :ref :ref "SourceCodeLocation" :items nil :optional t :doc "")
        (:name :initiator-origin :type :string :ref nil :items nil :optional t :doc "")
        (:name :resource-ip-address-space :type :ref :ref "Network.IPAddressSpace" :items nil :optional t :doc "")
        (:name :client-security-state :type :ref :ref "Network.ClientSecurityState" :items nil :optional t :doc ""))
  :enum nil
  :doc "Details for a CORS related issue, e.g. a warning or error related to CORS RFC1918 enforcement." :experimental nil :deprecated nil)

(define-domain-type attribution-reporting-issue-type
  :cdp-id "AttributionReportingIssueType" :type :string
  :properties nil
  :enum '("PermissionPolicyDisabled" "UntrustworthyReportingOrigin" "InsecureContext" "InvalidHeader" "InvalidRegisterTriggerHeader" "SourceAndTriggerHeaders" "SourceIgnored" "TriggerIgnored" "OsSourceIgnored" "OsTriggerIgnored" "InvalidRegisterOsSourceHeader" "InvalidRegisterOsTriggerHeader" "WebAndOsHeaders" "NoWebOrOsSupport" "NavigationRegistrationWithoutTransientUserActivation" "InvalidInfoHeader" "NoRegisterSourceHeader" "NoRegisterTriggerHeader" "NoRegisterOsSourceHeader" "NoRegisterOsTriggerHeader" "NavigationRegistrationUniqueScopeAlreadySet")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type shared-dictionary-error
  :cdp-id "SharedDictionaryError" :type :string
  :properties nil
  :enum '("UseErrorCrossOriginNoCorsRequest" "UseErrorDictionaryLoadFailure" "UseErrorMatchingDictionaryNotUsed" "UseErrorUnexpectedContentDictionaryHeader" "WriteErrorCossOriginNoCorsRequest" "WriteErrorDisallowedBySettings" "WriteErrorExpiredResponse" "WriteErrorFeatureDisabled" "WriteErrorInsufficientResources" "WriteErrorInvalidMatchField" "WriteErrorInvalidStructuredHeader" "WriteErrorInvalidTTLField" "WriteErrorNavigationRequest" "WriteErrorNoMatchField" "WriteErrorNonIntegerTTLField" "WriteErrorNonListMatchDestField" "WriteErrorNonSecureContext" "WriteErrorNonStringIdField" "WriteErrorNonStringInMatchDestList" "WriteErrorNonStringMatchField" "WriteErrorNonTokenTypeField" "WriteErrorRequestAborted" "WriteErrorShuttingDown" "WriteErrorTooLongIdField" "WriteErrorUnsupportedType")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type sri-message-signature-error
  :cdp-id "SRIMessageSignatureError" :type :string
  :properties nil
  :enum '("MissingSignatureHeader" "MissingSignatureInputHeader" "InvalidSignatureHeader" "InvalidSignatureInputHeader" "SignatureHeaderValueIsNotByteSequence" "SignatureHeaderValueIsParameterized" "SignatureHeaderValueIsIncorrectLength" "SignatureInputHeaderMissingLabel" "SignatureInputHeaderValueNotInnerList" "SignatureInputHeaderValueMissingComponents" "SignatureInputHeaderInvalidComponentType" "SignatureInputHeaderInvalidComponentName" "SignatureInputHeaderInvalidHeaderComponentParameter" "SignatureInputHeaderInvalidDerivedComponentParameter" "SignatureInputHeaderKeyIdLength" "SignatureInputHeaderInvalidParameter" "SignatureInputHeaderMissingRequiredParameters" "ValidationFailedSignatureExpired" "ValidationFailedInvalidLength" "ValidationFailedSignatureMismatch" "ValidationFailedIntegrityMismatch")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type unencoded-digest-error
  :cdp-id "UnencodedDigestError" :type :string
  :properties nil
  :enum '("MalformedDictionary" "UnknownAlgorithm" "IncorrectDigestType" "IncorrectDigestLength")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type connection-allowlist-error
  :cdp-id "ConnectionAllowlistError" :type :string
  :properties nil
  :enum '("InvalidHeader" "MoreThanOneList" "ItemNotInnerList" "InvalidAllowlistItemType" "ReportingEndpointNotToken" "InvalidUrlPattern")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type attribution-reporting-issue-details
  :cdp-id "AttributionReportingIssueDetails" :type :object
  :properties (
        (:name :violation-type :type :ref :ref "AttributionReportingIssueType" :items nil :optional nil :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional t :doc "")
        (:name :violating-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "")
        (:name :invalid-parameter :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "Details for issues around \"Attribution Reporting API\" usage. Explainer: https://github.com/WICG/attribution-reporting-api" :experimental nil :deprecated nil)

(define-domain-type quirks-mode-issue-details
  :cdp-id "QuirksModeIssueDetails" :type :object
  :properties (
        (:name :is-limited-quirks-mode :type :boolean :ref nil :items nil :optional nil :doc "If false, it means the document's mode is \"quirks\" instead of \"limited-quirks\".")
        (:name :document-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "")
        (:name :loader-id :type :ref :ref "Network.LoaderId" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Details for issues about documents in Quirks Mode or Limited Quirks Mode that affects page layouting." :experimental nil :deprecated nil)

(define-domain-type navigator-user-agent-issue-details
  :cdp-id "NavigatorUserAgentIssueDetails" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :location :type :ref :ref "SourceCodeLocation" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated t)

(define-domain-type shared-dictionary-issue-details
  :cdp-id "SharedDictionaryIssueDetails" :type :object
  :properties (
        (:name :shared-dictionary-error :type :ref :ref "SharedDictionaryError" :items nil :optional nil :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type sri-message-signature-issue-details
  :cdp-id "SRIMessageSignatureIssueDetails" :type :object
  :properties (
        (:name :error :type :ref :ref "SRIMessageSignatureError" :items nil :optional nil :doc "")
        (:name :signature-base :type :string :ref nil :items nil :optional nil :doc "")
        (:name :integrity-assertions :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type unencoded-digest-issue-details
  :cdp-id "UnencodedDigestIssueDetails" :type :object
  :properties (
        (:name :error :type :ref :ref "UnencodedDigestError" :items nil :optional nil :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type connection-allowlist-issue-details
  :cdp-id "ConnectionAllowlistIssueDetails" :type :object
  :properties (
        (:name :error :type :ref :ref "ConnectionAllowlistError" :items nil :optional nil :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type generic-issue-error-type
  :cdp-id "GenericIssueErrorType" :type :string
  :properties nil
  :enum '("FormLabelForNameError" "FormDuplicateIdForInputError" "FormInputWithNoLabelError" "FormAutocompleteAttributeEmptyError" "FormEmptyIdAndNameAttributesForInputError" "FormAriaLabelledByToNonExistingIdError" "FormInputAssignedAutocompleteValueToIdOrNameAttributeError" "FormLabelHasNeitherForNorNestedInputError" "FormLabelForMatchesNonExistingIdError" "FormInputHasWrongButWellIntendedAutocompleteValueError" "ResponseWasBlockedByORB" "NavigationEntryMarkedSkippable" "AutofillAndManualTextPolicyControlledFeaturesInfo" "AutofillPolicyControlledFeatureInfo" "ManualTextPolicyControlledFeatureInfo")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type generic-issue-details
  :cdp-id "GenericIssueDetails" :type :object
  :properties (
        (:name :error-type :type :ref :ref "GenericIssueErrorType" :items nil :optional nil :doc "Issues with the same errorType are aggregated in the frontend.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "")
        (:name :violating-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "")
        (:name :violating-node-attribute :type :string :ref nil :items nil :optional t :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional t :doc ""))
  :enum nil
  :doc "Depending on the concrete errorType, different properties are set." :experimental nil :deprecated nil)

(define-domain-type deprecation-issue-details
  :cdp-id "DeprecationIssueDetails" :type :object
  :properties (
        (:name :affected-frame :type :ref :ref "AffectedFrame" :items nil :optional t :doc "")
        (:name :source-code-location :type :ref :ref "SourceCodeLocation" :items nil :optional nil :doc "")
        (:name :type :type :string :ref nil :items nil :optional nil :doc "One of the deprecation names from third_party/blink/renderer/core/frame/deprecation/deprecation.json5"))
  :enum nil
  :doc "This issue tracks information needed to print a deprecation message. https://source.chromium.org/chromium/chromium/src/+/main:third_party/blink/renderer/core/frame/third_party/blink/renderer/core/frame/deprecation/README.md" :experimental nil :deprecated nil)

(define-domain-type bounce-tracking-issue-details
  :cdp-id "BounceTrackingIssueDetails" :type :object
  :properties (
        (:name :tracking-sites :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :enum nil
  :doc "This issue warns about sites in the redirect chain of a finished navigation that may be flagged as trackers and have their state cleared if they don't receive a user interaction. Note that in this context 'site' means eTLD+1. For example, if the URL `https://example.test:80/bounce` was in the redirect chain, the site reported would be `example.test`." :experimental nil :deprecated nil)

(define-domain-type cookie-deprecation-metadata-issue-details
  :cdp-id "CookieDeprecationMetadataIssueDetails" :type :object
  :properties (
        (:name :allowed-sites :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "")
        (:name :opt-out-percentage :type :number :ref nil :items nil :optional nil :doc "")
        (:name :is-opt-out-top-level :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :operation :type :ref :ref "CookieOperation" :items nil :optional nil :doc ""))
  :enum nil
  :doc "This issue warns about third-party sites that are accessing cookies on the current page, and have been permitted due to having a global metadata grant. Note that in this context 'site' means eTLD+1. For example, if the URL `https://example.test:80/web_page` was accessing cookies, the site reported would be `example.test`." :experimental nil :deprecated nil)

(define-domain-type client-hint-issue-reason
  :cdp-id "ClientHintIssueReason" :type :string
  :properties nil
  :enum '("MetaTagAllowListInvalidOrigin" "MetaTagModifiedHTML")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type federated-auth-request-issue-details
  :cdp-id "FederatedAuthRequestIssueDetails" :type :object
  :properties (
        (:name :federated-auth-request-issue-reason :type :ref :ref "FederatedAuthRequestIssueReason" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type federated-auth-request-issue-reason
  :cdp-id "FederatedAuthRequestIssueReason" :type :string
  :properties nil
  :enum '("ShouldEmbargo" "TooManyRequests" "WellKnownHttpNotFound" "WellKnownNoResponse" "WellKnownInvalidResponse" "WellKnownListEmpty" "WellKnownInvalidContentType" "ConfigNotInWellKnown" "WellKnownTooBig" "ConfigHttpNotFound" "ConfigNoResponse" "ConfigInvalidResponse" "ConfigInvalidContentType" "IdpNotPotentiallyTrustworthy" "DisabledInSettings" "DisabledInFlags" "ErrorFetchingSignin" "InvalidSigninResponse" "AccountsHttpNotFound" "AccountsNoResponse" "AccountsInvalidResponse" "AccountsListEmpty" "AccountsInvalidContentType" "IdTokenHttpNotFound" "IdTokenNoResponse" "IdTokenInvalidResponse" "IdTokenIdpErrorResponse" "IdTokenCrossSiteIdpErrorResponse" "IdTokenInvalidRequest" "IdTokenInvalidContentType" "ErrorIdToken" "Canceled" "RpPageNotVisible" "SilentMediationFailure" "NotSignedInWithIdp" "MissingTransientUserActivation" "ReplacedByActiveMode" "RelyingPartyOriginIsOpaque" "TypeNotMatching" "UiDismissedNoEmbargo" "CorsError" "SuppressedBySegmentationPlatform")
  :doc "Represents the failure reason when a federated authentication reason fails. Should be updated alongside RequestIdTokenStatus in third_party/blink/public/mojom/devtools/inspector_issue.mojom to include all cases except for success." :experimental nil :deprecated nil)

(define-domain-type federated-auth-user-info-request-issue-details
  :cdp-id "FederatedAuthUserInfoRequestIssueDetails" :type :object
  :properties (
        (:name :federated-auth-user-info-request-issue-reason :type :ref :ref "FederatedAuthUserInfoRequestIssueReason" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type federated-auth-user-info-request-issue-reason
  :cdp-id "FederatedAuthUserInfoRequestIssueReason" :type :string
  :properties nil
  :enum '("NotSameOrigin" "NotIframe" "NotPotentiallyTrustworthy" "NoApiPermission" "NotSignedInWithIdp" "NoAccountSharingPermission" "InvalidConfigOrWellKnown" "InvalidAccountsResponse" "NoReturningUserFromFetchedAccounts")
  :doc "Represents the failure reason when a getUserInfo() call fails. Should be updated alongside FederatedAuthUserInfoRequestResult in third_party/blink/public/mojom/devtools/inspector_issue.mojom." :experimental nil :deprecated nil)

(define-domain-type client-hint-issue-details
  :cdp-id "ClientHintIssueDetails" :type :object
  :properties (
        (:name :source-code-location :type :ref :ref "SourceCodeLocation" :items nil :optional nil :doc "")
        (:name :client-hint-issue-reason :type :ref :ref "ClientHintIssueReason" :items nil :optional nil :doc ""))
  :enum nil
  :doc "This issue tracks client hints related issues. It's used to deprecate old features, encourage the use of new ones, and provide general guidance." :experimental nil :deprecated nil)

(define-domain-type failed-request-info
  :cdp-id "FailedRequestInfo" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The URL that failed to load.")
        (:name :failure-message :type :string :ref nil :items nil :optional nil :doc "The failure message for the failed request.")
        (:name :request-id :type :ref :ref "Network.RequestId" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type partitioning-blob-url-info
  :cdp-id "PartitioningBlobURLInfo" :type :string
  :properties nil
  :enum '("BlockedCrossPartitionFetching" "EnforceNoopenerForNavigation")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type partitioning-blob-url-issue-details
  :cdp-id "PartitioningBlobURLIssueDetails" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The BlobURL that failed to load.")
        (:name :partitioning-blob-url-info :type :ref :ref "PartitioningBlobURLInfo" :items nil :optional nil :doc "Additional information about the Partitioning Blob URL issue."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type element-accessibility-issue-reason
  :cdp-id "ElementAccessibilityIssueReason" :type :string
  :properties nil
  :enum '("DisallowedSelectChild" "DisallowedOptGroupChild" "NonPhrasingContentOptionChild" "InteractiveContentOptionChild" "InteractiveContentLegendChild" "InteractiveContentSummaryDescendant")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type element-accessibility-issue-details
  :cdp-id "ElementAccessibilityIssueDetails" :type :object
  :properties (
        (:name :node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "")
        (:name :element-accessibility-issue-reason :type :ref :ref "ElementAccessibilityIssueReason" :items nil :optional nil :doc "")
        (:name :has-disallowed-attributes :type :boolean :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "This issue warns about errors in the select or summary element content model." :experimental nil :deprecated nil)

(define-domain-type style-sheet-loading-issue-reason
  :cdp-id "StyleSheetLoadingIssueReason" :type :string
  :properties nil
  :enum '("LateImportRule" "RequestFailed")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type stylesheet-loading-issue-details
  :cdp-id "StylesheetLoadingIssueDetails" :type :object
  :properties (
        (:name :source-code-location :type :ref :ref "SourceCodeLocation" :items nil :optional nil :doc "Source code position that referenced the failing stylesheet.")
        (:name :style-sheet-loading-issue-reason :type :ref :ref "StyleSheetLoadingIssueReason" :items nil :optional nil :doc "Reason why the stylesheet couldn't be loaded.")
        (:name :failed-request-info :type :ref :ref "FailedRequestInfo" :items nil :optional t :doc "Contains additional info when the failure was due to a request."))
  :enum nil
  :doc "This issue warns when a referenced stylesheet couldn't be loaded." :experimental nil :deprecated nil)

(define-domain-type property-rule-issue-reason
  :cdp-id "PropertyRuleIssueReason" :type :string
  :properties nil
  :enum '("InvalidSyntax" "InvalidInitialValue" "InvalidInherits" "InvalidName")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type property-rule-issue-details
  :cdp-id "PropertyRuleIssueDetails" :type :object
  :properties (
        (:name :source-code-location :type :ref :ref "SourceCodeLocation" :items nil :optional nil :doc "Source code position of the property rule.")
        (:name :property-rule-issue-reason :type :ref :ref "PropertyRuleIssueReason" :items nil :optional nil :doc "Reason why the property rule was discarded.")
        (:name :property-value :type :string :ref nil :items nil :optional t :doc "The value of the property rule property that failed to parse"))
  :enum nil
  :doc "This issue warns about errors in property rules that lead to property registrations being ignored." :experimental nil :deprecated nil)

(define-domain-type user-reidentification-issue-type
  :cdp-id "UserReidentificationIssueType" :type :string
  :properties nil
  :enum '("BlockedFrameNavigation" "BlockedSubresource" "NoisedCanvasReadback")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type user-reidentification-issue-details
  :cdp-id "UserReidentificationIssueDetails" :type :object
  :properties (
        (:name :type :type :ref :ref "UserReidentificationIssueType" :items nil :optional nil :doc "")
        (:name :request :type :ref :ref "AffectedRequest" :items nil :optional t :doc "Applies to BlockedFrameNavigation and BlockedSubresource issue types.")
        (:name :source-code-location :type :ref :ref "SourceCodeLocation" :items nil :optional t :doc "Applies to NoisedCanvasReadback issue type."))
  :enum nil
  :doc "This issue warns about uses of APIs that may be considered misuse to re-identify users." :experimental nil :deprecated nil)

(define-domain-type permission-element-issue-type
  :cdp-id "PermissionElementIssueType" :type :string
  :properties nil
  :enum '("InvalidType" "FencedFrameDisallowed" "CspFrameAncestorsMissing" "PermissionsPolicyBlocked" "PaddingRightUnsupported" "PaddingBottomUnsupported" "InsetBoxShadowUnsupported" "RequestInProgress" "UntrustedEvent" "RegistrationFailed" "TypeNotSupported" "InvalidTypeActivation" "SecurityChecksFailed" "ActivationDisabled" "GeolocationDeprecated" "InvalidDisplayStyle" "NonOpaqueColor" "LowContrast" "FontSizeTooSmall" "FontSizeTooLarge" "InvalidSizeValue")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type permission-element-issue-details
  :cdp-id "PermissionElementIssueDetails" :type :object
  :properties (
        (:name :issue-type :type :ref :ref "PermissionElementIssueType" :items nil :optional nil :doc "")
        (:name :type :type :string :ref nil :items nil :optional t :doc "The value of the type attribute.")
        (:name :node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "The node ID of the <permission> element.")
        (:name :is-warning :type :boolean :ref nil :items nil :optional t :doc "True if the issue is a warning, false if it is an error.")
        (:name :permission-name :type :string :ref nil :items nil :optional t :doc "Fields for message construction: Used for messages that reference a specific permission name")
        (:name :occluder-node-info :type :string :ref nil :items nil :optional t :doc "Used for messages about occlusion")
        (:name :occluder-parent-node-info :type :string :ref nil :items nil :optional t :doc "Used for messages about occluder's parent")
        (:name :disable-reason :type :string :ref nil :items nil :optional t :doc "Used for messages about activation disabled reason"))
  :enum nil
  :doc "This issue warns about improper usage of the <permission> element." :experimental nil :deprecated nil)

(define-domain-type ad-script-identifier
  :cdp-id "AdScriptIdentifier" :type :object
  :properties (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "The script's v8 identifier.")
        (:name :debugger-id :type :ref :ref "Runtime.UniqueDebuggerId" :items nil :optional nil :doc "v8's debugging id for the v8::Context.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "The script's url (or generated name based on id if inline script)."))
  :enum nil
  :doc "Metadata about the ad script that was on the stack that caused the current script in the `AdAncestry` to be considered ad related." :experimental nil :deprecated nil)

(define-domain-type ad-ancestry
  :cdp-id "AdAncestry" :type :object
  :properties (
        (:name :ad-ancestry-chain :type :array :ref nil :items (:type :ref :ref "AdScriptIdentifier") :optional nil :doc "The ad-script in the stack when the offending script was loaded. This is recursive down to the root script that was tagged due to the filterlist rule.")
        (:name :root-script-filterlist-rule :type :string :ref nil :items nil :optional t :doc "The filterlist rule that caused the root (last) script in `adAncestry` to be ad-tagged."))
  :enum nil
  :doc "Providence about how an ad script was determined to be such. It is an ad because its url matched a filterlist rule, or because some other ad script was on the stack when this script was loaded." :experimental nil :deprecated nil)

(define-domain-type selective-permissions-intervention-issue-details
  :cdp-id "SelectivePermissionsInterventionIssueDetails" :type :object
  :properties (
        (:name :api-name :type :string :ref nil :items nil :optional nil :doc "Which API was intervened on.")
        (:name :ad-ancestry :type :ref :ref "AdAncestry" :items nil :optional nil :doc "Why the ad script using the API is considered an ad.")
        (:name :stack-trace :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "The stack trace at the time of the intervention."))
  :enum nil
  :doc "The issue warns about blocked calls to privacy sensitive APIs via the Selective Permissions Intervention." :experimental nil :deprecated nil)

(define-domain-type inspector-issue-code
  :cdp-id "InspectorIssueCode" :type :string
  :properties nil
  :enum '("CookieIssue" "MixedContentIssue" "BlockedByResponseIssue" "HeavyAdIssue" "ContentSecurityPolicyIssue" "SharedArrayBufferIssue" "LowTextContrastIssue" "CorsIssue" "AttributionReportingIssue" "QuirksModeIssue" "PartitioningBlobURLIssue" "NavigatorUserAgentIssue" "GenericIssue" "DeprecationIssue" "ClientHintIssue" "FederatedAuthRequestIssue" "BounceTrackingIssue" "CookieDeprecationMetadataIssue" "StylesheetLoadingIssue" "FederatedAuthUserInfoRequestIssue" "PropertyRuleIssue" "SharedDictionaryIssue" "ElementAccessibilityIssue" "SRIMessageSignatureIssue" "UnencodedDigestIssue" "ConnectionAllowlistIssue" "UserReidentificationIssue" "PermissionElementIssue" "PerformanceIssue" "SelectivePermissionsInterventionIssue")
  :doc "A unique identifier for the type of issue. Each type may use one of the optional fields in InspectorIssueDetails to convey more specific information about the kind of issue." :experimental nil :deprecated nil)

(define-domain-type inspector-issue-details
  :cdp-id "InspectorIssueDetails" :type :object
  :properties (
        (:name :cookie-issue-details :type :ref :ref "CookieIssueDetails" :items nil :optional t :doc "")
        (:name :mixed-content-issue-details :type :ref :ref "MixedContentIssueDetails" :items nil :optional t :doc "")
        (:name :blocked-by-response-issue-details :type :ref :ref "BlockedByResponseIssueDetails" :items nil :optional t :doc "")
        (:name :heavy-ad-issue-details :type :ref :ref "HeavyAdIssueDetails" :items nil :optional t :doc "")
        (:name :content-security-policy-issue-details :type :ref :ref "ContentSecurityPolicyIssueDetails" :items nil :optional t :doc "")
        (:name :shared-array-buffer-issue-details :type :ref :ref "SharedArrayBufferIssueDetails" :items nil :optional t :doc "")
        (:name :low-text-contrast-issue-details :type :ref :ref "LowTextContrastIssueDetails" :items nil :optional t :doc "")
        (:name :cors-issue-details :type :ref :ref "CorsIssueDetails" :items nil :optional t :doc "")
        (:name :attribution-reporting-issue-details :type :ref :ref "AttributionReportingIssueDetails" :items nil :optional t :doc "")
        (:name :quirks-mode-issue-details :type :ref :ref "QuirksModeIssueDetails" :items nil :optional t :doc "")
        (:name :partitioning-blob-url-issue-details :type :ref :ref "PartitioningBlobURLIssueDetails" :items nil :optional t :doc "")
        (:name :navigator-user-agent-issue-details :type :ref :ref "NavigatorUserAgentIssueDetails" :items nil :optional t :doc "")
        (:name :generic-issue-details :type :ref :ref "GenericIssueDetails" :items nil :optional t :doc "")
        (:name :deprecation-issue-details :type :ref :ref "DeprecationIssueDetails" :items nil :optional t :doc "")
        (:name :client-hint-issue-details :type :ref :ref "ClientHintIssueDetails" :items nil :optional t :doc "")
        (:name :federated-auth-request-issue-details :type :ref :ref "FederatedAuthRequestIssueDetails" :items nil :optional t :doc "")
        (:name :bounce-tracking-issue-details :type :ref :ref "BounceTrackingIssueDetails" :items nil :optional t :doc "")
        (:name :cookie-deprecation-metadata-issue-details :type :ref :ref "CookieDeprecationMetadataIssueDetails" :items nil :optional t :doc "")
        (:name :stylesheet-loading-issue-details :type :ref :ref "StylesheetLoadingIssueDetails" :items nil :optional t :doc "")
        (:name :property-rule-issue-details :type :ref :ref "PropertyRuleIssueDetails" :items nil :optional t :doc "")
        (:name :federated-auth-user-info-request-issue-details :type :ref :ref "FederatedAuthUserInfoRequestIssueDetails" :items nil :optional t :doc "")
        (:name :shared-dictionary-issue-details :type :ref :ref "SharedDictionaryIssueDetails" :items nil :optional t :doc "")
        (:name :element-accessibility-issue-details :type :ref :ref "ElementAccessibilityIssueDetails" :items nil :optional t :doc "")
        (:name :sri-message-signature-issue-details :type :ref :ref "SRIMessageSignatureIssueDetails" :items nil :optional t :doc "")
        (:name :unencoded-digest-issue-details :type :ref :ref "UnencodedDigestIssueDetails" :items nil :optional t :doc "")
        (:name :connection-allowlist-issue-details :type :ref :ref "ConnectionAllowlistIssueDetails" :items nil :optional t :doc "")
        (:name :user-reidentification-issue-details :type :ref :ref "UserReidentificationIssueDetails" :items nil :optional t :doc "")
        (:name :permission-element-issue-details :type :ref :ref "PermissionElementIssueDetails" :items nil :optional t :doc "")
        (:name :performance-issue-details :type :ref :ref "PerformanceIssueDetails" :items nil :optional t :doc "")
        (:name :selective-permissions-intervention-issue-details :type :ref :ref "SelectivePermissionsInterventionIssueDetails" :items nil :optional t :doc ""))
  :enum nil
  :doc "This struct holds a list of optional fields with additional information specific to the kind of issue. When adding a new issue code, please also add a new optional field to this type." :experimental nil :deprecated nil)

(define-domain-type issue-id
  :cdp-id "IssueId" :type :string
  :properties nil
  :enum nil
  :doc "A unique id for a DevTools inspector issue. Allows other entities (e.g. exceptions, CDP message, console messages, etc.) to reference an issue." :experimental nil :deprecated nil)

(define-domain-type inspector-issue
  :cdp-id "InspectorIssue" :type :object
  :properties (
        (:name :code :type :ref :ref "InspectorIssueCode" :items nil :optional nil :doc "")
        (:name :details :type :ref :ref "InspectorIssueDetails" :items nil :optional nil :doc "")
        (:name :issue-id :type :ref :ref "IssueId" :items nil :optional t :doc "A unique id for this issue. May be omitted if no other entity (e.g. exception, CDP message, etc.) is referencing this issue."))
  :enum nil
  :doc "An inspector issue reported from the back-end." :experimental nil :deprecated nil)

(define-domain-command get-encoded-response
  :method "Audits.getEncodedResponse"
  :params (
        (:name :request-id :type :ref :ref "Network.RequestId" :items nil :optional nil :doc "Identifier of the network request to get content for.")
        (:name :encoding :type :string :ref nil :items nil :optional nil :doc "The encoding to use.")
        (:name :quality :type :number :ref nil :items nil :optional t :doc "The quality of the encoding (0-1). (defaults to 1)")
        (:name :size-only :type :boolean :ref nil :items nil :optional t :doc "Whether to only return the size information (defaults to false)."))
  :returns (
        (:name :body :type :string :ref nil :items nil :optional t :doc "The encoded body as a base64 string. Omitted if sizeOnly is true. (Encoded as a base64 string when passed over JSON)")
        (:name :original-size :type :integer :ref nil :items nil :optional nil :doc "Size before re-encoding.")
        (:name :encoded-size :type :integer :ref nil :items nil :optional nil :doc "Size after re-encoding."))
  :doc "Returns the response body and size if it were re-encoded with the specified settings. Only applies to images." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Audits.disable"
  :params nil
  :returns nil
  :doc "Disables issues domain, prevents further issues from being reported to the client." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Audits.enable"
  :params nil
  :returns nil
  :doc "Enables issues domain, sends the issues collected so far to the client by means of the `issueAdded` event." :experimental nil :deprecated nil)

(define-domain-command check-contrast
  :method "Audits.checkContrast"
  :params (
        (:name :report-aaa :type :boolean :ref nil :items nil :optional t :doc "Whether to report WCAG AAA level issues. Default is false."))
  :returns nil
  :doc "Runs the contrast check for the target page. Found issues are reported using Audits.issueAdded event." :experimental nil :deprecated nil)

(define-domain-command check-forms-issues
  :method "Audits.checkFormsIssues"
  :params nil
  :returns (
        (:name :form-issues :type :array :ref nil :items (:type :ref :ref "GenericIssueDetails") :optional nil :doc ""))
  :doc "Runs the form issues check for the target page. Found issues are reported using Audits.issueAdded event." :experimental nil :deprecated nil)

(define-domain-event issue-added
  :method "Audits.issueAdded"
  :params (
        (:name :issue :type :ref :ref "InspectorIssue" :items nil :optional nil :doc ""))
  :doc "" :experimental nil :deprecated nil)

