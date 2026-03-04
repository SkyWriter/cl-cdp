;;;; Network CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/network
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

(in-package #:cdp/network)

(define-domain-type resource-type
  :cdp-id "ResourceType" :type :string
  :properties nil
  :enum '("Document" "Stylesheet" "Image" "Media" "Font" "Script" "TextTrack" "XHR" "Fetch" "Prefetch" "EventSource" "WebSocket" "Manifest" "SignedExchange" "Ping" "CSPViolationReport" "Preflight" "FedCM" "Other")
  :doc "Resource type as it was perceived by the rendering engine." :experimental nil :deprecated nil)

(define-domain-type loader-id
  :cdp-id "LoaderId" :type :string
  :properties nil
  :enum nil
  :doc "Unique loader identifier." :experimental nil :deprecated nil)

(define-domain-type request-id
  :cdp-id "RequestId" :type :string
  :properties nil
  :enum nil
  :doc "Unique network request identifier. Note that this does not identify individual HTTP requests that are part of a network request." :experimental nil :deprecated nil)

(define-domain-type interception-id
  :cdp-id "InterceptionId" :type :string
  :properties nil
  :enum nil
  :doc "Unique intercepted request identifier." :experimental nil :deprecated nil)

(define-domain-type error-reason
  :cdp-id "ErrorReason" :type :string
  :properties nil
  :enum '("Failed" "Aborted" "TimedOut" "AccessDenied" "ConnectionClosed" "ConnectionReset" "ConnectionRefused" "ConnectionAborted" "ConnectionFailed" "NameNotResolved" "InternetDisconnected" "AddressUnreachable" "BlockedByClient" "BlockedByResponse")
  :doc "Network level fetch failure reason." :experimental nil :deprecated nil)

(define-domain-type time-since-epoch
  :cdp-id "TimeSinceEpoch" :type :number
  :properties nil
  :enum nil
  :doc "UTC time in seconds, counted from January 1, 1970." :experimental nil :deprecated nil)

(define-domain-type monotonic-time
  :cdp-id "MonotonicTime" :type :number
  :properties nil
  :enum nil
  :doc "Monotonically increasing time in seconds since an arbitrary point in the past." :experimental nil :deprecated nil)

(define-domain-type headers
  :cdp-id "Headers" :type :object
  :properties nil
  :enum nil
  :doc "Request / response headers as keys / values of JSON object." :experimental nil :deprecated nil)

(define-domain-type connection-type
  :cdp-id "ConnectionType" :type :string
  :properties nil
  :enum '("none" "cellular2g" "cellular3g" "cellular4g" "bluetooth" "ethernet" "wifi" "wimax" "other")
  :doc "The underlying connection technology that the browser is supposedly using." :experimental nil :deprecated nil)

(define-domain-type cookie-same-site
  :cdp-id "CookieSameSite" :type :string
  :properties nil
  :enum '("Strict" "Lax" "None")
  :doc "Represents the cookie's 'SameSite' status: https://tools.ietf.org/html/draft-west-first-party-cookies" :experimental nil :deprecated nil)

(define-domain-type cookie-priority
  :cdp-id "CookiePriority" :type :string
  :properties nil
  :enum '("Low" "Medium" "High")
  :doc "Represents the cookie's 'Priority' status: https://tools.ietf.org/html/draft-west-cookie-priority-00" :experimental t :deprecated nil)

(define-domain-type cookie-source-scheme
  :cdp-id "CookieSourceScheme" :type :string
  :properties nil
  :enum '("Unset" "NonSecure" "Secure")
  :doc "Represents the source scheme of the origin that originally set the cookie. A value of \"Unset\" allows protocol clients to emulate legacy cookie scope for the scheme. This is a temporary ability and it will be removed in the future." :experimental t :deprecated nil)

(define-domain-type resource-timing
  :cdp-id "ResourceTiming" :type :object
  :properties (
        (:name :request-time :type :number :ref nil :items nil :optional nil :doc "Timing's requestTime is a baseline in seconds, while the other numbers are ticks in milliseconds relatively to this requestTime.")
        (:name :proxy-start :type :number :ref nil :items nil :optional nil :doc "Started resolving proxy.")
        (:name :proxy-end :type :number :ref nil :items nil :optional nil :doc "Finished resolving proxy.")
        (:name :dns-start :type :number :ref nil :items nil :optional nil :doc "Started DNS address resolve.")
        (:name :dns-end :type :number :ref nil :items nil :optional nil :doc "Finished DNS address resolve.")
        (:name :connect-start :type :number :ref nil :items nil :optional nil :doc "Started connecting to the remote host.")
        (:name :connect-end :type :number :ref nil :items nil :optional nil :doc "Connected to the remote host.")
        (:name :ssl-start :type :number :ref nil :items nil :optional nil :doc "Started SSL handshake.")
        (:name :ssl-end :type :number :ref nil :items nil :optional nil :doc "Finished SSL handshake.")
        (:name :worker-start :type :number :ref nil :items nil :optional nil :doc "Started running ServiceWorker.")
        (:name :worker-ready :type :number :ref nil :items nil :optional nil :doc "Finished Starting ServiceWorker.")
        (:name :worker-fetch-start :type :number :ref nil :items nil :optional nil :doc "Started fetch event.")
        (:name :worker-respond-with-settled :type :number :ref nil :items nil :optional nil :doc "Settled fetch event respondWith promise.")
        (:name :worker-router-evaluation-start :type :number :ref nil :items nil :optional t :doc "Started ServiceWorker static routing source evaluation.")
        (:name :worker-cache-lookup-start :type :number :ref nil :items nil :optional t :doc "Started cache lookup when the source was evaluated to `cache`.")
        (:name :send-start :type :number :ref nil :items nil :optional nil :doc "Started sending request.")
        (:name :send-end :type :number :ref nil :items nil :optional nil :doc "Finished sending request.")
        (:name :push-start :type :number :ref nil :items nil :optional nil :doc "Time the server started pushing request.")
        (:name :push-end :type :number :ref nil :items nil :optional nil :doc "Time the server finished pushing request.")
        (:name :receive-headers-start :type :number :ref nil :items nil :optional nil :doc "Started receiving response headers.")
        (:name :receive-headers-end :type :number :ref nil :items nil :optional nil :doc "Finished receiving response headers."))
  :enum nil
  :doc "Timing information for the request." :experimental nil :deprecated nil)

(define-domain-type resource-priority
  :cdp-id "ResourcePriority" :type :string
  :properties nil
  :enum '("VeryLow" "Low" "Medium" "High" "VeryHigh")
  :doc "Loading priority of a resource request." :experimental nil :deprecated nil)

(define-domain-type render-blocking-behavior
  :cdp-id "RenderBlockingBehavior" :type :string
  :properties nil
  :enum '("Blocking" "InBodyParserBlocking" "NonBlocking" "NonBlockingDynamic" "PotentiallyBlocking")
  :doc "The render-blocking behavior of a resource request." :experimental t :deprecated nil)

(define-domain-type post-data-entry
  :cdp-id "PostDataEntry" :type :object
  :properties (
        (:name :bytes :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "Post data entry for HTTP request" :experimental nil :deprecated nil)

(define-domain-type request
  :cdp-id "Request" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Request URL (without fragment).")
        (:name :url-fragment :type :string :ref nil :items nil :optional t :doc "Fragment of the requested URL starting with hash, if present.")
        (:name :method :type :string :ref nil :items nil :optional nil :doc "HTTP request method.")
        (:name :headers :type :ref :ref "Headers" :items nil :optional nil :doc "HTTP request headers.")
        (:name :post-data :type :string :ref nil :items nil :optional t :doc "HTTP POST request data. Use postDataEntries instead.")
        (:name :has-post-data :type :boolean :ref nil :items nil :optional t :doc "True when the request has POST data. Note that postData might still be omitted when this flag is true when the data is too long.")
        (:name :post-data-entries :type :array :ref nil :items (:type :ref :ref "PostDataEntry") :optional t :doc "Request body elements (post data broken into individual entries).")
        (:name :mixed-content-type :type :ref :ref "Security.MixedContentType" :items nil :optional t :doc "The mixed content type of the request.")
        (:name :initial-priority :type :ref :ref "ResourcePriority" :items nil :optional nil :doc "Priority of the resource request at the time request is sent.")
        (:name :referrer-policy :type :string :ref nil :items nil :optional nil :doc "The referrer policy of the request, as defined in https://www.w3.org/TR/referrer-policy/")
        (:name :is-link-preload :type :boolean :ref nil :items nil :optional t :doc "Whether is loaded via link preload.")
        (:name :trust-token-params :type :ref :ref "TrustTokenParams" :items nil :optional t :doc "Set for requests when the TrustToken API is used. Contains the parameters passed by the developer (e.g. via \"fetch\") as understood by the backend.")
        (:name :is-same-site :type :boolean :ref nil :items nil :optional t :doc "True if this resource request is considered to be the 'same site' as the request corresponding to the main frame.")
        (:name :is-ad-related :type :boolean :ref nil :items nil :optional t :doc "True when the resource request is ad-related."))
  :enum nil
  :doc "HTTP request data." :experimental nil :deprecated nil)

(define-domain-type signed-certificate-timestamp
  :cdp-id "SignedCertificateTimestamp" :type :object
  :properties (
        (:name :status :type :string :ref nil :items nil :optional nil :doc "Validation status.")
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin.")
        (:name :log-description :type :string :ref nil :items nil :optional nil :doc "Log name / description.")
        (:name :log-id :type :string :ref nil :items nil :optional nil :doc "Log ID.")
        (:name :timestamp :type :number :ref nil :items nil :optional nil :doc "Issuance date. Unlike TimeSinceEpoch, this contains the number of milliseconds since January 1, 1970, UTC, not the number of seconds.")
        (:name :hash-algorithm :type :string :ref nil :items nil :optional nil :doc "Hash algorithm.")
        (:name :signature-algorithm :type :string :ref nil :items nil :optional nil :doc "Signature algorithm.")
        (:name :signature-data :type :string :ref nil :items nil :optional nil :doc "Signature data."))
  :enum nil
  :doc "Details of a signed certificate timestamp (SCT)." :experimental nil :deprecated nil)

(define-domain-type security-details
  :cdp-id "SecurityDetails" :type :object
  :properties (
        (:name :protocol :type :string :ref nil :items nil :optional nil :doc "Protocol name (e.g. \"TLS 1.2\" or \"QUIC\").")
        (:name :key-exchange :type :string :ref nil :items nil :optional nil :doc "Key Exchange used by the connection, or the empty string if not applicable.")
        (:name :key-exchange-group :type :string :ref nil :items nil :optional t :doc "(EC)DH group used by the connection, if applicable.")
        (:name :cipher :type :string :ref nil :items nil :optional nil :doc "Cipher name.")
        (:name :mac :type :string :ref nil :items nil :optional t :doc "TLS MAC. Note that AEAD ciphers do not have separate MACs.")
        (:name :certificate-id :type :ref :ref "Security.CertificateId" :items nil :optional nil :doc "Certificate ID value.")
        (:name :subject-name :type :string :ref nil :items nil :optional nil :doc "Certificate subject name.")
        (:name :san-list :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Subject Alternative Name (SAN) DNS names and IP addresses.")
        (:name :issuer :type :string :ref nil :items nil :optional nil :doc "Name of the issuing CA.")
        (:name :valid-from :type :ref :ref "TimeSinceEpoch" :items nil :optional nil :doc "Certificate valid from date.")
        (:name :valid-to :type :ref :ref "TimeSinceEpoch" :items nil :optional nil :doc "Certificate valid to (expiration) date")
        (:name :signed-certificate-timestamp-list :type :array :ref nil :items (:type :ref :ref "SignedCertificateTimestamp") :optional nil :doc "List of signed certificate timestamps (SCTs).")
        (:name :certificate-transparency-compliance :type :ref :ref "CertificateTransparencyCompliance" :items nil :optional nil :doc "Whether the request complied with Certificate Transparency policy")
        (:name :server-signature-algorithm :type :integer :ref nil :items nil :optional t :doc "The signature algorithm used by the server in the TLS server signature, represented as a TLS SignatureScheme code point. Omitted if not applicable or not known.")
        (:name :encrypted-client-hello :type :boolean :ref nil :items nil :optional nil :doc "Whether the connection used Encrypted ClientHello"))
  :enum nil
  :doc "Security details about a request." :experimental nil :deprecated nil)

(define-domain-type certificate-transparency-compliance
  :cdp-id "CertificateTransparencyCompliance" :type :string
  :properties nil
  :enum '("unknown" "not-compliant" "compliant")
  :doc "Whether the request complied with Certificate Transparency policy." :experimental nil :deprecated nil)

(define-domain-type blocked-reason
  :cdp-id "BlockedReason" :type :string
  :properties nil
  :enum '("other" "csp" "mixed-content" "origin" "inspector" "integrity" "subresource-filter" "content-type" "coep-frame-resource-needs-coep-header" "coop-sandboxed-iframe-cannot-navigate-to-coop-page" "corp-not-same-origin" "corp-not-same-origin-after-defaulted-to-same-origin-by-coep" "corp-not-same-origin-after-defaulted-to-same-origin-by-dip" "corp-not-same-origin-after-defaulted-to-same-origin-by-coep-and-dip" "corp-not-same-site" "sri-message-signature-mismatch")
  :doc "The reason why request was blocked." :experimental nil :deprecated nil)

(define-domain-type cors-error
  :cdp-id "CorsError" :type :string
  :properties nil
  :enum '("DisallowedByMode" "InvalidResponse" "WildcardOriginNotAllowed" "MissingAllowOriginHeader" "MultipleAllowOriginValues" "InvalidAllowOriginValue" "AllowOriginMismatch" "InvalidAllowCredentials" "CorsDisabledScheme" "PreflightInvalidStatus" "PreflightDisallowedRedirect" "PreflightWildcardOriginNotAllowed" "PreflightMissingAllowOriginHeader" "PreflightMultipleAllowOriginValues" "PreflightInvalidAllowOriginValue" "PreflightAllowOriginMismatch" "PreflightInvalidAllowCredentials" "PreflightMissingAllowExternal" "PreflightInvalidAllowExternal" "InvalidAllowMethodsPreflightResponse" "InvalidAllowHeadersPreflightResponse" "MethodDisallowedByPreflightResponse" "HeaderDisallowedByPreflightResponse" "RedirectContainsCredentials" "InsecureLocalNetwork" "InvalidLocalNetworkAccess" "NoCorsRedirectModeNotFollow" "LocalNetworkAccessPermissionDenied")
  :doc "The reason why request was blocked." :experimental nil :deprecated nil)

(define-domain-type cors-error-status
  :cdp-id "CorsErrorStatus" :type :object
  :properties (
        (:name :cors-error :type :ref :ref "CorsError" :items nil :optional nil :doc "")
        (:name :failed-parameter :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type service-worker-response-source
  :cdp-id "ServiceWorkerResponseSource" :type :string
  :properties nil
  :enum '("cache-storage" "http-cache" "fallback-code" "network")
  :doc "Source of serviceworker response." :experimental nil :deprecated nil)

(define-domain-type trust-token-params
  :cdp-id "TrustTokenParams" :type :object
  :properties (
        (:name :operation :type :ref :ref "TrustTokenOperationType" :items nil :optional nil :doc "")
        (:name :refresh-policy :type :string :ref nil :items nil :optional nil :doc "Only set for \"token-redemption\" operation and determine whether to request a fresh SRR or use a still valid cached SRR.")
        (:name :issuers :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Origins of issuers from whom to request tokens or redemption records."))
  :enum nil
  :doc "Determines what type of Trust Token operation is executed and depending on the type, some additional parameters. The values are specified in third_party/blink/renderer/core/fetch/trust_token.idl." :experimental t :deprecated nil)

(define-domain-type trust-token-operation-type
  :cdp-id "TrustTokenOperationType" :type :string
  :properties nil
  :enum '("Issuance" "Redemption" "Signing")
  :doc "" :experimental t :deprecated nil)

(define-domain-type alternate-protocol-usage
  :cdp-id "AlternateProtocolUsage" :type :string
  :properties nil
  :enum '("alternativeJobWonWithoutRace" "alternativeJobWonRace" "mainJobWonRace" "mappingMissing" "broken" "dnsAlpnH3JobWonWithoutRace" "dnsAlpnH3JobWonRace" "unspecifiedReason")
  :doc "The reason why Chrome uses a specific transport protocol for HTTP semantics." :experimental t :deprecated nil)

(define-domain-type service-worker-router-source
  :cdp-id "ServiceWorkerRouterSource" :type :string
  :properties nil
  :enum '("network" "cache" "fetch-event" "race-network-and-fetch-handler" "race-network-and-cache")
  :doc "Source of service worker router." :experimental nil :deprecated nil)

(define-domain-type service-worker-router-info
  :cdp-id "ServiceWorkerRouterInfo" :type :object
  :properties (
        (:name :rule-id-matched :type :integer :ref nil :items nil :optional t :doc "ID of the rule matched. If there is a matched rule, this field will be set, otherwiser no value will be set.")
        (:name :matched-source-type :type :ref :ref "ServiceWorkerRouterSource" :items nil :optional t :doc "The router source of the matched rule. If there is a matched rule, this field will be set, otherwise no value will be set.")
        (:name :actual-source-type :type :ref :ref "ServiceWorkerRouterSource" :items nil :optional t :doc "The actual router source used."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type response
  :cdp-id "Response" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Response URL. This URL can be different from CachedResource.url in case of redirect.")
        (:name :status :type :integer :ref nil :items nil :optional nil :doc "HTTP response status code.")
        (:name :status-text :type :string :ref nil :items nil :optional nil :doc "HTTP response status text.")
        (:name :headers :type :ref :ref "Headers" :items nil :optional nil :doc "HTTP response headers.")
        (:name :headers-text :type :string :ref nil :items nil :optional t :doc "HTTP response headers text. This has been replaced by the headers in Network.responseReceivedExtraInfo.")
        (:name :mime-type :type :string :ref nil :items nil :optional nil :doc "Resource mimeType as determined by the browser.")
        (:name :charset :type :string :ref nil :items nil :optional nil :doc "Resource charset as determined by the browser (if applicable).")
        (:name :request-headers :type :ref :ref "Headers" :items nil :optional t :doc "Refined HTTP request headers that were actually transmitted over the network.")
        (:name :request-headers-text :type :string :ref nil :items nil :optional t :doc "HTTP request headers text. This has been replaced by the headers in Network.requestWillBeSentExtraInfo.")
        (:name :connection-reused :type :boolean :ref nil :items nil :optional nil :doc "Specifies whether physical connection was actually reused for this request.")
        (:name :connection-id :type :number :ref nil :items nil :optional nil :doc "Physical connection id that was actually used for this request.")
        (:name :remote-ip-address :type :string :ref nil :items nil :optional t :doc "Remote IP address.")
        (:name :remote-port :type :integer :ref nil :items nil :optional t :doc "Remote port.")
        (:name :from-disk-cache :type :boolean :ref nil :items nil :optional t :doc "Specifies that the request was served from the disk cache.")
        (:name :from-service-worker :type :boolean :ref nil :items nil :optional t :doc "Specifies that the request was served from the ServiceWorker.")
        (:name :from-prefetch-cache :type :boolean :ref nil :items nil :optional t :doc "Specifies that the request was served from the prefetch cache.")
        (:name :from-early-hints :type :boolean :ref nil :items nil :optional t :doc "Specifies that the request was served from the prefetch cache.")
        (:name :service-worker-router-info :type :ref :ref "ServiceWorkerRouterInfo" :items nil :optional t :doc "Information about how ServiceWorker Static Router API was used. If this field is set with `matchedSourceType` field, a matching rule is found. If this field is set without `matchedSource`, no matching rule is found. Otherwise, the API is not used.")
        (:name :encoded-data-length :type :number :ref nil :items nil :optional nil :doc "Total number of bytes received for this request so far.")
        (:name :timing :type :ref :ref "ResourceTiming" :items nil :optional t :doc "Timing information for the given request.")
        (:name :service-worker-response-source :type :ref :ref "ServiceWorkerResponseSource" :items nil :optional t :doc "Response source of response from ServiceWorker.")
        (:name :response-time :type :ref :ref "TimeSinceEpoch" :items nil :optional t :doc "The time at which the returned response was generated.")
        (:name :cache-storage-cache-name :type :string :ref nil :items nil :optional t :doc "Cache Storage Cache Name.")
        (:name :protocol :type :string :ref nil :items nil :optional t :doc "Protocol used to fetch this request.")
        (:name :alternate-protocol-usage :type :ref :ref "AlternateProtocolUsage" :items nil :optional t :doc "The reason why Chrome uses a specific transport protocol for HTTP semantics.")
        (:name :security-state :type :ref :ref "Security.SecurityState" :items nil :optional nil :doc "Security state of the request resource.")
        (:name :security-details :type :ref :ref "SecurityDetails" :items nil :optional t :doc "Security details for the request."))
  :enum nil
  :doc "HTTP response data." :experimental nil :deprecated nil)

(define-domain-type web-socket-request
  :cdp-id "WebSocketRequest" :type :object
  :properties (
        (:name :headers :type :ref :ref "Headers" :items nil :optional nil :doc "HTTP request headers."))
  :enum nil
  :doc "WebSocket request data." :experimental nil :deprecated nil)

(define-domain-type web-socket-response
  :cdp-id "WebSocketResponse" :type :object
  :properties (
        (:name :status :type :integer :ref nil :items nil :optional nil :doc "HTTP response status code.")
        (:name :status-text :type :string :ref nil :items nil :optional nil :doc "HTTP response status text.")
        (:name :headers :type :ref :ref "Headers" :items nil :optional nil :doc "HTTP response headers.")
        (:name :headers-text :type :string :ref nil :items nil :optional t :doc "HTTP response headers text.")
        (:name :request-headers :type :ref :ref "Headers" :items nil :optional t :doc "HTTP request headers.")
        (:name :request-headers-text :type :string :ref nil :items nil :optional t :doc "HTTP request headers text."))
  :enum nil
  :doc "WebSocket response data." :experimental nil :deprecated nil)

(define-domain-type web-socket-frame
  :cdp-id "WebSocketFrame" :type :object
  :properties (
        (:name :opcode :type :number :ref nil :items nil :optional nil :doc "WebSocket message opcode.")
        (:name :mask :type :boolean :ref nil :items nil :optional nil :doc "WebSocket message mask.")
        (:name :payload-data :type :string :ref nil :items nil :optional nil :doc "WebSocket message payload data. If the opcode is 1, this is a text message and payloadData is a UTF-8 string. If the opcode isn't 1, then payloadData is a base64 encoded string representing binary data."))
  :enum nil
  :doc "WebSocket message data. This represents an entire WebSocket message, not just a fragmented frame as the name suggests." :experimental nil :deprecated nil)

(define-domain-type cached-resource
  :cdp-id "CachedResource" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Resource URL. This is the url of the original network request.")
        (:name :type :type :ref :ref "ResourceType" :items nil :optional nil :doc "Type of this resource.")
        (:name :response :type :ref :ref "Response" :items nil :optional t :doc "Cached response data.")
        (:name :body-size :type :number :ref nil :items nil :optional nil :doc "Cached response body size."))
  :enum nil
  :doc "Information about the cached resource." :experimental nil :deprecated nil)

(define-domain-type initiator
  :cdp-id "Initiator" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of this initiator.")
        (:name :stack :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "Initiator JavaScript stack trace, set for Script only. Requires the Debugger domain to be enabled.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "Initiator URL, set for Parser type or for Script type (when script is importing module) or for SignedExchange type.")
        (:name :line-number :type :number :ref nil :items nil :optional t :doc "Initiator line number, set for Parser type or for Script type (when script is importing module) (0-based).")
        (:name :column-number :type :number :ref nil :items nil :optional t :doc "Initiator column number, set for Parser type or for Script type (when script is importing module) (0-based).")
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional t :doc "Set if another request triggered this request (e.g. preflight)."))
  :enum nil
  :doc "Information about the request initiator." :experimental nil :deprecated nil)

(define-domain-type cookie-partition-key
  :cdp-id "CookiePartitionKey" :type :object
  :properties (
        (:name :top-level-site :type :string :ref nil :items nil :optional nil :doc "The site of the top-level URL the browser was visiting at the start of the request to the endpoint that set the cookie.")
        (:name :has-cross-site-ancestor :type :boolean :ref nil :items nil :optional nil :doc "Indicates if the cookie has any ancestors that are cross-site to the topLevelSite."))
  :enum nil
  :doc "cookiePartitionKey object The representation of the components of the key that are created by the cookiePartitionKey class contained in net/cookies/cookie_partition_key.h." :experimental t :deprecated nil)

(define-domain-type cookie
  :cdp-id "Cookie" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Cookie name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Cookie value.")
        (:name :domain :type :string :ref nil :items nil :optional nil :doc "Cookie domain.")
        (:name :path :type :string :ref nil :items nil :optional nil :doc "Cookie path.")
        (:name :expires :type :number :ref nil :items nil :optional nil :doc "Cookie expiration date as the number of seconds since the UNIX epoch. The value is set to -1 if the expiry date is not set. The value can be null for values that cannot be represented in JSON (±Inf).")
        (:name :size :type :integer :ref nil :items nil :optional nil :doc "Cookie size.")
        (:name :http-only :type :boolean :ref nil :items nil :optional nil :doc "True if cookie is http-only.")
        (:name :secure :type :boolean :ref nil :items nil :optional nil :doc "True if cookie is secure.")
        (:name :session :type :boolean :ref nil :items nil :optional nil :doc "True in case of session cookie.")
        (:name :same-site :type :ref :ref "CookieSameSite" :items nil :optional t :doc "Cookie SameSite type.")
        (:name :priority :type :ref :ref "CookiePriority" :items nil :optional nil :doc "Cookie Priority")
        (:name :source-scheme :type :ref :ref "CookieSourceScheme" :items nil :optional nil :doc "Cookie source scheme type.")
        (:name :source-port :type :integer :ref nil :items nil :optional nil :doc "Cookie source port. Valid values are {-1, [1, 65535]}, -1 indicates an unspecified port. An unspecified port value allows protocol clients to emulate legacy cookie scope for the port. This is a temporary ability and it will be removed in the future.")
        (:name :partition-key :type :ref :ref "CookiePartitionKey" :items nil :optional t :doc "Cookie partition key.")
        (:name :partition-key-opaque :type :boolean :ref nil :items nil :optional t :doc "True if cookie partition key is opaque."))
  :enum nil
  :doc "Cookie object" :experimental nil :deprecated nil)

(define-domain-type set-cookie-blocked-reason
  :cdp-id "SetCookieBlockedReason" :type :string
  :properties nil
  :enum '("SecureOnly" "SameSiteStrict" "SameSiteLax" "SameSiteUnspecifiedTreatedAsLax" "SameSiteNoneInsecure" "UserPreferences" "ThirdPartyPhaseout" "ThirdPartyBlockedInFirstPartySet" "SyntaxError" "SchemeNotSupported" "OverwriteSecure" "InvalidDomain" "InvalidPrefix" "UnknownError" "SchemefulSameSiteStrict" "SchemefulSameSiteLax" "SchemefulSameSiteUnspecifiedTreatedAsLax" "NameValuePairExceedsMaxSize" "DisallowedCharacter" "NoCookieContent")
  :doc "Types of reasons why a cookie may not be stored from a response." :experimental t :deprecated nil)

(define-domain-type cookie-blocked-reason
  :cdp-id "CookieBlockedReason" :type :string
  :properties nil
  :enum '("SecureOnly" "NotOnPath" "DomainMismatch" "SameSiteStrict" "SameSiteLax" "SameSiteUnspecifiedTreatedAsLax" "SameSiteNoneInsecure" "UserPreferences" "ThirdPartyPhaseout" "ThirdPartyBlockedInFirstPartySet" "UnknownError" "SchemefulSameSiteStrict" "SchemefulSameSiteLax" "SchemefulSameSiteUnspecifiedTreatedAsLax" "NameValuePairExceedsMaxSize" "PortMismatch" "SchemeMismatch" "AnonymousContext")
  :doc "Types of reasons why a cookie may not be sent with a request." :experimental t :deprecated nil)

(define-domain-type cookie-exemption-reason
  :cdp-id "CookieExemptionReason" :type :string
  :properties nil
  :enum '("None" "UserSetting" "TPCDMetadata" "TPCDDeprecationTrial" "TopLevelTPCDDeprecationTrial" "TPCDHeuristics" "EnterprisePolicy" "StorageAccess" "TopLevelStorageAccess" "Scheme" "SameSiteNoneCookiesInSandbox")
  :doc "Types of reasons why a cookie should have been blocked by 3PCD but is exempted for the request." :experimental t :deprecated nil)

(define-domain-type blocked-set-cookie-with-reason
  :cdp-id "BlockedSetCookieWithReason" :type :object
  :properties (
        (:name :blocked-reasons :type :array :ref nil :items (:type :ref :ref "SetCookieBlockedReason") :optional nil :doc "The reason(s) this cookie was blocked.")
        (:name :cookie-line :type :string :ref nil :items nil :optional nil :doc "The string representing this individual cookie as it would appear in the header. This is not the entire \"cookie\" or \"set-cookie\" header which could have multiple cookies.")
        (:name :cookie :type :ref :ref "Cookie" :items nil :optional t :doc "The cookie object which represents the cookie which was not stored. It is optional because sometimes complete cookie information is not available, such as in the case of parsing errors."))
  :enum nil
  :doc "A cookie which was not stored from a response with the corresponding reason." :experimental t :deprecated nil)

(define-domain-type exempted-set-cookie-with-reason
  :cdp-id "ExemptedSetCookieWithReason" :type :object
  :properties (
        (:name :exemption-reason :type :ref :ref "CookieExemptionReason" :items nil :optional nil :doc "The reason the cookie was exempted.")
        (:name :cookie-line :type :string :ref nil :items nil :optional nil :doc "The string representing this individual cookie as it would appear in the header.")
        (:name :cookie :type :ref :ref "Cookie" :items nil :optional nil :doc "The cookie object representing the cookie."))
  :enum nil
  :doc "A cookie should have been blocked by 3PCD but is exempted and stored from a response with the corresponding reason. A cookie could only have at most one exemption reason." :experimental t :deprecated nil)

(define-domain-type associated-cookie
  :cdp-id "AssociatedCookie" :type :object
  :properties (
        (:name :cookie :type :ref :ref "Cookie" :items nil :optional nil :doc "The cookie object representing the cookie which was not sent.")
        (:name :blocked-reasons :type :array :ref nil :items (:type :ref :ref "CookieBlockedReason") :optional nil :doc "The reason(s) the cookie was blocked. If empty means the cookie is included.")
        (:name :exemption-reason :type :ref :ref "CookieExemptionReason" :items nil :optional t :doc "The reason the cookie should have been blocked by 3PCD but is exempted. A cookie could only have at most one exemption reason."))
  :enum nil
  :doc "A cookie associated with the request which may or may not be sent with it. Includes the cookies itself and reasons for blocking or exemption." :experimental t :deprecated nil)

(define-domain-type cookie-param
  :cdp-id "CookieParam" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Cookie name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Cookie value.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "The request-URI to associate with the setting of the cookie. This value can affect the default domain, path, source port, and source scheme values of the created cookie.")
        (:name :domain :type :string :ref nil :items nil :optional t :doc "Cookie domain.")
        (:name :path :type :string :ref nil :items nil :optional t :doc "Cookie path.")
        (:name :secure :type :boolean :ref nil :items nil :optional t :doc "True if cookie is secure.")
        (:name :http-only :type :boolean :ref nil :items nil :optional t :doc "True if cookie is http-only.")
        (:name :same-site :type :ref :ref "CookieSameSite" :items nil :optional t :doc "Cookie SameSite type.")
        (:name :expires :type :ref :ref "TimeSinceEpoch" :items nil :optional t :doc "Cookie expiration date, session cookie if not set")
        (:name :priority :type :ref :ref "CookiePriority" :items nil :optional t :doc "Cookie Priority.")
        (:name :source-scheme :type :ref :ref "CookieSourceScheme" :items nil :optional t :doc "Cookie source scheme type.")
        (:name :source-port :type :integer :ref nil :items nil :optional t :doc "Cookie source port. Valid values are {-1, [1, 65535]}, -1 indicates an unspecified port. An unspecified port value allows protocol clients to emulate legacy cookie scope for the port. This is a temporary ability and it will be removed in the future.")
        (:name :partition-key :type :ref :ref "CookiePartitionKey" :items nil :optional t :doc "Cookie partition key. If not set, the cookie will be set as not partitioned."))
  :enum nil
  :doc "Cookie parameter object" :experimental nil :deprecated nil)

(define-domain-type auth-challenge
  :cdp-id "AuthChallenge" :type :object
  :properties (
        (:name :source :type :string :ref nil :items nil :optional t :doc "Source of the authentication challenge.")
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin of the challenger.")
        (:name :scheme :type :string :ref nil :items nil :optional nil :doc "The authentication scheme used, such as basic or digest")
        (:name :realm :type :string :ref nil :items nil :optional nil :doc "The realm of the challenge. May be empty."))
  :enum nil
  :doc "Authorization challenge for HTTP status code 401 or 407." :experimental t :deprecated nil)

(define-domain-type auth-challenge-response
  :cdp-id "AuthChallengeResponse" :type :object
  :properties (
        (:name :response :type :string :ref nil :items nil :optional nil :doc "The decision on what to do in response to the authorization challenge.  Default means deferring to the default behavior of the net stack, which will likely either the Cancel authentication or display a popup dialog box.")
        (:name :username :type :string :ref nil :items nil :optional t :doc "The username to provide, possibly empty. Should only be set if response is ProvideCredentials.")
        (:name :password :type :string :ref nil :items nil :optional t :doc "The password to provide, possibly empty. Should only be set if response is ProvideCredentials."))
  :enum nil
  :doc "Response to an AuthChallenge." :experimental t :deprecated nil)

(define-domain-type interception-stage
  :cdp-id "InterceptionStage" :type :string
  :properties nil
  :enum '("Request" "HeadersReceived")
  :doc "Stages of the interception to begin intercepting. Request will intercept before the request is sent. Response will intercept after the response is received." :experimental t :deprecated nil)

(define-domain-type request-pattern
  :cdp-id "RequestPattern" :type :object
  :properties (
        (:name :url-pattern :type :string :ref nil :items nil :optional t :doc "Wildcards (`'*'` -> zero or more, `'?'` -> exactly one) are allowed. Escape character is backslash. Omitting is equivalent to `\"*\"`.")
        (:name :resource-type :type :ref :ref "ResourceType" :items nil :optional t :doc "If set, only requests for matching resource types will be intercepted.")
        (:name :interception-stage :type :ref :ref "InterceptionStage" :items nil :optional t :doc "Stage at which to begin intercepting requests. Default is Request."))
  :enum nil
  :doc "Request pattern for interception." :experimental t :deprecated nil)

(define-domain-type signed-exchange-signature
  :cdp-id "SignedExchangeSignature" :type :object
  :properties (
        (:name :label :type :string :ref nil :items nil :optional nil :doc "Signed exchange signature label.")
        (:name :signature :type :string :ref nil :items nil :optional nil :doc "The hex string of signed exchange signature.")
        (:name :integrity :type :string :ref nil :items nil :optional nil :doc "Signed exchange signature integrity.")
        (:name :cert-url :type :string :ref nil :items nil :optional t :doc "Signed exchange signature cert Url.")
        (:name :cert-sha256 :type :string :ref nil :items nil :optional t :doc "The hex string of signed exchange signature cert sha256.")
        (:name :validity-url :type :string :ref nil :items nil :optional nil :doc "Signed exchange signature validity Url.")
        (:name :date :type :integer :ref nil :items nil :optional nil :doc "Signed exchange signature date.")
        (:name :expires :type :integer :ref nil :items nil :optional nil :doc "Signed exchange signature expires.")
        (:name :certificates :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "The encoded certificates."))
  :enum nil
  :doc "Information about a signed exchange signature. https://wicg.github.io/webpackage/draft-yasskin-httpbis-origin-signed-exchanges-impl.html#rfc.section.3.1" :experimental t :deprecated nil)

(define-domain-type signed-exchange-header
  :cdp-id "SignedExchangeHeader" :type :object
  :properties (
        (:name :request-url :type :string :ref nil :items nil :optional nil :doc "Signed exchange request URL.")
        (:name :response-code :type :integer :ref nil :items nil :optional nil :doc "Signed exchange response code.")
        (:name :response-headers :type :ref :ref "Headers" :items nil :optional nil :doc "Signed exchange response headers.")
        (:name :signatures :type :array :ref nil :items (:type :ref :ref "SignedExchangeSignature") :optional nil :doc "Signed exchange response signature.")
        (:name :header-integrity :type :string :ref nil :items nil :optional nil :doc "Signed exchange header integrity hash in the form of `sha256-<base64-hash-value>`."))
  :enum nil
  :doc "Information about a signed exchange header. https://wicg.github.io/webpackage/draft-yasskin-httpbis-origin-signed-exchanges-impl.html#cbor-representation" :experimental t :deprecated nil)

(define-domain-type signed-exchange-error-field
  :cdp-id "SignedExchangeErrorField" :type :string
  :properties nil
  :enum '("signatureSig" "signatureIntegrity" "signatureCertUrl" "signatureCertSha256" "signatureValidityUrl" "signatureTimestamps")
  :doc "Field type for a signed exchange related error." :experimental t :deprecated nil)

(define-domain-type signed-exchange-error
  :cdp-id "SignedExchangeError" :type :object
  :properties (
        (:name :message :type :string :ref nil :items nil :optional nil :doc "Error message.")
        (:name :signature-index :type :integer :ref nil :items nil :optional t :doc "The index of the signature which caused the error.")
        (:name :error-field :type :ref :ref "SignedExchangeErrorField" :items nil :optional t :doc "The field which caused the error."))
  :enum nil
  :doc "Information about a signed exchange response." :experimental t :deprecated nil)

(define-domain-type signed-exchange-info
  :cdp-id "SignedExchangeInfo" :type :object
  :properties (
        (:name :outer-response :type :ref :ref "Response" :items nil :optional nil :doc "The outer response of signed HTTP exchange which was received from network.")
        (:name :has-extra-info :type :boolean :ref nil :items nil :optional nil :doc "Whether network response for the signed exchange was accompanied by extra headers.")
        (:name :header :type :ref :ref "SignedExchangeHeader" :items nil :optional t :doc "Information about the signed exchange header.")
        (:name :security-details :type :ref :ref "SecurityDetails" :items nil :optional t :doc "Security details for the signed exchange header.")
        (:name :errors :type :array :ref nil :items (:type :ref :ref "SignedExchangeError") :optional t :doc "Errors occurred while handling the signed exchange."))
  :enum nil
  :doc "Information about a signed exchange response." :experimental t :deprecated nil)

(define-domain-type content-encoding
  :cdp-id "ContentEncoding" :type :string
  :properties nil
  :enum '("deflate" "gzip" "br" "zstd")
  :doc "List of content encodings supported by the backend." :experimental t :deprecated nil)

(define-domain-type network-conditions
  :cdp-id "NetworkConditions" :type :object
  :properties (
        (:name :url-pattern :type :string :ref nil :items nil :optional nil :doc "Only matching requests will be affected by these conditions. Patterns use the URLPattern constructor string syntax (https://urlpattern.spec.whatwg.org/) and must be absolute. If the pattern is empty, all requests are matched (including p2p connections).")
        (:name :latency :type :number :ref nil :items nil :optional nil :doc "Minimum latency from request sent to response headers received (ms).")
        (:name :download-throughput :type :number :ref nil :items nil :optional nil :doc "Maximal aggregated download throughput (bytes/sec). -1 disables download throttling.")
        (:name :upload-throughput :type :number :ref nil :items nil :optional nil :doc "Maximal aggregated upload throughput (bytes/sec).  -1 disables upload throttling.")
        (:name :connection-type :type :ref :ref "ConnectionType" :items nil :optional t :doc "Connection type if known.")
        (:name :packet-loss :type :number :ref nil :items nil :optional t :doc "WebRTC packet loss (percent, 0-100). 0 disables packet loss emulation, 100 drops all the packets.")
        (:name :packet-queue-length :type :integer :ref nil :items nil :optional t :doc "WebRTC packet queue length (packet). 0 removes any queue length limitations.")
        (:name :packet-reordering :type :boolean :ref nil :items nil :optional t :doc "WebRTC packetReordering feature."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type block-pattern
  :cdp-id "BlockPattern" :type :object
  :properties (
        (:name :url-pattern :type :string :ref nil :items nil :optional nil :doc "URL pattern to match. Patterns use the URLPattern constructor string syntax (https://urlpattern.spec.whatwg.org/) and must be absolute. Example: `*://*:*/*.css`.")
        (:name :block :type :boolean :ref nil :items nil :optional nil :doc "Whether or not to block the pattern. If false, a matching request will not be blocked even if it matches a later `BlockPattern`."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type direct-socket-dns-query-type
  :cdp-id "DirectSocketDnsQueryType" :type :string
  :properties nil
  :enum '("ipv4" "ipv6")
  :doc "" :experimental t :deprecated nil)

(define-domain-type direct-tcp-socket-options
  :cdp-id "DirectTCPSocketOptions" :type :object
  :properties (
        (:name :no-delay :type :boolean :ref nil :items nil :optional nil :doc "TCP_NODELAY option")
        (:name :keep-alive-delay :type :number :ref nil :items nil :optional t :doc "Expected to be unsigned integer.")
        (:name :send-buffer-size :type :number :ref nil :items nil :optional t :doc "Expected to be unsigned integer.")
        (:name :receive-buffer-size :type :number :ref nil :items nil :optional t :doc "Expected to be unsigned integer.")
        (:name :dns-query-type :type :ref :ref "DirectSocketDnsQueryType" :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type direct-udp-socket-options
  :cdp-id "DirectUDPSocketOptions" :type :object
  :properties (
        (:name :remote-addr :type :string :ref nil :items nil :optional t :doc "")
        (:name :remote-port :type :integer :ref nil :items nil :optional t :doc "Unsigned int 16.")
        (:name :local-addr :type :string :ref nil :items nil :optional t :doc "")
        (:name :local-port :type :integer :ref nil :items nil :optional t :doc "Unsigned int 16.")
        (:name :dns-query-type :type :ref :ref "DirectSocketDnsQueryType" :items nil :optional t :doc "")
        (:name :send-buffer-size :type :number :ref nil :items nil :optional t :doc "Expected to be unsigned integer.")
        (:name :receive-buffer-size :type :number :ref nil :items nil :optional t :doc "Expected to be unsigned integer.")
        (:name :multicast-loopback :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :multicast-time-to-live :type :integer :ref nil :items nil :optional t :doc "Unsigned int 8.")
        (:name :multicast-allow-address-sharing :type :boolean :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type direct-udp-message
  :cdp-id "DirectUDPMessage" :type :object
  :properties (
        (:name :data :type :string :ref nil :items nil :optional nil :doc "")
        (:name :remote-addr :type :string :ref nil :items nil :optional t :doc "Null for connected mode.")
        (:name :remote-port :type :integer :ref nil :items nil :optional t :doc "Null for connected mode. Expected to be unsigned integer."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type local-network-access-request-policy
  :cdp-id "LocalNetworkAccessRequestPolicy" :type :string
  :properties nil
  :enum '("Allow" "BlockFromInsecureToMorePrivate" "WarnFromInsecureToMorePrivate" "PermissionBlock" "PermissionWarn")
  :doc "" :experimental t :deprecated nil)

(define-domain-type ip-address-space
  :cdp-id "IPAddressSpace" :type :string
  :properties nil
  :enum '("Loopback" "Local" "Public" "Unknown")
  :doc "" :experimental t :deprecated nil)

(define-domain-type connect-timing
  :cdp-id "ConnectTiming" :type :object
  :properties (
        (:name :request-time :type :number :ref nil :items nil :optional nil :doc "Timing's requestTime is a baseline in seconds, while the other numbers are ticks in milliseconds relatively to this requestTime. Matches ResourceTiming's requestTime for the same request (but not for redirected requests)."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type client-security-state
  :cdp-id "ClientSecurityState" :type :object
  :properties (
        (:name :initiator-is-secure-context :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :initiator-ip-address-space :type :ref :ref "IPAddressSpace" :items nil :optional nil :doc "")
        (:name :local-network-access-request-policy :type :ref :ref "LocalNetworkAccessRequestPolicy" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type cross-origin-opener-policy-value
  :cdp-id "CrossOriginOpenerPolicyValue" :type :string
  :properties nil
  :enum '("SameOrigin" "SameOriginAllowPopups" "RestrictProperties" "UnsafeNone" "SameOriginPlusCoep" "RestrictPropertiesPlusCoep" "NoopenerAllowPopups")
  :doc "" :experimental t :deprecated nil)

(define-domain-type cross-origin-opener-policy-status
  :cdp-id "CrossOriginOpenerPolicyStatus" :type :object
  :properties (
        (:name :value :type :ref :ref "CrossOriginOpenerPolicyValue" :items nil :optional nil :doc "")
        (:name :report-only-value :type :ref :ref "CrossOriginOpenerPolicyValue" :items nil :optional nil :doc "")
        (:name :reporting-endpoint :type :string :ref nil :items nil :optional t :doc "")
        (:name :report-only-reporting-endpoint :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type cross-origin-embedder-policy-value
  :cdp-id "CrossOriginEmbedderPolicyValue" :type :string
  :properties nil
  :enum '("None" "Credentialless" "RequireCorp")
  :doc "" :experimental t :deprecated nil)

(define-domain-type cross-origin-embedder-policy-status
  :cdp-id "CrossOriginEmbedderPolicyStatus" :type :object
  :properties (
        (:name :value :type :ref :ref "CrossOriginEmbedderPolicyValue" :items nil :optional nil :doc "")
        (:name :report-only-value :type :ref :ref "CrossOriginEmbedderPolicyValue" :items nil :optional nil :doc "")
        (:name :reporting-endpoint :type :string :ref nil :items nil :optional t :doc "")
        (:name :report-only-reporting-endpoint :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type content-security-policy-source
  :cdp-id "ContentSecurityPolicySource" :type :string
  :properties nil
  :enum '("HTTP" "Meta")
  :doc "" :experimental t :deprecated nil)

(define-domain-type content-security-policy-status
  :cdp-id "ContentSecurityPolicyStatus" :type :object
  :properties (
        (:name :effective-directives :type :string :ref nil :items nil :optional nil :doc "")
        (:name :is-enforced :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :source :type :ref :ref "ContentSecurityPolicySource" :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type security-isolation-status
  :cdp-id "SecurityIsolationStatus" :type :object
  :properties (
        (:name :coop :type :ref :ref "CrossOriginOpenerPolicyStatus" :items nil :optional t :doc "")
        (:name :coep :type :ref :ref "CrossOriginEmbedderPolicyStatus" :items nil :optional t :doc "")
        (:name :csp :type :array :ref nil :items (:type :ref :ref "ContentSecurityPolicyStatus") :optional t :doc ""))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type report-status
  :cdp-id "ReportStatus" :type :string
  :properties nil
  :enum '("Queued" "Pending" "MarkedForRemoval" "Success")
  :doc "The status of a Reporting API report." :experimental t :deprecated nil)

(define-domain-type report-id
  :cdp-id "ReportId" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type reporting-api-report
  :cdp-id "ReportingApiReport" :type :object
  :properties (
        (:name :id :type :ref :ref "ReportId" :items nil :optional nil :doc "")
        (:name :initiator-url :type :string :ref nil :items nil :optional nil :doc "The URL of the document that triggered the report.")
        (:name :destination :type :string :ref nil :items nil :optional nil :doc "The name of the endpoint group that should be used to deliver the report.")
        (:name :type :type :string :ref nil :items nil :optional nil :doc "The type of the report (specifies the set of data that is contained in the report body).")
        (:name :timestamp :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "When the report was generated.")
        (:name :depth :type :integer :ref nil :items nil :optional nil :doc "How many uploads deep the related request was.")
        (:name :completed-attempts :type :integer :ref nil :items nil :optional nil :doc "The number of delivery attempts made so far, not including an active attempt.")
        (:name :body :type :object :ref nil :items nil :optional nil :doc "")
        (:name :status :type :ref :ref "ReportStatus" :items nil :optional nil :doc ""))
  :enum nil
  :doc "An object representing a report generated by the Reporting API." :experimental t :deprecated nil)

(define-domain-type reporting-api-endpoint
  :cdp-id "ReportingApiEndpoint" :type :object
  :properties (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "The URL of the endpoint to which reports may be delivered.")
        (:name :group-name :type :string :ref nil :items nil :optional nil :doc "Name of the endpoint group."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type device-bound-session-key
  :cdp-id "DeviceBoundSessionKey" :type :object
  :properties (
        (:name :site :type :string :ref nil :items nil :optional nil :doc "The site the session is set up for.")
        (:name :id :type :string :ref nil :items nil :optional nil :doc "The id of the session."))
  :enum nil
  :doc "Unique identifier for a device bound session." :experimental t :deprecated nil)

(define-domain-type device-bound-session-with-usage
  :cdp-id "DeviceBoundSessionWithUsage" :type :object
  :properties (
        (:name :session-key :type :ref :ref "DeviceBoundSessionKey" :items nil :optional nil :doc "The key for the session.")
        (:name :usage :type :string :ref nil :items nil :optional nil :doc "How the session was used (or not used)."))
  :enum nil
  :doc "How a device bound session was used during a request." :experimental t :deprecated nil)

(define-domain-type device-bound-session-cookie-craving
  :cdp-id "DeviceBoundSessionCookieCraving" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "The name of the craving.")
        (:name :domain :type :string :ref nil :items nil :optional nil :doc "The domain of the craving.")
        (:name :path :type :string :ref nil :items nil :optional nil :doc "The path of the craving.")
        (:name :secure :type :boolean :ref nil :items nil :optional nil :doc "The `Secure` attribute of the craving attributes.")
        (:name :http-only :type :boolean :ref nil :items nil :optional nil :doc "The `HttpOnly` attribute of the craving attributes.")
        (:name :same-site :type :ref :ref "CookieSameSite" :items nil :optional t :doc "The `SameSite` attribute of the craving attributes."))
  :enum nil
  :doc "A device bound session's cookie craving." :experimental t :deprecated nil)

(define-domain-type device-bound-session-url-rule
  :cdp-id "DeviceBoundSessionUrlRule" :type :object
  :properties (
        (:name :rule-type :type :string :ref nil :items nil :optional nil :doc "See comments on `net::device_bound_sessions::SessionInclusionRules::UrlRule::rule_type`.")
        (:name :host-pattern :type :string :ref nil :items nil :optional nil :doc "See comments on `net::device_bound_sessions::SessionInclusionRules::UrlRule::host_pattern`.")
        (:name :path-prefix :type :string :ref nil :items nil :optional nil :doc "See comments on `net::device_bound_sessions::SessionInclusionRules::UrlRule::path_prefix`."))
  :enum nil
  :doc "A device bound session's inclusion URL rule." :experimental t :deprecated nil)

(define-domain-type device-bound-session-inclusion-rules
  :cdp-id "DeviceBoundSessionInclusionRules" :type :object
  :properties (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "See comments on `net::device_bound_sessions::SessionInclusionRules::origin_`.")
        (:name :include-site :type :boolean :ref nil :items nil :optional nil :doc "Whether the whole site is included. See comments on `net::device_bound_sessions::SessionInclusionRules::include_site_` for more details; this boolean is true if that value is populated.")
        (:name :url-rules :type :array :ref nil :items (:type :ref :ref "DeviceBoundSessionUrlRule") :optional nil :doc "See comments on `net::device_bound_sessions::SessionInclusionRules::url_rules_`."))
  :enum nil
  :doc "A device bound session's inclusion rules." :experimental t :deprecated nil)

(define-domain-type device-bound-session
  :cdp-id "DeviceBoundSession" :type :object
  :properties (
        (:name :key :type :ref :ref "DeviceBoundSessionKey" :items nil :optional nil :doc "The site and session ID of the session.")
        (:name :refresh-url :type :string :ref nil :items nil :optional nil :doc "See comments on `net::device_bound_sessions::Session::refresh_url_`.")
        (:name :inclusion-rules :type :ref :ref "DeviceBoundSessionInclusionRules" :items nil :optional nil :doc "See comments on `net::device_bound_sessions::Session::inclusion_rules_`.")
        (:name :cookie-cravings :type :array :ref nil :items (:type :ref :ref "DeviceBoundSessionCookieCraving") :optional nil :doc "See comments on `net::device_bound_sessions::Session::cookie_cravings_`.")
        (:name :expiry-date :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "See comments on `net::device_bound_sessions::Session::expiry_date_`.")
        (:name :cached-challenge :type :string :ref nil :items nil :optional t :doc "See comments on `net::device_bound_sessions::Session::cached_challenge__`.")
        (:name :allowed-refresh-initiators :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "See comments on `net::device_bound_sessions::Session::allowed_refresh_initiators_`."))
  :enum nil
  :doc "A device bound session." :experimental t :deprecated nil)

(define-domain-type device-bound-session-event-id
  :cdp-id "DeviceBoundSessionEventId" :type :string
  :properties nil
  :enum nil
  :doc "A unique identifier for a device bound session event." :experimental t :deprecated nil)

(define-domain-type device-bound-session-fetch-result
  :cdp-id "DeviceBoundSessionFetchResult" :type :string
  :properties nil
  :enum '("Success" "KeyError" "SigningError" "ServerRequestedTermination" "InvalidSessionId" "InvalidChallenge" "TooManyChallenges" "InvalidFetcherUrl" "InvalidRefreshUrl" "TransientHttpError" "ScopeOriginSameSiteMismatch" "RefreshUrlSameSiteMismatch" "MismatchedSessionId" "MissingScope" "NoCredentials" "SubdomainRegistrationWellKnownUnavailable" "SubdomainRegistrationUnauthorized" "SubdomainRegistrationWellKnownMalformed" "SessionProviderWellKnownUnavailable" "RelyingPartyWellKnownUnavailable" "FederatedKeyThumbprintMismatch" "InvalidFederatedSessionUrl" "InvalidFederatedKey" "TooManyRelyingOriginLabels" "BoundCookieSetForbidden" "NetError" "ProxyError" "EmptySessionConfig" "InvalidCredentialsConfig" "InvalidCredentialsType" "InvalidCredentialsEmptyName" "InvalidCredentialsCookie" "PersistentHttpError" "RegistrationAttemptedChallenge" "InvalidScopeOrigin" "ScopeOriginContainsPath" "RefreshInitiatorNotString" "RefreshInitiatorInvalidHostPattern" "InvalidScopeSpecification" "MissingScopeSpecificationType" "EmptyScopeSpecificationDomain" "EmptyScopeSpecificationPath" "InvalidScopeSpecificationType" "InvalidScopeIncludeSite" "MissingScopeIncludeSite" "FederatedNotAuthorizedByProvider" "FederatedNotAuthorizedByRelyingParty" "SessionProviderWellKnownMalformed" "SessionProviderWellKnownHasProviderOrigin" "RelyingPartyWellKnownMalformed" "RelyingPartyWellKnownHasRelyingOrigins" "InvalidFederatedSessionProviderSessionMissing" "InvalidFederatedSessionWrongProviderOrigin" "InvalidCredentialsCookieCreationTime" "InvalidCredentialsCookieName" "InvalidCredentialsCookieParsing" "InvalidCredentialsCookieUnpermittedAttribute" "InvalidCredentialsCookieInvalidDomain" "InvalidCredentialsCookiePrefix" "InvalidScopeRulePath" "InvalidScopeRuleHostPattern" "ScopeRuleOriginScopedHostPatternMismatch" "ScopeRuleSiteScopedHostPatternMismatch" "SigningQuotaExceeded" "InvalidConfigJson" "InvalidFederatedSessionProviderFailedToRestoreKey" "FailedToUnwrapKey" "SessionDeletedDuringRefresh")
  :doc "A fetch result for a device bound session creation or refresh." :experimental t :deprecated nil)

(define-domain-type device-bound-session-failed-request
  :cdp-id "DeviceBoundSessionFailedRequest" :type :object
  :properties (
        (:name :request-url :type :string :ref nil :items nil :optional nil :doc "The failed request URL.")
        (:name :net-error :type :string :ref nil :items nil :optional t :doc "The net error of the response if it was not OK.")
        (:name :response-error :type :integer :ref nil :items nil :optional t :doc "The response code if the net error was OK and the response code was not 200.")
        (:name :response-error-body :type :string :ref nil :items nil :optional t :doc "The body of the response if the net error was OK, the response code was not 200, and the response body was not empty."))
  :enum nil
  :doc "Details about a failed device bound session network request." :experimental t :deprecated nil)

(define-domain-type creation-event-details
  :cdp-id "CreationEventDetails" :type :object
  :properties (
        (:name :fetch-result :type :ref :ref "DeviceBoundSessionFetchResult" :items nil :optional nil :doc "The result of the fetch attempt.")
        (:name :new-session :type :ref :ref "DeviceBoundSession" :items nil :optional t :doc "The session if there was a newly created session. This is populated for all successful creation events.")
        (:name :failed-request :type :ref :ref "DeviceBoundSessionFailedRequest" :items nil :optional t :doc "Details about a failed device bound session network request if there was one."))
  :enum nil
  :doc "Session event details specific to creation." :experimental t :deprecated nil)

(define-domain-type refresh-event-details
  :cdp-id "RefreshEventDetails" :type :object
  :properties (
        (:name :refresh-result :type :string :ref nil :items nil :optional nil :doc "The result of a refresh.")
        (:name :fetch-result :type :ref :ref "DeviceBoundSessionFetchResult" :items nil :optional t :doc "If there was a fetch attempt, the result of that.")
        (:name :new-session :type :ref :ref "DeviceBoundSession" :items nil :optional t :doc "The session display if there was a newly created session. This is populated for any refresh event that modifies the session config.")
        (:name :was-fully-proactive-refresh :type :boolean :ref nil :items nil :optional nil :doc "See comments on `net::device_bound_sessions::RefreshEventResult::was_fully_proactive_refresh`.")
        (:name :failed-request :type :ref :ref "DeviceBoundSessionFailedRequest" :items nil :optional t :doc "Details about a failed device bound session network request if there was one."))
  :enum nil
  :doc "Session event details specific to refresh." :experimental t :deprecated nil)

(define-domain-type termination-event-details
  :cdp-id "TerminationEventDetails" :type :object
  :properties (
        (:name :deletion-reason :type :string :ref nil :items nil :optional nil :doc "The reason for a session being deleted."))
  :enum nil
  :doc "Session event details specific to termination." :experimental t :deprecated nil)

(define-domain-type challenge-event-details
  :cdp-id "ChallengeEventDetails" :type :object
  :properties (
        (:name :challenge-result :type :string :ref nil :items nil :optional nil :doc "The result of a challenge.")
        (:name :challenge :type :string :ref nil :items nil :optional nil :doc "The challenge set."))
  :enum nil
  :doc "Session event details specific to challenges." :experimental t :deprecated nil)

(define-domain-type load-network-resource-page-result
  :cdp-id "LoadNetworkResourcePageResult" :type :object
  :properties (
        (:name :success :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :net-error :type :number :ref nil :items nil :optional t :doc "Optional values used for error reporting.")
        (:name :net-error-name :type :string :ref nil :items nil :optional t :doc "")
        (:name :http-status-code :type :number :ref nil :items nil :optional t :doc "")
        (:name :stream :type :ref :ref "IO.StreamHandle" :items nil :optional t :doc "If successful, one of the following two fields holds the result.")
        (:name :headers :type :ref :ref "Network.Headers" :items nil :optional t :doc "Response headers."))
  :enum nil
  :doc "An object providing the result of a network resource load." :experimental t :deprecated nil)

(define-domain-type load-network-resource-options
  :cdp-id "LoadNetworkResourceOptions" :type :object
  :properties (
        (:name :disable-cache :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :include-credentials :type :boolean :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "An options object that may be extended later to better support CORS, CORB and streaming." :experimental t :deprecated nil)

(define-domain-command set-accepted-encodings
  :method "Network.setAcceptedEncodings"
  :params (
        (:name :encodings :type :array :ref nil :items (:type :ref :ref "ContentEncoding") :optional nil :doc "List of accepted content encodings."))
  :returns nil
  :doc "Sets a list of content encodings that will be accepted. Empty list means no encoding is accepted." :experimental t :deprecated nil)

(define-domain-command clear-accepted-encodings-override
  :method "Network.clearAcceptedEncodingsOverride"
  :params nil
  :returns nil
  :doc "Clears accepted encodings set by setAcceptedEncodings" :experimental t :deprecated nil)

(define-domain-command can-clear-browser-cache
  :method "Network.canClearBrowserCache"
  :params nil
  :returns (
        (:name :result :type :boolean :ref nil :items nil :optional nil :doc "True if browser cache can be cleared."))
  :doc "Tells whether clearing browser cache is supported." :experimental nil :deprecated t)

(define-domain-command can-clear-browser-cookies
  :method "Network.canClearBrowserCookies"
  :params nil
  :returns (
        (:name :result :type :boolean :ref nil :items nil :optional nil :doc "True if browser cookies can be cleared."))
  :doc "Tells whether clearing browser cookies is supported." :experimental nil :deprecated t)

(define-domain-command can-emulate-network-conditions
  :method "Network.canEmulateNetworkConditions"
  :params nil
  :returns (
        (:name :result :type :boolean :ref nil :items nil :optional nil :doc "True if emulation of network conditions is supported."))
  :doc "Tells whether emulation of network conditions is supported." :experimental nil :deprecated t)

(define-domain-command clear-browser-cache
  :method "Network.clearBrowserCache"
  :params nil
  :returns nil
  :doc "Clears browser cache." :experimental nil :deprecated nil)

(define-domain-command clear-browser-cookies
  :method "Network.clearBrowserCookies"
  :params nil
  :returns nil
  :doc "Clears browser cookies." :experimental nil :deprecated nil)

(define-domain-command continue-intercepted-request
  :method "Network.continueInterceptedRequest"
  :params (
        (:name :interception-id :type :ref :ref "InterceptionId" :items nil :optional nil :doc "")
        (:name :error-reason :type :ref :ref "ErrorReason" :items nil :optional t :doc "If set this causes the request to fail with the given reason. Passing `Aborted` for requests marked with `isNavigationRequest` also cancels the navigation. Must not be set in response to an authChallenge.")
        (:name :raw-response :type :string :ref nil :items nil :optional t :doc "If set the requests completes using with the provided base64 encoded raw response, including HTTP status line and headers etc... Must not be set in response to an authChallenge. (Encoded as a base64 string when passed over JSON)")
        (:name :url :type :string :ref nil :items nil :optional t :doc "If set the request url will be modified in a way that's not observable by page. Must not be set in response to an authChallenge.")
        (:name :method :type :string :ref nil :items nil :optional t :doc "If set this allows the request method to be overridden. Must not be set in response to an authChallenge.")
        (:name :post-data :type :string :ref nil :items nil :optional t :doc "If set this allows postData to be set. Must not be set in response to an authChallenge.")
        (:name :headers :type :ref :ref "Headers" :items nil :optional t :doc "If set this allows the request headers to be changed. Must not be set in response to an authChallenge.")
        (:name :auth-challenge-response :type :ref :ref "AuthChallengeResponse" :items nil :optional t :doc "Response to a requestIntercepted with an authChallenge. Must not be set otherwise."))
  :returns nil
  :doc "Response to Network.requestIntercepted which either modifies the request to continue with any modifications, or blocks it, or completes it with the provided response bytes. If a network fetch occurs as a result which encounters a redirect an additional Network.requestIntercepted event will be sent with the same InterceptionId. Deprecated, use Fetch.continueRequest, Fetch.fulfillRequest and Fetch.failRequest instead." :experimental t :deprecated t)

(define-domain-command delete-cookies
  :method "Network.deleteCookies"
  :params (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Name of the cookies to remove.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "If specified, deletes all the cookies with the given name where domain and path match provided URL.")
        (:name :domain :type :string :ref nil :items nil :optional t :doc "If specified, deletes only cookies with the exact domain.")
        (:name :path :type :string :ref nil :items nil :optional t :doc "If specified, deletes only cookies with the exact path.")
        (:name :partition-key :type :ref :ref "CookiePartitionKey" :items nil :optional t :doc "If specified, deletes only cookies with the the given name and partitionKey where all partition key attributes match the cookie partition key attribute."))
  :returns nil
  :doc "Deletes browser cookies with matching name and url or domain/path/partitionKey pair." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Network.disable"
  :params nil
  :returns nil
  :doc "Disables network tracking, prevents network events from being sent to the client." :experimental nil :deprecated nil)

(define-domain-command emulate-network-conditions
  :method "Network.emulateNetworkConditions"
  :params (
        (:name :offline :type :boolean :ref nil :items nil :optional nil :doc "True to emulate internet disconnection.")
        (:name :latency :type :number :ref nil :items nil :optional nil :doc "Minimum latency from request sent to response headers received (ms).")
        (:name :download-throughput :type :number :ref nil :items nil :optional nil :doc "Maximal aggregated download throughput (bytes/sec). -1 disables download throttling.")
        (:name :upload-throughput :type :number :ref nil :items nil :optional nil :doc "Maximal aggregated upload throughput (bytes/sec).  -1 disables upload throttling.")
        (:name :connection-type :type :ref :ref "ConnectionType" :items nil :optional t :doc "Connection type if known.")
        (:name :packet-loss :type :number :ref nil :items nil :optional t :doc "WebRTC packet loss (percent, 0-100). 0 disables packet loss emulation, 100 drops all the packets.")
        (:name :packet-queue-length :type :integer :ref nil :items nil :optional t :doc "WebRTC packet queue length (packet). 0 removes any queue length limitations.")
        (:name :packet-reordering :type :boolean :ref nil :items nil :optional t :doc "WebRTC packetReordering feature."))
  :returns nil
  :doc "Activates emulation of network conditions. This command is deprecated in favor of the emulateNetworkConditionsByRule and overrideNetworkState commands, which can be used together to the same effect." :experimental nil :deprecated t)

(define-domain-command emulate-network-conditions-by-rule
  :method "Network.emulateNetworkConditionsByRule"
  :params (
        (:name :offline :type :boolean :ref nil :items nil :optional nil :doc "True to emulate internet disconnection.")
        (:name :matched-network-conditions :type :array :ref nil :items (:type :ref :ref "NetworkConditions") :optional nil :doc "Configure conditions for matching requests. If multiple entries match a request, the first entry wins.  Global conditions can be configured by leaving the urlPattern for the conditions empty. These global conditions are also applied for throttling of p2p connections."))
  :returns (
        (:name :rule-ids :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "An id for each entry in matchedNetworkConditions. The id will be included in the requestWillBeSentExtraInfo for requests affected by a rule."))
  :doc "Activates emulation of network conditions for individual requests using URL match patterns. Unlike the deprecated Network.emulateNetworkConditions this method does not affect `navigator` state. Use Network.overrideNetworkState to explicitly modify `navigator` behavior." :experimental t :deprecated nil)

(define-domain-command override-network-state
  :method "Network.overrideNetworkState"
  :params (
        (:name :offline :type :boolean :ref nil :items nil :optional nil :doc "True to emulate internet disconnection.")
        (:name :latency :type :number :ref nil :items nil :optional nil :doc "Minimum latency from request sent to response headers received (ms).")
        (:name :download-throughput :type :number :ref nil :items nil :optional nil :doc "Maximal aggregated download throughput (bytes/sec). -1 disables download throttling.")
        (:name :upload-throughput :type :number :ref nil :items nil :optional nil :doc "Maximal aggregated upload throughput (bytes/sec).  -1 disables upload throttling.")
        (:name :connection-type :type :ref :ref "ConnectionType" :items nil :optional t :doc "Connection type if known."))
  :returns nil
  :doc "Override the state of navigator.onLine and navigator.connection." :experimental t :deprecated nil)

(define-domain-command enable
  :method "Network.enable"
  :params (
        (:name :max-total-buffer-size :type :integer :ref nil :items nil :optional t :doc "Buffer size in bytes to use when preserving network payloads (XHRs, etc). This is the maximum number of bytes that will be collected by this DevTools session.")
        (:name :max-resource-buffer-size :type :integer :ref nil :items nil :optional t :doc "Per-resource buffer size in bytes to use when preserving network payloads (XHRs, etc).")
        (:name :max-post-data-size :type :integer :ref nil :items nil :optional t :doc "Longest post body size (in bytes) that would be included in requestWillBeSent notification")
        (:name :report-direct-socket-traffic :type :boolean :ref nil :items nil :optional t :doc "Whether DirectSocket chunk send/receive events should be reported.")
        (:name :enable-durable-messages :type :boolean :ref nil :items nil :optional t :doc "Enable storing response bodies outside of renderer, so that these survive a cross-process navigation. Requires maxTotalBufferSize to be set. Currently defaults to false. This field is being deprecated in favor of the dedicated configureDurableMessages command, due to the possibility of deadlocks when awaiting Network.enable before issuing Runtime.runIfWaitingForDebugger."))
  :returns nil
  :doc "Enables network tracking, network events will now be delivered to the client." :experimental nil :deprecated nil)

(define-domain-command configure-durable-messages
  :method "Network.configureDurableMessages"
  :params (
        (:name :max-total-buffer-size :type :integer :ref nil :items nil :optional t :doc "Buffer size in bytes to use when preserving network payloads (XHRs, etc).")
        (:name :max-resource-buffer-size :type :integer :ref nil :items nil :optional t :doc "Per-resource buffer size in bytes to use when preserving network payloads (XHRs, etc)."))
  :returns nil
  :doc "Configures storing response bodies outside of renderer, so that these survive a cross-process navigation. If maxTotalBufferSize is not set, durable messages are disabled." :experimental t :deprecated nil)

(define-domain-command get-all-cookies
  :method "Network.getAllCookies"
  :params nil
  :returns (
        (:name :cookies :type :array :ref nil :items (:type :ref :ref "Cookie") :optional nil :doc "Array of cookie objects."))
  :doc "Returns all browser cookies. Depending on the backend support, will return detailed cookie information in the `cookies` field. Deprecated. Use Storage.getCookies instead." :experimental nil :deprecated t)

(define-domain-command get-certificate
  :method "Network.getCertificate"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin to get certificate for."))
  :returns (
        (:name :table-names :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :doc "Returns the DER-encoded certificate." :experimental t :deprecated nil)

(define-domain-command get-cookies
  :method "Network.getCookies"
  :params (
        (:name :urls :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "The list of URLs for which applicable cookies will be fetched. If not specified, it's assumed to be set to the list containing the URLs of the page and all of its subframes."))
  :returns (
        (:name :cookies :type :array :ref nil :items (:type :ref :ref "Cookie") :optional nil :doc "Array of cookie objects."))
  :doc "Returns all browser cookies for the current URL. Depending on the backend support, will return detailed cookie information in the `cookies` field." :experimental nil :deprecated nil)

(define-domain-command get-response-body
  :method "Network.getResponseBody"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Identifier of the network request to get content for."))
  :returns (
        (:name :body :type :string :ref nil :items nil :optional nil :doc "Response body.")
        (:name :base64-encoded :type :boolean :ref nil :items nil :optional nil :doc "True, if content was sent as base64."))
  :doc "Returns content served for the given request." :experimental nil :deprecated nil)

(define-domain-command get-request-post-data
  :method "Network.getRequestPostData"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Identifier of the network request to get content for."))
  :returns (
        (:name :post-data :type :string :ref nil :items nil :optional nil :doc "Request body string, omitting files from multipart requests")
        (:name :base64-encoded :type :boolean :ref nil :items nil :optional nil :doc "True, if content was sent as base64."))
  :doc "Returns post data sent with the request. Returns an error when no data was sent with the request." :experimental nil :deprecated nil)

(define-domain-command get-response-body-for-interception
  :method "Network.getResponseBodyForInterception"
  :params (
        (:name :interception-id :type :ref :ref "InterceptionId" :items nil :optional nil :doc "Identifier for the intercepted request to get body for."))
  :returns (
        (:name :body :type :string :ref nil :items nil :optional nil :doc "Response body.")
        (:name :base64-encoded :type :boolean :ref nil :items nil :optional nil :doc "True, if content was sent as base64."))
  :doc "Returns content served for the given currently intercepted request." :experimental t :deprecated nil)

(define-domain-command take-response-body-for-interception-as-stream
  :method "Network.takeResponseBodyForInterceptionAsStream"
  :params (
        (:name :interception-id :type :ref :ref "InterceptionId" :items nil :optional nil :doc ""))
  :returns (
        (:name :stream :type :ref :ref "IO.StreamHandle" :items nil :optional nil :doc ""))
  :doc "Returns a handle to the stream representing the response body. Note that after this command, the intercepted request can't be continued as is -- you either need to cancel it or to provide the response body. The stream only supports sequential read, IO.read will fail if the position is specified." :experimental t :deprecated nil)

(define-domain-command replay-xhr
  :method "Network.replayXHR"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Identifier of XHR to replay."))
  :returns nil
  :doc "This method sends a new XMLHttpRequest which is identical to the original one. The following parameters should be identical: method, url, async, request body, extra headers, withCredentials attribute, user, password." :experimental t :deprecated nil)

(define-domain-command search-in-response-body
  :method "Network.searchInResponseBody"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Identifier of the network response to search.")
        (:name :query :type :string :ref nil :items nil :optional nil :doc "String to search for.")
        (:name :case-sensitive :type :boolean :ref nil :items nil :optional t :doc "If true, search is case sensitive.")
        (:name :is-regex :type :boolean :ref nil :items nil :optional t :doc "If true, treats string parameter as regex."))
  :returns (
        (:name :result :type :array :ref nil :items (:type :ref :ref "Debugger.SearchMatch") :optional nil :doc "List of search matches."))
  :doc "Searches for given string in response content." :experimental t :deprecated nil)

(define-domain-command set-blocked-ur-ls
  :method "Network.setBlockedURLs"
  :params (
        (:name :url-patterns :type :array :ref nil :items (:type :ref :ref "BlockPattern") :optional t :doc "Patterns to match in the order in which they are given. These patterns also take precedence over any wildcard patterns defined in `urls`.")
        (:name :urls :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "URL patterns to block. Wildcards ('*') are allowed."))
  :returns nil
  :doc "Blocks URLs from loading." :experimental t :deprecated nil)

(define-domain-command set-bypass-service-worker
  :method "Network.setBypassServiceWorker"
  :params (
        (:name :bypass :type :boolean :ref nil :items nil :optional nil :doc "Bypass service worker and load from network."))
  :returns nil
  :doc "Toggles ignoring of service worker for each request." :experimental nil :deprecated nil)

(define-domain-command set-cache-disabled
  :method "Network.setCacheDisabled"
  :params (
        (:name :cache-disabled :type :boolean :ref nil :items nil :optional nil :doc "Cache disabled state."))
  :returns nil
  :doc "Toggles ignoring cache for each request. If `true`, cache will not be used." :experimental nil :deprecated nil)

(define-domain-command set-cookie
  :method "Network.setCookie"
  :params (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Cookie name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Cookie value.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "The request-URI to associate with the setting of the cookie. This value can affect the default domain, path, source port, and source scheme values of the created cookie.")
        (:name :domain :type :string :ref nil :items nil :optional t :doc "Cookie domain.")
        (:name :path :type :string :ref nil :items nil :optional t :doc "Cookie path.")
        (:name :secure :type :boolean :ref nil :items nil :optional t :doc "True if cookie is secure.")
        (:name :http-only :type :boolean :ref nil :items nil :optional t :doc "True if cookie is http-only.")
        (:name :same-site :type :ref :ref "CookieSameSite" :items nil :optional t :doc "Cookie SameSite type.")
        (:name :expires :type :ref :ref "TimeSinceEpoch" :items nil :optional t :doc "Cookie expiration date, session cookie if not set")
        (:name :priority :type :ref :ref "CookiePriority" :items nil :optional t :doc "Cookie Priority type.")
        (:name :source-scheme :type :ref :ref "CookieSourceScheme" :items nil :optional t :doc "Cookie source scheme type.")
        (:name :source-port :type :integer :ref nil :items nil :optional t :doc "Cookie source port. Valid values are {-1, [1, 65535]}, -1 indicates an unspecified port. An unspecified port value allows protocol clients to emulate legacy cookie scope for the port. This is a temporary ability and it will be removed in the future.")
        (:name :partition-key :type :ref :ref "CookiePartitionKey" :items nil :optional t :doc "Cookie partition key. If not set, the cookie will be set as not partitioned."))
  :returns (
        (:name :success :type :boolean :ref nil :items nil :optional nil :doc "Always set to true. If an error occurs, the response indicates protocol error."))
  :doc "Sets a cookie with the given cookie data; may overwrite equivalent cookies if they exist." :experimental nil :deprecated nil)

(define-domain-command set-cookies
  :method "Network.setCookies"
  :params (
        (:name :cookies :type :array :ref nil :items (:type :ref :ref "CookieParam") :optional nil :doc "Cookies to be set."))
  :returns nil
  :doc "Sets given cookies." :experimental nil :deprecated nil)

(define-domain-command set-extra-http-headers
  :method "Network.setExtraHTTPHeaders"
  :params (
        (:name :headers :type :ref :ref "Headers" :items nil :optional nil :doc "Map with extra HTTP headers."))
  :returns nil
  :doc "Specifies whether to always send extra HTTP headers with the requests from this page." :experimental nil :deprecated nil)

(define-domain-command set-attach-debug-stack
  :method "Network.setAttachDebugStack"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether to attach a page script stack for debugging purpose."))
  :returns nil
  :doc "Specifies whether to attach a page script stack id in requests" :experimental t :deprecated nil)

(define-domain-command set-request-interception
  :method "Network.setRequestInterception"
  :params (
        (:name :patterns :type :array :ref nil :items (:type :ref :ref "RequestPattern") :optional nil :doc "Requests matching any of these patterns will be forwarded and wait for the corresponding continueInterceptedRequest call."))
  :returns nil
  :doc "Sets the requests to intercept that match the provided patterns and optionally resource types. Deprecated, please use Fetch.enable instead." :experimental t :deprecated t)

(define-domain-command set-user-agent-override
  :method "Network.setUserAgentOverride"
  :params (
        (:name :user-agent :type :string :ref nil :items nil :optional nil :doc "User agent to use.")
        (:name :accept-language :type :string :ref nil :items nil :optional t :doc "Browser language to emulate.")
        (:name :platform :type :string :ref nil :items nil :optional t :doc "The platform navigator.platform should return.")
        (:name :user-agent-metadata :type :ref :ref "Emulation.UserAgentMetadata" :items nil :optional t :doc "To be sent in Sec-CH-UA-* headers and returned in navigator.userAgentData"))
  :returns nil
  :doc "Allows overriding user agent with the given string." :experimental nil :deprecated nil)

(define-domain-command stream-resource-content
  :method "Network.streamResourceContent"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Identifier of the request to stream."))
  :returns (
        (:name :buffered-data :type :string :ref nil :items nil :optional nil :doc "Data that has been buffered until streaming is enabled. (Encoded as a base64 string when passed over JSON)"))
  :doc "Enables streaming of the response for the given requestId. If enabled, the dataReceived event contains the data that was received during streaming." :experimental t :deprecated nil)

(define-domain-command get-security-isolation-status
  :method "Network.getSecurityIsolationStatus"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "If no frameId is provided, the status of the target is provided."))
  :returns (
        (:name :status :type :ref :ref "SecurityIsolationStatus" :items nil :optional nil :doc ""))
  :doc "Returns information about the COEP/COOP isolation status." :experimental t :deprecated nil)

(define-domain-command enable-reporting-api
  :method "Network.enableReportingApi"
  :params (
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc "Whether to enable or disable events for the Reporting API"))
  :returns nil
  :doc "Enables tracking for the Reporting API, events generated by the Reporting API will now be delivered to the client. Enabling triggers 'reportingApiReportAdded' for all existing reports." :experimental t :deprecated nil)

(define-domain-command enable-device-bound-sessions
  :method "Network.enableDeviceBoundSessions"
  :params (
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc "Whether to enable or disable events."))
  :returns nil
  :doc "Sets up tracking device bound sessions and fetching of initial set of sessions." :experimental t :deprecated nil)

(define-domain-command fetch-schemeful-site
  :method "Network.fetchSchemefulSite"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "The URL origin."))
  :returns (
        (:name :schemeful-site :type :string :ref nil :items nil :optional nil :doc "The corresponding schemeful site."))
  :doc "Fetches the schemeful site for a specific origin." :experimental t :deprecated nil)

(define-domain-command load-network-resource
  :method "Network.loadNetworkResource"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "Frame id to get the resource for. Mandatory for frame targets, and should be omitted for worker targets.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL of the resource to get content for.")
        (:name :options :type :ref :ref "LoadNetworkResourceOptions" :items nil :optional nil :doc "Options for the request."))
  :returns (
        (:name :resource :type :ref :ref "LoadNetworkResourcePageResult" :items nil :optional nil :doc ""))
  :doc "Fetches the resource and returns the content." :experimental t :deprecated nil)

(define-domain-command set-cookie-controls
  :method "Network.setCookieControls"
  :params (
        (:name :enable-third-party-cookie-restriction :type :boolean :ref nil :items nil :optional nil :doc "Whether 3pc restriction is enabled.")
        (:name :disable-third-party-cookie-metadata :type :boolean :ref nil :items nil :optional nil :doc "Whether 3pc grace period exception should be enabled; false by default.")
        (:name :disable-third-party-cookie-heuristics :type :boolean :ref nil :items nil :optional nil :doc "Whether 3pc heuristics exceptions should be enabled; false by default."))
  :returns nil
  :doc "Sets Controls for third-party cookie access Page reload is required before the new cookie behavior will be observed" :experimental t :deprecated nil)

(define-domain-event data-received
  :method "Network.dataReceived"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :data-length :type :integer :ref nil :items nil :optional nil :doc "Data chunk length.")
        (:name :encoded-data-length :type :integer :ref nil :items nil :optional nil :doc "Actual bytes received (might be less than dataLength for compressed encodings).")
        (:name :data :type :string :ref nil :items nil :optional t :doc "Data that was received. (Encoded as a base64 string when passed over JSON)"))
  :doc "Fired when data chunk was received over the network." :experimental nil :deprecated nil)

(define-domain-event event-source-message-received
  :method "Network.eventSourceMessageReceived"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :event-name :type :string :ref nil :items nil :optional nil :doc "Message type.")
        (:name :event-id :type :string :ref nil :items nil :optional nil :doc "Message identifier.")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Message content."))
  :doc "Fired when EventSource message is received." :experimental nil :deprecated nil)

(define-domain-event loading-failed
  :method "Network.loadingFailed"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :type :type :ref :ref "ResourceType" :items nil :optional nil :doc "Resource type.")
        (:name :error-text :type :string :ref nil :items nil :optional nil :doc "Error message. List of network errors: https://cs.chromium.org/chromium/src/net/base/net_error_list.h")
        (:name :canceled :type :boolean :ref nil :items nil :optional t :doc "True if loading was canceled.")
        (:name :blocked-reason :type :ref :ref "BlockedReason" :items nil :optional t :doc "The reason why loading was blocked, if any.")
        (:name :cors-error-status :type :ref :ref "CorsErrorStatus" :items nil :optional t :doc "The reason why loading was blocked by CORS, if any."))
  :doc "Fired when HTTP request has failed to load." :experimental nil :deprecated nil)

(define-domain-event loading-finished
  :method "Network.loadingFinished"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :encoded-data-length :type :number :ref nil :items nil :optional nil :doc "Total number of bytes received for this request."))
  :doc "Fired when HTTP request has finished loading." :experimental nil :deprecated nil)

(define-domain-event request-intercepted
  :method "Network.requestIntercepted"
  :params (
        (:name :interception-id :type :ref :ref "InterceptionId" :items nil :optional nil :doc "Each request the page makes will have a unique id, however if any redirects are encountered while processing that fetch, they will be reported with the same id as the original fetch. Likewise if HTTP authentication is needed then the same fetch id will be used.")
        (:name :request :type :ref :ref "Request" :items nil :optional nil :doc "")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "The id of the frame that initiated the request.")
        (:name :resource-type :type :ref :ref "ResourceType" :items nil :optional nil :doc "How the requested resource will be used.")
        (:name :is-navigation-request :type :boolean :ref nil :items nil :optional nil :doc "Whether this is a navigation request, which can abort the navigation completely.")
        (:name :is-download :type :boolean :ref nil :items nil :optional t :doc "Set if the request is a navigation that will result in a download. Only present after response is received from the server (i.e. HeadersReceived stage).")
        (:name :redirect-url :type :string :ref nil :items nil :optional t :doc "Redirect location, only sent if a redirect was intercepted.")
        (:name :auth-challenge :type :ref :ref "AuthChallenge" :items nil :optional t :doc "Details of the Authorization Challenge encountered. If this is set then continueInterceptedRequest must contain an authChallengeResponse.")
        (:name :response-error-reason :type :ref :ref "ErrorReason" :items nil :optional t :doc "Response error if intercepted at response stage or if redirect occurred while intercepting request.")
        (:name :response-status-code :type :integer :ref nil :items nil :optional t :doc "Response code if intercepted at response stage or if redirect occurred while intercepting request or auth retry occurred.")
        (:name :response-headers :type :ref :ref "Headers" :items nil :optional t :doc "Response headers if intercepted at the response stage or if redirect occurred while intercepting request or auth retry occurred.")
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional t :doc "If the intercepted request had a corresponding requestWillBeSent event fired for it, then this requestId will be the same as the requestId present in the requestWillBeSent event."))
  :doc "Details of an intercepted HTTP request, which must be either allowed, blocked, modified or mocked. Deprecated, use Fetch.requestPaused instead." :experimental t :deprecated t)

(define-domain-event request-served-from-cache
  :method "Network.requestServedFromCache"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier."))
  :doc "Fired if request ended up loading from cache." :experimental nil :deprecated nil)

(define-domain-event request-will-be-sent
  :method "Network.requestWillBeSent"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :loader-id :type :ref :ref "LoaderId" :items nil :optional nil :doc "Loader identifier. Empty string if the request is fetched from worker.")
        (:name :document-url :type :string :ref nil :items nil :optional nil :doc "URL of the document this request is loaded for.")
        (:name :request :type :ref :ref "Request" :items nil :optional nil :doc "Request data.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :wall-time :type :ref :ref "TimeSinceEpoch" :items nil :optional nil :doc "Timestamp.")
        (:name :initiator :type :ref :ref "Initiator" :items nil :optional nil :doc "Request initiator.")
        (:name :redirect-has-extra-info :type :boolean :ref nil :items nil :optional nil :doc "In the case that redirectResponse is populated, this flag indicates whether requestWillBeSentExtraInfo and responseReceivedExtraInfo events will be or were emitted for the request which was just redirected.")
        (:name :redirect-response :type :ref :ref "Response" :items nil :optional t :doc "Redirect response data.")
        (:name :type :type :ref :ref "ResourceType" :items nil :optional t :doc "Type of this resource.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "Frame identifier.")
        (:name :has-user-gesture :type :boolean :ref nil :items nil :optional t :doc "Whether the request is initiated by a user gesture. Defaults to false.")
        (:name :render-blocking-behavior :type :ref :ref "RenderBlockingBehavior" :items nil :optional t :doc "The render-blocking behavior of the request."))
  :doc "Fired when page is about to send HTTP request." :experimental nil :deprecated nil)

(define-domain-event resource-changed-priority
  :method "Network.resourceChangedPriority"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :new-priority :type :ref :ref "ResourcePriority" :items nil :optional nil :doc "New priority")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp."))
  :doc "Fired when resource loading priority is changed" :experimental t :deprecated nil)

(define-domain-event signed-exchange-received
  :method "Network.signedExchangeReceived"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :info :type :ref :ref "SignedExchangeInfo" :items nil :optional nil :doc "Information about the signed exchange response."))
  :doc "Fired when a signed exchange was received over the network" :experimental t :deprecated nil)

(define-domain-event response-received
  :method "Network.responseReceived"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :loader-id :type :ref :ref "LoaderId" :items nil :optional nil :doc "Loader identifier. Empty string if the request is fetched from worker.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :type :type :ref :ref "ResourceType" :items nil :optional nil :doc "Resource type.")
        (:name :response :type :ref :ref "Response" :items nil :optional nil :doc "Response data.")
        (:name :has-extra-info :type :boolean :ref nil :items nil :optional nil :doc "Indicates whether requestWillBeSentExtraInfo and responseReceivedExtraInfo events will be or were emitted for this request.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "Frame identifier."))
  :doc "Fired when HTTP response is available." :experimental nil :deprecated nil)

(define-domain-event web-socket-closed
  :method "Network.webSocketClosed"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp."))
  :doc "Fired when WebSocket is closed." :experimental nil :deprecated nil)

(define-domain-event web-socket-created
  :method "Network.webSocketCreated"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "WebSocket request URL.")
        (:name :initiator :type :ref :ref "Initiator" :items nil :optional t :doc "Request initiator."))
  :doc "Fired upon WebSocket creation." :experimental nil :deprecated nil)

(define-domain-event web-socket-frame-error
  :method "Network.webSocketFrameError"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :error-message :type :string :ref nil :items nil :optional nil :doc "WebSocket error message."))
  :doc "Fired when WebSocket message error occurs." :experimental nil :deprecated nil)

(define-domain-event web-socket-frame-received
  :method "Network.webSocketFrameReceived"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :response :type :ref :ref "WebSocketFrame" :items nil :optional nil :doc "WebSocket response data."))
  :doc "Fired when WebSocket message is received." :experimental nil :deprecated nil)

(define-domain-event web-socket-frame-sent
  :method "Network.webSocketFrameSent"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :response :type :ref :ref "WebSocketFrame" :items nil :optional nil :doc "WebSocket response data."))
  :doc "Fired when WebSocket message is sent." :experimental nil :deprecated nil)

(define-domain-event web-socket-handshake-response-received
  :method "Network.webSocketHandshakeResponseReceived"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :response :type :ref :ref "WebSocketResponse" :items nil :optional nil :doc "WebSocket response data."))
  :doc "Fired when WebSocket handshake response becomes available." :experimental nil :deprecated nil)

(define-domain-event web-socket-will-send-handshake-request
  :method "Network.webSocketWillSendHandshakeRequest"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :wall-time :type :ref :ref "TimeSinceEpoch" :items nil :optional nil :doc "UTC Timestamp.")
        (:name :request :type :ref :ref "WebSocketRequest" :items nil :optional nil :doc "WebSocket request data."))
  :doc "Fired when WebSocket is about to initiate handshake." :experimental nil :deprecated nil)

(define-domain-event web-transport-created
  :method "Network.webTransportCreated"
  :params (
        (:name :transport-id :type :ref :ref "RequestId" :items nil :optional nil :doc "WebTransport identifier.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "WebTransport request URL.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp.")
        (:name :initiator :type :ref :ref "Initiator" :items nil :optional t :doc "Request initiator."))
  :doc "Fired upon WebTransport creation." :experimental nil :deprecated nil)

(define-domain-event web-transport-connection-established
  :method "Network.webTransportConnectionEstablished"
  :params (
        (:name :transport-id :type :ref :ref "RequestId" :items nil :optional nil :doc "WebTransport identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp."))
  :doc "Fired when WebTransport handshake is finished." :experimental nil :deprecated nil)

(define-domain-event web-transport-closed
  :method "Network.webTransportClosed"
  :params (
        (:name :transport-id :type :ref :ref "RequestId" :items nil :optional nil :doc "WebTransport identifier.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "Timestamp."))
  :doc "Fired when WebTransport is disposed." :experimental nil :deprecated nil)

(define-domain-event direct-tcp-socket-created
  :method "Network.directTCPSocketCreated"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :remote-addr :type :string :ref nil :items nil :optional nil :doc "")
        (:name :remote-port :type :integer :ref nil :items nil :optional nil :doc "Unsigned int 16.")
        (:name :options :type :ref :ref "DirectTCPSocketOptions" :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "")
        (:name :initiator :type :ref :ref "Initiator" :items nil :optional t :doc ""))
  :doc "Fired upon direct_socket.TCPSocket creation." :experimental t :deprecated nil)

(define-domain-event direct-tcp-socket-opened
  :method "Network.directTCPSocketOpened"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :remote-addr :type :string :ref nil :items nil :optional nil :doc "")
        (:name :remote-port :type :integer :ref nil :items nil :optional nil :doc "Expected to be unsigned integer.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "")
        (:name :local-addr :type :string :ref nil :items nil :optional t :doc "")
        (:name :local-port :type :integer :ref nil :items nil :optional t :doc "Expected to be unsigned integer."))
  :doc "Fired when direct_socket.TCPSocket connection is opened." :experimental t :deprecated nil)

(define-domain-event direct-tcp-socket-aborted
  :method "Network.directTCPSocketAborted"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :error-message :type :string :ref nil :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired when direct_socket.TCPSocket is aborted." :experimental t :deprecated nil)

(define-domain-event direct-tcp-socket-closed
  :method "Network.directTCPSocketClosed"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired when direct_socket.TCPSocket is closed." :experimental t :deprecated nil)

(define-domain-event direct-tcp-socket-chunk-sent
  :method "Network.directTCPSocketChunkSent"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired when data is sent to tcp direct socket stream." :experimental t :deprecated nil)

(define-domain-event direct-tcp-socket-chunk-received
  :method "Network.directTCPSocketChunkReceived"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired when data is received from tcp direct socket stream." :experimental t :deprecated nil)

(define-domain-event direct-udp-socket-joined-multicast-group
  :method "Network.directUDPSocketJoinedMulticastGroup"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :ip-address :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-event direct-udp-socket-left-multicast-group
  :method "Network.directUDPSocketLeftMulticastGroup"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :ip-address :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-event direct-udp-socket-created
  :method "Network.directUDPSocketCreated"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :options :type :ref :ref "DirectUDPSocketOptions" :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "")
        (:name :initiator :type :ref :ref "Initiator" :items nil :optional t :doc ""))
  :doc "Fired upon direct_socket.UDPSocket creation." :experimental t :deprecated nil)

(define-domain-event direct-udp-socket-opened
  :method "Network.directUDPSocketOpened"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :local-addr :type :string :ref nil :items nil :optional nil :doc "")
        (:name :local-port :type :integer :ref nil :items nil :optional nil :doc "Expected to be unsigned integer.")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc "")
        (:name :remote-addr :type :string :ref nil :items nil :optional t :doc "")
        (:name :remote-port :type :integer :ref nil :items nil :optional t :doc "Expected to be unsigned integer."))
  :doc "Fired when direct_socket.UDPSocket connection is opened." :experimental t :deprecated nil)

(define-domain-event direct-udp-socket-aborted
  :method "Network.directUDPSocketAborted"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :error-message :type :string :ref nil :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired when direct_socket.UDPSocket is aborted." :experimental t :deprecated nil)

(define-domain-event direct-udp-socket-closed
  :method "Network.directUDPSocketClosed"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired when direct_socket.UDPSocket is closed." :experimental t :deprecated nil)

(define-domain-event direct-udp-socket-chunk-sent
  :method "Network.directUDPSocketChunkSent"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :message :type :ref :ref "DirectUDPMessage" :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired when message is sent to udp direct socket stream." :experimental t :deprecated nil)

(define-domain-event direct-udp-socket-chunk-received
  :method "Network.directUDPSocketChunkReceived"
  :params (
        (:name :identifier :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :message :type :ref :ref "DirectUDPMessage" :items nil :optional nil :doc "")
        (:name :timestamp :type :ref :ref "MonotonicTime" :items nil :optional nil :doc ""))
  :doc "Fired when message is received from udp direct socket stream." :experimental t :deprecated nil)

(define-domain-event request-will-be-sent-extra-info
  :method "Network.requestWillBeSentExtraInfo"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier. Used to match this information to an existing requestWillBeSent event.")
        (:name :associated-cookies :type :array :ref nil :items (:type :ref :ref "AssociatedCookie") :optional nil :doc "A list of cookies potentially associated to the requested URL. This includes both cookies sent with the request and the ones not sent; the latter are distinguished by having blockedReasons field set.")
        (:name :headers :type :ref :ref "Headers" :items nil :optional nil :doc "Raw request headers as they will be sent over the wire.")
        (:name :connect-timing :type :ref :ref "ConnectTiming" :items nil :optional nil :doc "Connection timing information for the request.")
        (:name :device-bound-session-usages :type :array :ref nil :items (:type :ref :ref "DeviceBoundSessionWithUsage") :optional t :doc "How the request site's device bound sessions were used during this request.")
        (:name :client-security-state :type :ref :ref "ClientSecurityState" :items nil :optional t :doc "The client security state set for the request.")
        (:name :site-has-cookie-in-other-partition :type :boolean :ref nil :items nil :optional t :doc "Whether the site has partitioned cookies stored in a partition different than the current one.")
        (:name :applied-network-conditions-id :type :string :ref nil :items nil :optional t :doc "The network conditions id if this request was affected by network conditions configured via emulateNetworkConditionsByRule."))
  :doc "Fired when additional information about a requestWillBeSent event is available from the network stack. Not every requestWillBeSent event will have an additional requestWillBeSentExtraInfo fired for it, and there is no guarantee whether requestWillBeSent or requestWillBeSentExtraInfo will be fired first for the same request." :experimental t :deprecated nil)

(define-domain-event response-received-extra-info
  :method "Network.responseReceivedExtraInfo"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier. Used to match this information to another responseReceived event.")
        (:name :blocked-cookies :type :array :ref nil :items (:type :ref :ref "BlockedSetCookieWithReason") :optional nil :doc "A list of cookies which were not stored from the response along with the corresponding reasons for blocking. The cookies here may not be valid due to syntax errors, which are represented by the invalid cookie line string instead of a proper cookie.")
        (:name :headers :type :ref :ref "Headers" :items nil :optional nil :doc "Raw response headers as they were received over the wire. Duplicate headers in the response are represented as a single key with their values concatentated using `\\n` as the separator. See also `headersText` that contains verbatim text for HTTP/1.*.")
        (:name :resource-ip-address-space :type :ref :ref "IPAddressSpace" :items nil :optional nil :doc "The IP address space of the resource. The address space can only be determined once the transport established the connection, so we can't send it in `requestWillBeSentExtraInfo`.")
        (:name :status-code :type :integer :ref nil :items nil :optional nil :doc "The status code of the response. This is useful in cases the request failed and no responseReceived event is triggered, which is the case for, e.g., CORS errors. This is also the correct status code for cached requests, where the status in responseReceived is a 200 and this will be 304.")
        (:name :headers-text :type :string :ref nil :items nil :optional t :doc "Raw response header text as it was received over the wire. The raw text may not always be available, such as in the case of HTTP/2 or QUIC.")
        (:name :cookie-partition-key :type :ref :ref "CookiePartitionKey" :items nil :optional t :doc "The cookie partition key that will be used to store partitioned cookies set in this response. Only sent when partitioned cookies are enabled.")
        (:name :cookie-partition-key-opaque :type :boolean :ref nil :items nil :optional t :doc "True if partitioned cookies are enabled, but the partition key is not serializable to string.")
        (:name :exempted-cookies :type :array :ref nil :items (:type :ref :ref "ExemptedSetCookieWithReason") :optional t :doc "A list of cookies which should have been blocked by 3PCD but are exempted and stored from the response with the corresponding reason."))
  :doc "Fired when additional information about a responseReceived event is available from the network stack. Not every responseReceived event will have an additional responseReceivedExtraInfo for it, and responseReceivedExtraInfo may be fired before or after responseReceived." :experimental t :deprecated nil)

(define-domain-event response-received-early-hints
  :method "Network.responseReceivedEarlyHints"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Request identifier. Used to match this information to another responseReceived event.")
        (:name :headers :type :ref :ref "Headers" :items nil :optional nil :doc "Raw response headers as they were received over the wire. Duplicate headers in the response are represented as a single key with their values concatentated using `\\n` as the separator. See also `headersText` that contains verbatim text for HTTP/1.*."))
  :doc "Fired when 103 Early Hints headers is received in addition to the common response. Not every responseReceived event will have an responseReceivedEarlyHints fired. Only one responseReceivedEarlyHints may be fired for eached responseReceived event." :experimental t :deprecated nil)

(define-domain-event trust-token-operation-done
  :method "Network.trustTokenOperationDone"
  :params (
        (:name :status :type :string :ref nil :items nil :optional nil :doc "Detailed success or error status of the operation. 'AlreadyExists' also signifies a successful operation, as the result of the operation already exists und thus, the operation was abort preemptively (e.g. a cache hit).")
        (:name :type :type :ref :ref "TrustTokenOperationType" :items nil :optional nil :doc "")
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "")
        (:name :top-level-origin :type :string :ref nil :items nil :optional t :doc "Top level origin. The context in which the operation was attempted.")
        (:name :issuer-origin :type :string :ref nil :items nil :optional t :doc "Origin of the issuer in case of a \"Issuance\" or \"Redemption\" operation.")
        (:name :issued-token-count :type :integer :ref nil :items nil :optional t :doc "The number of obtained Trust Tokens on a successful \"Issuance\" operation."))
  :doc "Fired exactly once for each Trust Token operation. Depending on the type of the operation and whether the operation succeeded or failed, the event is fired before the corresponding request was sent or after the response was received." :experimental t :deprecated nil)

(define-domain-event policy-updated
  :method "Network.policyUpdated"
  :params nil
  :doc "Fired once security policy has been updated." :experimental t :deprecated nil)

(define-domain-event reporting-api-report-added
  :method "Network.reportingApiReportAdded"
  :params (
        (:name :report :type :ref :ref "ReportingApiReport" :items nil :optional nil :doc ""))
  :doc "Is sent whenever a new report is added. And after 'enableReportingApi' for all existing reports." :experimental t :deprecated nil)

(define-domain-event reporting-api-report-updated
  :method "Network.reportingApiReportUpdated"
  :params (
        (:name :report :type :ref :ref "ReportingApiReport" :items nil :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-event reporting-api-endpoints-changed-for-origin
  :method "Network.reportingApiEndpointsChangedForOrigin"
  :params (
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin of the document(s) which configured the endpoints.")
        (:name :endpoints :type :array :ref nil :items (:type :ref :ref "ReportingApiEndpoint") :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-event device-bound-sessions-added
  :method "Network.deviceBoundSessionsAdded"
  :params (
        (:name :sessions :type :array :ref nil :items (:type :ref :ref "DeviceBoundSession") :optional nil :doc "The device bound sessions."))
  :doc "Triggered when the initial set of device bound sessions is added." :experimental t :deprecated nil)

(define-domain-event device-bound-session-event-occurred
  :method "Network.deviceBoundSessionEventOccurred"
  :params (
        (:name :event-id :type :ref :ref "DeviceBoundSessionEventId" :items nil :optional nil :doc "A unique identifier for this session event.")
        (:name :site :type :string :ref nil :items nil :optional nil :doc "The site this session event is associated with.")
        (:name :succeeded :type :boolean :ref nil :items nil :optional nil :doc "Whether this event was considered successful.")
        (:name :session-id :type :string :ref nil :items nil :optional t :doc "The session ID this event is associated with. May not be populated for failed events.")
        (:name :creation-event-details :type :ref :ref "CreationEventDetails" :items nil :optional t :doc "The below are the different session event type details. Exactly one is populated.")
        (:name :refresh-event-details :type :ref :ref "RefreshEventDetails" :items nil :optional t :doc "")
        (:name :termination-event-details :type :ref :ref "TerminationEventDetails" :items nil :optional t :doc "")
        (:name :challenge-event-details :type :ref :ref "ChallengeEventDetails" :items nil :optional t :doc ""))
  :doc "Triggered when a device bound session event occurs." :experimental t :deprecated nil)

