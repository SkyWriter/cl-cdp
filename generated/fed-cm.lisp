;;;; FedCm CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/fed-cm
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

(in-package #:cdp/fed-cm)

(define-domain-type login-state
  :cdp-id "LoginState" :type :string
  :properties nil
  :enum '("SignIn" "SignUp")
  :doc "Whether this is a sign-up or sign-in action for this account, i.e. whether this account has ever been used to sign in to this RP before." :experimental nil :deprecated nil)

(define-domain-type dialog-type
  :cdp-id "DialogType" :type :string
  :properties nil
  :enum '("AccountChooser" "AutoReauthn" "ConfirmIdpLogin" "Error")
  :doc "The types of FedCM dialogs." :experimental nil :deprecated nil)

(define-domain-type dialog-button
  :cdp-id "DialogButton" :type :string
  :properties nil
  :enum '("ConfirmIdpLoginContinue" "ErrorGotIt" "ErrorMoreDetails")
  :doc "The buttons on the FedCM dialog." :experimental nil :deprecated nil)

(define-domain-type account-url-type
  :cdp-id "AccountUrlType" :type :string
  :properties nil
  :enum '("TermsOfService" "PrivacyPolicy")
  :doc "The URLs that each account has" :experimental nil :deprecated nil)

(define-domain-type account
  :cdp-id "Account" :type :object
  :properties (
        (:name :account-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :email :type :string :ref nil :items nil :optional nil :doc "")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :given-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :picture-url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :idp-config-url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :idp-login-url :type :string :ref nil :items nil :optional nil :doc "")
        (:name :login-state :type :ref :ref "LoginState" :items nil :optional nil :doc "")
        (:name :terms-of-service-url :type :string :ref nil :items nil :optional t :doc "These two are only set if the loginState is signUp")
        (:name :privacy-policy-url :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "Corresponds to IdentityRequestAccount" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "FedCm.enable"
  :params (
        (:name :disable-rejection-delay :type :boolean :ref nil :items nil :optional t :doc "Allows callers to disable the promise rejection delay that would normally happen, if this is unimportant to what's being tested. (step 4 of https://fedidcg.github.io/FedCM/#browser-api-rp-sign-in)"))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "FedCm.disable"
  :params nil
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command select-account
  :method "FedCm.selectAccount"
  :params (
        (:name :dialog-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :account-index :type :integer :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command click-dialog-button
  :method "FedCm.clickDialogButton"
  :params (
        (:name :dialog-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :dialog-button :type :ref :ref "DialogButton" :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command open-url
  :method "FedCm.openUrl"
  :params (
        (:name :dialog-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :account-index :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :account-url-type :type :ref :ref "AccountUrlType" :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command dismiss-dialog
  :method "FedCm.dismissDialog"
  :params (
        (:name :dialog-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :trigger-cooldown :type :boolean :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command reset-cooldown
  :method "FedCm.resetCooldown"
  :params nil
  :returns nil
  :doc "Resets the cooldown time, if any, to allow the next FedCM call to show a dialog even if one was recently dismissed by the user." :experimental nil :deprecated nil)

(define-domain-event dialog-shown
  :method "FedCm.dialogShown"
  :params (
        (:name :dialog-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :dialog-type :type :ref :ref "DialogType" :items nil :optional nil :doc "")
        (:name :accounts :type :array :ref nil :items (:type :ref :ref "Account") :optional nil :doc "")
        (:name :title :type :string :ref nil :items nil :optional nil :doc "These exist primarily so that the caller can verify the RP context was used appropriately.")
        (:name :subtitle :type :string :ref nil :items nil :optional t :doc ""))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event dialog-closed
  :method "FedCm.dialogClosed"
  :params (
        (:name :dialog-id :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "Triggered when a dialog is closed, either by user action, JS abort, or a command below." :experimental nil :deprecated nil)

