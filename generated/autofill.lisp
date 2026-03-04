;;;; Autofill CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/autofill
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

(in-package #:cdp/autofill)

(define-domain-type credit-card
  :cdp-id "CreditCard" :type :object
  :properties (
        (:name :number :type :string :ref nil :items nil :optional nil :doc "16-digit credit card number.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Name of the credit card owner.")
        (:name :expiry-month :type :string :ref nil :items nil :optional nil :doc "2-digit expiry month.")
        (:name :expiry-year :type :string :ref nil :items nil :optional nil :doc "4-digit expiry year.")
        (:name :cvc :type :string :ref nil :items nil :optional nil :doc "3-digit card verification code."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type address-field
  :cdp-id "AddressField" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "address field name, for example GIVEN_NAME. The full list of supported field names: https://source.chromium.org/chromium/chromium/src/+/main:components/autofill/core/browser/field_types.cc;l=38")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "address field value, for example Jon Doe."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type address-fields
  :cdp-id "AddressFields" :type :object
  :properties (
        (:name :fields :type :array :ref nil :items (:type :ref :ref "AddressField") :optional nil :doc ""))
  :enum nil
  :doc "A list of address fields." :experimental nil :deprecated nil)

(define-domain-type address
  :cdp-id "Address" :type :object
  :properties (
        (:name :fields :type :array :ref nil :items (:type :ref :ref "AddressField") :optional nil :doc "fields and values defining an address."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type address-ui
  :cdp-id "AddressUI" :type :object
  :properties (
        (:name :address-fields :type :array :ref nil :items (:type :ref :ref "AddressFields") :optional nil :doc "A two dimension array containing the representation of values from an address profile."))
  :enum nil
  :doc "Defines how an address can be displayed like in chrome://settings/addresses. Address UI is a two dimensional array, each inner array is an \"address information line\", and when rendered in a UI surface should be displayed as such. The following address UI for instance: [[{name: \"GIVE_NAME\", value: \"Jon\"}, {name: \"FAMILY_NAME\", value: \"Doe\"}], [{name: \"CITY\", value: \"Munich\"}, {name: \"ZIP\", value: \"81456\"}]] should allow the receiver to render: Jon Doe Munich 81456" :experimental nil :deprecated nil)

(define-domain-type filling-strategy
  :cdp-id "FillingStrategy" :type :string
  :properties nil
  :enum '("autocompleteAttribute" "autofillInferred")
  :doc "Specified whether a filled field was done so by using the html autocomplete attribute or autofill heuristics." :experimental nil :deprecated nil)

(define-domain-type filled-field
  :cdp-id "FilledField" :type :object
  :properties (
        (:name :html-type :type :string :ref nil :items nil :optional nil :doc "The type of the field, e.g text, password etc.")
        (:name :id :type :string :ref nil :items nil :optional nil :doc "the html id")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "the html name")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "the field value")
        (:name :autofill-type :type :string :ref nil :items nil :optional nil :doc "The actual field type, e.g FAMILY_NAME")
        (:name :filling-strategy :type :ref :ref "FillingStrategy" :items nil :optional nil :doc "The filling strategy")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "The frame the field belongs to")
        (:name :field-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "The form field's DOM node"))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command trigger
  :method "Autofill.trigger"
  :params (
        (:name :field-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "Identifies a field that serves as an anchor for autofill.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "Identifies the frame that field belongs to.")
        (:name :card :type :ref :ref "CreditCard" :items nil :optional t :doc "Credit card information to fill out the form. Credit card data is not saved.  Mutually exclusive with `address`.")
        (:name :address :type :ref :ref "Address" :items nil :optional t :doc "Address to fill out the form. Address data is not saved. Mutually exclusive with `card`."))
  :returns nil
  :doc "Trigger autofill on a form identified by the fieldId. If the field and related form cannot be autofilled, returns an error." :experimental nil :deprecated nil)

(define-domain-command set-addresses
  :method "Autofill.setAddresses"
  :params (
        (:name :addresses :type :array :ref nil :items (:type :ref :ref "Address") :optional nil :doc ""))
  :returns nil
  :doc "Set addresses so that developers can verify their forms implementation." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Autofill.disable"
  :params nil
  :returns nil
  :doc "Disables autofill domain notifications." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Autofill.enable"
  :params nil
  :returns nil
  :doc "Enables autofill domain notifications." :experimental nil :deprecated nil)

(define-domain-event address-form-filled
  :method "Autofill.addressFormFilled"
  :params (
        (:name :filled-fields :type :array :ref nil :items (:type :ref :ref "FilledField") :optional nil :doc "Information about the fields that were filled")
        (:name :address-ui :type :ref :ref "AddressUI" :items nil :optional nil :doc "An UI representation of the address used to fill the form. Consists of a 2D array where each child represents an address/profile line."))
  :doc "Emitted when an address form is filled." :experimental nil :deprecated nil)

