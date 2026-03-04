;;;; Security CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/security
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

(in-package #:cdp/security)

(define-domain-type certificate-id
  :cdp-id "CertificateId" :type :integer
  :properties nil
  :enum nil
  :doc "An internal certificate ID value." :experimental nil :deprecated nil)

(define-domain-type mixed-content-type
  :cdp-id "MixedContentType" :type :string
  :properties nil
  :enum '("blockable" "optionally-blockable" "none")
  :doc "A description of mixed content (HTTP resources on HTTPS pages), as defined by https://www.w3.org/TR/mixed-content/#categories" :experimental nil :deprecated nil)

(define-domain-type security-state
  :cdp-id "SecurityState" :type :string
  :properties nil
  :enum '("unknown" "neutral" "insecure" "secure" "info" "insecure-broken")
  :doc "The security level of a page or resource." :experimental nil :deprecated nil)

(define-domain-type certificate-security-state
  :cdp-id "CertificateSecurityState" :type :object
  :properties (
        (:name :protocol :type :string :ref nil :items nil :optional nil :doc "Protocol name (e.g. \"TLS 1.2\" or \"QUIC\").")
        (:name :key-exchange :type :string :ref nil :items nil :optional nil :doc "Key Exchange used by the connection, or the empty string if not applicable.")
        (:name :key-exchange-group :type :string :ref nil :items nil :optional t :doc "(EC)DH group used by the connection, if applicable.")
        (:name :cipher :type :string :ref nil :items nil :optional nil :doc "Cipher name.")
        (:name :mac :type :string :ref nil :items nil :optional t :doc "TLS MAC. Note that AEAD ciphers do not have separate MACs.")
        (:name :certificate :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Page certificate.")
        (:name :subject-name :type :string :ref nil :items nil :optional nil :doc "Certificate subject name.")
        (:name :issuer :type :string :ref nil :items nil :optional nil :doc "Name of the issuing CA.")
        (:name :valid-from :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "Certificate valid from date.")
        (:name :valid-to :type :ref :ref "Network.TimeSinceEpoch" :items nil :optional nil :doc "Certificate valid to (expiration) date")
        (:name :certificate-network-error :type :string :ref nil :items nil :optional t :doc "The highest priority network error code, if the certificate has an error.")
        (:name :certificate-has-weak-signature :type :boolean :ref nil :items nil :optional nil :doc "True if the certificate uses a weak signature algorithm.")
        (:name :certificate-has-sha1-signature :type :boolean :ref nil :items nil :optional nil :doc "True if the certificate has a SHA1 signature in the chain.")
        (:name :modern-ssl :type :boolean :ref nil :items nil :optional nil :doc "True if modern SSL")
        (:name :obsolete-ssl-protocol :type :boolean :ref nil :items nil :optional nil :doc "True if the connection is using an obsolete SSL protocol.")
        (:name :obsolete-ssl-key-exchange :type :boolean :ref nil :items nil :optional nil :doc "True if the connection is using an obsolete SSL key exchange.")
        (:name :obsolete-ssl-cipher :type :boolean :ref nil :items nil :optional nil :doc "True if the connection is using an obsolete SSL cipher.")
        (:name :obsolete-ssl-signature :type :boolean :ref nil :items nil :optional nil :doc "True if the connection is using an obsolete SSL signature."))
  :enum nil
  :doc "Details about the security state of the page certificate." :experimental t :deprecated nil)

(define-domain-type safety-tip-status
  :cdp-id "SafetyTipStatus" :type :string
  :properties nil
  :enum '("badReputation" "lookalike")
  :doc "" :experimental t :deprecated nil)

(define-domain-type safety-tip-info
  :cdp-id "SafetyTipInfo" :type :object
  :properties (
        (:name :safety-tip-status :type :ref :ref "SafetyTipStatus" :items nil :optional nil :doc "Describes whether the page triggers any safety tips or reputation warnings. Default is unknown.")
        (:name :safe-url :type :string :ref nil :items nil :optional t :doc "The URL the safety tip suggested (\"Did you mean?\"). Only filled in for lookalike matches."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type visible-security-state
  :cdp-id "VisibleSecurityState" :type :object
  :properties (
        (:name :security-state :type :ref :ref "SecurityState" :items nil :optional nil :doc "The security level of the page.")
        (:name :certificate-security-state :type :ref :ref "CertificateSecurityState" :items nil :optional t :doc "Security state details about the page certificate.")
        (:name :safety-tip-info :type :ref :ref "SafetyTipInfo" :items nil :optional t :doc "The type of Safety Tip triggered on the page. Note that this field will be set even if the Safety Tip UI was not actually shown.")
        (:name :security-state-issue-ids :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Array of security state issues ids."))
  :enum nil
  :doc "Security state information about the page." :experimental t :deprecated nil)

(define-domain-type security-state-explanation
  :cdp-id "SecurityStateExplanation" :type :object
  :properties (
        (:name :security-state :type :ref :ref "SecurityState" :items nil :optional nil :doc "Security state representing the severity of the factor being explained.")
        (:name :title :type :string :ref nil :items nil :optional nil :doc "Title describing the type of factor.")
        (:name :summary :type :string :ref nil :items nil :optional nil :doc "Short phrase describing the type of factor.")
        (:name :description :type :string :ref nil :items nil :optional nil :doc "Full text explanation of the factor.")
        (:name :mixed-content-type :type :ref :ref "MixedContentType" :items nil :optional nil :doc "The type of mixed content described by the explanation.")
        (:name :certificate :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Page certificate.")
        (:name :recommendations :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Recommendations to fix any issues."))
  :enum nil
  :doc "An explanation of an factor contributing to the security state." :experimental nil :deprecated nil)

(define-domain-type insecure-content-status
  :cdp-id "InsecureContentStatus" :type :object
  :properties (
        (:name :ran-mixed-content :type :boolean :ref nil :items nil :optional nil :doc "Always false.")
        (:name :displayed-mixed-content :type :boolean :ref nil :items nil :optional nil :doc "Always false.")
        (:name :contained-mixed-form :type :boolean :ref nil :items nil :optional nil :doc "Always false.")
        (:name :ran-content-with-cert-errors :type :boolean :ref nil :items nil :optional nil :doc "Always false.")
        (:name :displayed-content-with-cert-errors :type :boolean :ref nil :items nil :optional nil :doc "Always false.")
        (:name :ran-insecure-content-style :type :ref :ref "SecurityState" :items nil :optional nil :doc "Always set to unknown.")
        (:name :displayed-insecure-content-style :type :ref :ref "SecurityState" :items nil :optional nil :doc "Always set to unknown."))
  :enum nil
  :doc "Information about insecure content on the page." :experimental nil :deprecated t)

(define-domain-type certificate-error-action
  :cdp-id "CertificateErrorAction" :type :string
  :properties nil
  :enum '("continue" "cancel")
  :doc "The action to take when a certificate error occurs. continue will continue processing the request and cancel will cancel the request." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Security.disable"
  :params nil
  :returns nil
  :doc "Disables tracking security state changes." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Security.enable"
  :params nil
  :returns nil
  :doc "Enables tracking security state changes." :experimental nil :deprecated nil)

(define-domain-command set-ignore-certificate-errors
  :method "Security.setIgnoreCertificateErrors"
  :params (
        (:name :ignore :type :boolean :ref nil :items nil :optional nil :doc "If true, all certificate errors will be ignored."))
  :returns nil
  :doc "Enable/disable whether all certificate errors should be ignored." :experimental nil :deprecated nil)

(define-domain-command handle-certificate-error
  :method "Security.handleCertificateError"
  :params (
        (:name :event-id :type :integer :ref nil :items nil :optional nil :doc "The ID of the event.")
        (:name :action :type :ref :ref "CertificateErrorAction" :items nil :optional nil :doc "The action to take on the certificate error."))
  :returns nil
  :doc "Handles a certificate error that fired a certificateError event." :experimental nil :deprecated t)

(define-domain-command set-override-certificate-errors
  :method "Security.setOverrideCertificateErrors"
  :params (
        (:name :override :type :boolean :ref nil :items nil :optional nil :doc "If true, certificate errors will be overridden."))
  :returns nil
  :doc "Enable/disable overriding certificate errors. If enabled, all certificate error events need to be handled by the DevTools client and should be answered with `handleCertificateError` commands." :experimental nil :deprecated t)

(define-domain-event certificate-error
  :method "Security.certificateError"
  :params (
        (:name :event-id :type :integer :ref nil :items nil :optional nil :doc "The ID of the event.")
        (:name :error-type :type :string :ref nil :items nil :optional nil :doc "The type of the error.")
        (:name :request-url :type :string :ref nil :items nil :optional nil :doc "The url that was requested."))
  :doc "There is a certificate error. If overriding certificate errors is enabled, then it should be handled with the `handleCertificateError` command. Note: this event does not fire if the certificate error has been allowed internally. Only one client per target should override certificate errors at the same time." :experimental nil :deprecated t)

(define-domain-event visible-security-state-changed
  :method "Security.visibleSecurityStateChanged"
  :params (
        (:name :visible-security-state :type :ref :ref "VisibleSecurityState" :items nil :optional nil :doc "Security state information about the page."))
  :doc "The security state of the page changed." :experimental t :deprecated nil)

(define-domain-event security-state-changed
  :method "Security.securityStateChanged"
  :params (
        (:name :security-state :type :ref :ref "SecurityState" :items nil :optional nil :doc "Security state.")
        (:name :scheme-is-cryptographic :type :boolean :ref nil :items nil :optional nil :doc "True if the page was loaded over cryptographic transport such as HTTPS.")
        (:name :explanations :type :array :ref nil :items (:type :ref :ref "SecurityStateExplanation") :optional nil :doc "Previously a list of explanations for the security state. Now always empty.")
        (:name :insecure-content-status :type :ref :ref "InsecureContentStatus" :items nil :optional nil :doc "Information about insecure content on the page.")
        (:name :summary :type :string :ref nil :items nil :optional t :doc "Overrides user-visible description of the state. Always omitted."))
  :doc "The security state of the page changed. No longer being sent." :experimental nil :deprecated t)

