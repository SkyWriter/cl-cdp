;;;; WebAuthn CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/web-authn
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

(in-package #:cdp/web-authn)

(define-domain-type authenticator-id
  :cdp-id "AuthenticatorId" :type :string
  :properties nil
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type authenticator-protocol
  :cdp-id "AuthenticatorProtocol" :type :string
  :properties nil
  :enum '("u2f" "ctap2")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type ctap2-version
  :cdp-id "Ctap2Version" :type :string
  :properties nil
  :enum '("ctap2_0" "ctap2_1")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type authenticator-transport
  :cdp-id "AuthenticatorTransport" :type :string
  :properties nil
  :enum '("usb" "nfc" "ble" "cable" "internal")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type virtual-authenticator-options
  :cdp-id "VirtualAuthenticatorOptions" :type :object
  :properties (
        (:name :protocol :type :ref :ref "AuthenticatorProtocol" :items nil :optional nil :doc "")
        (:name :ctap2-version :type :ref :ref "Ctap2Version" :items nil :optional t :doc "Defaults to ctap2_0. Ignored if |protocol| == u2f.")
        (:name :transport :type :ref :ref "AuthenticatorTransport" :items nil :optional nil :doc "")
        (:name :has-resident-key :type :boolean :ref nil :items nil :optional t :doc "Defaults to false.")
        (:name :has-user-verification :type :boolean :ref nil :items nil :optional t :doc "Defaults to false.")
        (:name :has-large-blob :type :boolean :ref nil :items nil :optional t :doc "If set to true, the authenticator will support the largeBlob extension. https://w3c.github.io/webauthn#largeBlob Defaults to false.")
        (:name :has-cred-blob :type :boolean :ref nil :items nil :optional t :doc "If set to true, the authenticator will support the credBlob extension. https://fidoalliance.org/specs/fido-v2.1-rd-20201208/fido-client-to-authenticator-protocol-v2.1-rd-20201208.html#sctn-credBlob-extension Defaults to false.")
        (:name :has-min-pin-length :type :boolean :ref nil :items nil :optional t :doc "If set to true, the authenticator will support the minPinLength extension. https://fidoalliance.org/specs/fido-v2.1-ps-20210615/fido-client-to-authenticator-protocol-v2.1-ps-20210615.html#sctn-minpinlength-extension Defaults to false.")
        (:name :has-prf :type :boolean :ref nil :items nil :optional t :doc "If set to true, the authenticator will support the prf extension. https://w3c.github.io/webauthn/#prf-extension Defaults to false.")
        (:name :automatic-presence-simulation :type :boolean :ref nil :items nil :optional t :doc "If set to true, tests of user presence will succeed immediately. Otherwise, they will not be resolved. Defaults to true.")
        (:name :is-user-verified :type :boolean :ref nil :items nil :optional t :doc "Sets whether User Verification succeeds or fails for an authenticator. Defaults to false.")
        (:name :default-backup-eligibility :type :boolean :ref nil :items nil :optional t :doc "Credentials created by this authenticator will have the backup eligibility (BE) flag set to this value. Defaults to false. https://w3c.github.io/webauthn/#sctn-credential-backup")
        (:name :default-backup-state :type :boolean :ref nil :items nil :optional t :doc "Credentials created by this authenticator will have the backup state (BS) flag set to this value. Defaults to false. https://w3c.github.io/webauthn/#sctn-credential-backup"))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type credential
  :cdp-id "Credential" :type :object
  :properties (
        (:name :credential-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :is-resident-credential :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :rp-id :type :string :ref nil :items nil :optional t :doc "Relying Party ID the credential is scoped to. Must be set when adding a credential.")
        (:name :private-key :type :string :ref nil :items nil :optional nil :doc "The ECDSA P-256 private key in PKCS#8 format. (Encoded as a base64 string when passed over JSON)")
        (:name :user-handle :type :string :ref nil :items nil :optional t :doc "An opaque byte sequence with a maximum size of 64 bytes mapping the credential to a specific user. (Encoded as a base64 string when passed over JSON)")
        (:name :sign-count :type :integer :ref nil :items nil :optional nil :doc "Signature counter. This is incremented by one for each successful assertion. See https://w3c.github.io/webauthn/#signature-counter")
        (:name :large-blob :type :string :ref nil :items nil :optional t :doc "The large blob associated with the credential. See https://w3c.github.io/webauthn/#sctn-large-blob-extension (Encoded as a base64 string when passed over JSON)")
        (:name :backup-eligibility :type :boolean :ref nil :items nil :optional t :doc "Assertions returned by this credential will have the backup eligibility (BE) flag set to this value. Defaults to the authenticator's defaultBackupEligibility value.")
        (:name :backup-state :type :boolean :ref nil :items nil :optional t :doc "Assertions returned by this credential will have the backup state (BS) flag set to this value. Defaults to the authenticator's defaultBackupState value.")
        (:name :user-name :type :string :ref nil :items nil :optional t :doc "The credential's user.name property. Equivalent to empty if not set. https://w3c.github.io/webauthn/#dom-publickeycredentialentity-name")
        (:name :user-display-name :type :string :ref nil :items nil :optional t :doc "The credential's user.displayName property. Equivalent to empty if not set. https://w3c.github.io/webauthn/#dom-publickeycredentialuserentity-displayname"))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "WebAuthn.enable"
  :params (
        (:name :enable-ui :type :boolean :ref nil :items nil :optional t :doc "Whether to enable the WebAuthn user interface. Enabling the UI is recommended for debugging and demo purposes, as it is closer to the real experience. Disabling the UI is recommended for automated testing. Supported at the embedder's discretion if UI is available. Defaults to false."))
  :returns nil
  :doc "Enable the WebAuthn domain and start intercepting credential storage and retrieval with a virtual authenticator." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "WebAuthn.disable"
  :params nil
  :returns nil
  :doc "Disable the WebAuthn domain." :experimental nil :deprecated nil)

(define-domain-command add-virtual-authenticator
  :method "WebAuthn.addVirtualAuthenticator"
  :params (
        (:name :options :type :ref :ref "VirtualAuthenticatorOptions" :items nil :optional nil :doc ""))
  :returns (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc ""))
  :doc "Creates and adds a virtual authenticator." :experimental nil :deprecated nil)

(define-domain-command set-response-override-bits
  :method "WebAuthn.setResponseOverrideBits"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :is-bogus-signature :type :boolean :ref nil :items nil :optional t :doc "If isBogusSignature is set, overrides the signature in the authenticator response to be zero. Defaults to false.")
        (:name :is-bad-uv :type :boolean :ref nil :items nil :optional t :doc "If isBadUV is set, overrides the UV bit in the flags in the authenticator response to be zero. Defaults to false.")
        (:name :is-bad-up :type :boolean :ref nil :items nil :optional t :doc "If isBadUP is set, overrides the UP bit in the flags in the authenticator response to be zero. Defaults to false."))
  :returns nil
  :doc "Resets parameters isBogusSignature, isBadUV, isBadUP to false if they are not present." :experimental nil :deprecated nil)

(define-domain-command remove-virtual-authenticator
  :method "WebAuthn.removeVirtualAuthenticator"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Removes the given authenticator." :experimental nil :deprecated nil)

(define-domain-command add-credential
  :method "WebAuthn.addCredential"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :credential :type :ref :ref "Credential" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Adds the credential to the specified authenticator." :experimental nil :deprecated nil)

(define-domain-command get-credential
  :method "WebAuthn.getCredential"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :credential-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :credential :type :ref :ref "Credential" :items nil :optional nil :doc ""))
  :doc "Returns a single credential stored in the given virtual authenticator that matches the credential ID." :experimental nil :deprecated nil)

(define-domain-command get-credentials
  :method "WebAuthn.getCredentials"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc ""))
  :returns (
        (:name :credentials :type :array :ref nil :items (:type :ref :ref "Credential") :optional nil :doc ""))
  :doc "Returns all the credentials stored in the given virtual authenticator." :experimental nil :deprecated nil)

(define-domain-command remove-credential
  :method "WebAuthn.removeCredential"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :credential-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Removes a credential from the authenticator." :experimental nil :deprecated nil)

(define-domain-command clear-credentials
  :method "WebAuthn.clearCredentials"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Clears all the credentials from the specified device." :experimental nil :deprecated nil)

(define-domain-command set-user-verified
  :method "WebAuthn.setUserVerified"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :is-user-verified :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Sets whether User Verification succeeds or fails for an authenticator. The default is true." :experimental nil :deprecated nil)

(define-domain-command set-automatic-presence-simulation
  :method "WebAuthn.setAutomaticPresenceSimulation"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Sets whether tests of user presence will succeed immediately (if true) or fail to resolve (if false) for an authenticator. The default is true." :experimental nil :deprecated nil)

(define-domain-command set-credential-properties
  :method "WebAuthn.setCredentialProperties"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :credential-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :backup-eligibility :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :backup-state :type :boolean :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "Allows setting credential properties. https://w3c.github.io/webauthn/#sctn-automation-set-credential-properties" :experimental nil :deprecated nil)

(define-domain-event credential-added
  :method "WebAuthn.credentialAdded"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :credential :type :ref :ref "Credential" :items nil :optional nil :doc ""))
  :doc "Triggered when a credential is added to an authenticator." :experimental nil :deprecated nil)

(define-domain-event credential-deleted
  :method "WebAuthn.credentialDeleted"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :credential-id :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "Triggered when a credential is deleted, e.g. through PublicKeyCredential.signalUnknownCredential()." :experimental nil :deprecated nil)

(define-domain-event credential-updated
  :method "WebAuthn.credentialUpdated"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :credential :type :ref :ref "Credential" :items nil :optional nil :doc ""))
  :doc "Triggered when a credential is updated, e.g. through PublicKeyCredential.signalCurrentUserDetails()." :experimental nil :deprecated nil)

(define-domain-event credential-asserted
  :method "WebAuthn.credentialAsserted"
  :params (
        (:name :authenticator-id :type :ref :ref "AuthenticatorId" :items nil :optional nil :doc "")
        (:name :credential :type :ref :ref "Credential" :items nil :optional nil :doc ""))
  :doc "Triggered when a credential is used in a webauthn assertion." :experimental nil :deprecated nil)

