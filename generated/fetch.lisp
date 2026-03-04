;;;; Fetch CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/fetch
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

(in-package #:cdp/fetch)

(define-domain-type request-id
  :cdp-id "RequestId" :type :string
  :properties nil
  :enum nil
  :doc "Unique request identifier. Note that this does not identify individual HTTP requests that are part of a network request." :experimental nil :deprecated nil)

(define-domain-type request-stage
  :cdp-id "RequestStage" :type :string
  :properties nil
  :enum '("Request" "Response")
  :doc "Stages of the request to handle. Request will intercept before the request is sent. Response will intercept after the response is received (but before response body is received)." :experimental nil :deprecated nil)

(define-domain-type request-pattern
  :cdp-id "RequestPattern" :type :object
  :properties (
        (:name :url-pattern :type :string :ref nil :items nil :optional t :doc "Wildcards (`'*'` -> zero or more, `'?'` -> exactly one) are allowed. Escape character is backslash. Omitting is equivalent to `\"*\"`.")
        (:name :resource-type :type :ref :ref "Network.ResourceType" :items nil :optional t :doc "If set, only requests for matching resource types will be intercepted.")
        (:name :request-stage :type :ref :ref "RequestStage" :items nil :optional t :doc "Stage at which to begin intercepting requests. Default is Request."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type header-entry
  :cdp-id "HeaderEntry" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Response HTTP header entry" :experimental nil :deprecated nil)

(define-domain-type auth-challenge
  :cdp-id "AuthChallenge" :type :object
  :properties (
        (:name :source :type :string :ref nil :items nil :optional t :doc "Source of the authentication challenge.")
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Origin of the challenger.")
        (:name :scheme :type :string :ref nil :items nil :optional nil :doc "The authentication scheme used, such as basic or digest")
        (:name :realm :type :string :ref nil :items nil :optional nil :doc "The realm of the challenge. May be empty."))
  :enum nil
  :doc "Authorization challenge for HTTP status code 401 or 407." :experimental nil :deprecated nil)

(define-domain-type auth-challenge-response
  :cdp-id "AuthChallengeResponse" :type :object
  :properties (
        (:name :response :type :string :ref nil :items nil :optional nil :doc "The decision on what to do in response to the authorization challenge.  Default means deferring to the default behavior of the net stack, which will likely either the Cancel authentication or display a popup dialog box.")
        (:name :username :type :string :ref nil :items nil :optional t :doc "The username to provide, possibly empty. Should only be set if response is ProvideCredentials.")
        (:name :password :type :string :ref nil :items nil :optional t :doc "The password to provide, possibly empty. Should only be set if response is ProvideCredentials."))
  :enum nil
  :doc "Response to an AuthChallenge." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Fetch.disable"
  :params nil
  :returns nil
  :doc "Disables the fetch domain." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Fetch.enable"
  :params (
        (:name :patterns :type :array :ref nil :items (:type :ref :ref "RequestPattern") :optional t :doc "If specified, only requests matching any of these patterns will produce fetchRequested event and will be paused until clients response. If not set, all requests will be affected.")
        (:name :handle-auth-requests :type :boolean :ref nil :items nil :optional t :doc "If true, authRequired events will be issued and requests will be paused expecting a call to continueWithAuth."))
  :returns nil
  :doc "Enables issuing of requestPaused events. A request will be paused until client calls one of failRequest, fulfillRequest or continueRequest/continueWithAuth." :experimental nil :deprecated nil)

(define-domain-command fail-request
  :method "Fetch.failRequest"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "An id the client received in requestPaused event.")
        (:name :error-reason :type :ref :ref "Network.ErrorReason" :items nil :optional nil :doc "Causes the request to fail with the given reason."))
  :returns nil
  :doc "Causes the request to fail with specified reason." :experimental nil :deprecated nil)

(define-domain-command fulfill-request
  :method "Fetch.fulfillRequest"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "An id the client received in requestPaused event.")
        (:name :response-code :type :integer :ref nil :items nil :optional nil :doc "An HTTP response code.")
        (:name :response-headers :type :array :ref nil :items (:type :ref :ref "HeaderEntry") :optional t :doc "Response headers.")
        (:name :binary-response-headers :type :string :ref nil :items nil :optional t :doc "Alternative way of specifying response headers as a \\0-separated series of name: value pairs. Prefer the above method unless you need to represent some non-UTF8 values that can't be transmitted over the protocol as text. (Encoded as a base64 string when passed over JSON)")
        (:name :body :type :string :ref nil :items nil :optional t :doc "A response body. If absent, original response body will be used if the request is intercepted at the response stage and empty body will be used if the request is intercepted at the request stage. (Encoded as a base64 string when passed over JSON)")
        (:name :response-phrase :type :string :ref nil :items nil :optional t :doc "A textual representation of responseCode. If absent, a standard phrase matching responseCode is used."))
  :returns nil
  :doc "Provides response to the request." :experimental nil :deprecated nil)

(define-domain-command continue-request
  :method "Fetch.continueRequest"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "An id the client received in requestPaused event.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "If set, the request url will be modified in a way that's not observable by page.")
        (:name :method :type :string :ref nil :items nil :optional t :doc "If set, the request method is overridden.")
        (:name :post-data :type :string :ref nil :items nil :optional t :doc "If set, overrides the post data in the request. (Encoded as a base64 string when passed over JSON)")
        (:name :headers :type :array :ref nil :items (:type :ref :ref "HeaderEntry") :optional t :doc "If set, overrides the request headers. Note that the overrides do not extend to subsequent redirect hops, if a redirect happens. Another override may be applied to a different request produced by a redirect.")
        (:name :intercept-response :type :boolean :ref nil :items nil :optional t :doc "If set, overrides response interception behavior for this request."))
  :returns nil
  :doc "Continues the request, optionally modifying some of its parameters." :experimental nil :deprecated nil)

(define-domain-command continue-with-auth
  :method "Fetch.continueWithAuth"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "An id the client received in authRequired event.")
        (:name :auth-challenge-response :type :ref :ref "AuthChallengeResponse" :items nil :optional nil :doc "Response to  with an authChallenge."))
  :returns nil
  :doc "Continues a request supplying authChallengeResponse following authRequired event." :experimental nil :deprecated nil)

(define-domain-command continue-response
  :method "Fetch.continueResponse"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "An id the client received in requestPaused event.")
        (:name :response-code :type :integer :ref nil :items nil :optional t :doc "An HTTP response code. If absent, original response code will be used.")
        (:name :response-phrase :type :string :ref nil :items nil :optional t :doc "A textual representation of responseCode. If absent, a standard phrase matching responseCode is used.")
        (:name :response-headers :type :array :ref nil :items (:type :ref :ref "HeaderEntry") :optional t :doc "Response headers. If absent, original response headers will be used.")
        (:name :binary-response-headers :type :string :ref nil :items nil :optional t :doc "Alternative way of specifying response headers as a \\0-separated series of name: value pairs. Prefer the above method unless you need to represent some non-UTF8 values that can't be transmitted over the protocol as text. (Encoded as a base64 string when passed over JSON)"))
  :returns nil
  :doc "Continues loading of the paused response, optionally modifying the response headers. If either responseCode or headers are modified, all of them must be present." :experimental t :deprecated nil)

(define-domain-command get-response-body
  :method "Fetch.getResponseBody"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Identifier for the intercepted request to get body for."))
  :returns (
        (:name :body :type :string :ref nil :items nil :optional nil :doc "Response body.")
        (:name :base64-encoded :type :boolean :ref nil :items nil :optional nil :doc "True, if content was sent as base64."))
  :doc "Causes the body of the response to be received from the server and returned as a single string. May only be issued for a request that is paused in the Response stage and is mutually exclusive with takeResponseBodyForInterceptionAsStream. Calling other methods that affect the request or disabling fetch domain before body is received results in an undefined behavior. Note that the response body is not available for redirects. Requests paused in the _redirect received_ state may be differentiated by `responseCode` and presence of `location` response header, see comments to `requestPaused` for details." :experimental nil :deprecated nil)

(define-domain-command take-response-body-as-stream
  :method "Fetch.takeResponseBodyAsStream"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc ""))
  :returns (
        (:name :stream :type :ref :ref "IO.StreamHandle" :items nil :optional nil :doc ""))
  :doc "Returns a handle to the stream representing the response body. The request must be paused in the HeadersReceived stage. Note that after this command the request can't be continued as is -- client either needs to cancel it or to provide the response body. The stream only supports sequential read, IO.read will fail if the position is specified. This method is mutually exclusive with getResponseBody. Calling other methods that affect the request or disabling fetch domain before body is received results in an undefined behavior." :experimental nil :deprecated nil)

(define-domain-event request-paused
  :method "Fetch.requestPaused"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Each request the page makes will have a unique id.")
        (:name :request :type :ref :ref "Network.Request" :items nil :optional nil :doc "The details of the request.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "The id of the frame that initiated the request.")
        (:name :resource-type :type :ref :ref "Network.ResourceType" :items nil :optional nil :doc "How the requested resource will be used.")
        (:name :response-error-reason :type :ref :ref "Network.ErrorReason" :items nil :optional t :doc "Response error if intercepted at response stage.")
        (:name :response-status-code :type :integer :ref nil :items nil :optional t :doc "Response code if intercepted at response stage.")
        (:name :response-status-text :type :string :ref nil :items nil :optional t :doc "Response status text if intercepted at response stage.")
        (:name :response-headers :type :array :ref nil :items (:type :ref :ref "HeaderEntry") :optional t :doc "Response headers if intercepted at the response stage.")
        (:name :network-id :type :ref :ref "Network.RequestId" :items nil :optional t :doc "If the intercepted request had a corresponding Network.requestWillBeSent event fired for it, then this networkId will be the same as the requestId present in the requestWillBeSent event.")
        (:name :redirected-request-id :type :ref :ref "RequestId" :items nil :optional t :doc "If the request is due to a redirect response from the server, the id of the request that has caused the redirect."))
  :doc "Issued when the domain is enabled and the request URL matches the specified filter. The request is paused until the client responds with one of continueRequest, failRequest or fulfillRequest. The stage of the request can be determined by presence of responseErrorReason and responseStatusCode -- the request is at the response stage if either of these fields is present and in the request stage otherwise. Redirect responses and subsequent requests are reported similarly to regular responses and requests. Redirect responses may be distinguished by the value of `responseStatusCode` (which is one of 301, 302, 303, 307, 308) along with presence of the `location` header. Requests resulting from a redirect will have `redirectedRequestId` field set." :experimental nil :deprecated nil)

(define-domain-event auth-required
  :method "Fetch.authRequired"
  :params (
        (:name :request-id :type :ref :ref "RequestId" :items nil :optional nil :doc "Each request the page makes will have a unique id.")
        (:name :request :type :ref :ref "Network.Request" :items nil :optional nil :doc "The details of the request.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "The id of the frame that initiated the request.")
        (:name :resource-type :type :ref :ref "Network.ResourceType" :items nil :optional nil :doc "How the requested resource will be used.")
        (:name :auth-challenge :type :ref :ref "AuthChallenge" :items nil :optional nil :doc "Details of the Authorization Challenge encountered. If this is set, client should respond with continueRequest that contains AuthChallengeResponse."))
  :doc "Issued when the domain is enabled with handleAuthRequests set to true. The request is paused until client responds with continueWithAuth." :experimental nil :deprecated nil)

