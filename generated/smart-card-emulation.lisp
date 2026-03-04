;;;; SmartCardEmulation CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/smart-card-emulation
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

(in-package #:cdp/smart-card-emulation)

(define-domain-type result-code
  :cdp-id "ResultCode" :type :string
  :properties nil
  :enum '("success" "removed-card" "reset-card" "unpowered-card" "unresponsive-card" "unsupported-card" "reader-unavailable" "sharing-violation" "not-transacted" "no-smartcard" "proto-mismatch" "system-cancelled" "not-ready" "cancelled" "insufficient-buffer" "invalid-handle" "invalid-parameter" "invalid-value" "no-memory" "timeout" "unknown-reader" "unsupported-feature" "no-readers-available" "service-stopped" "no-service" "comm-error" "internal-error" "server-too-busy" "unexpected" "shutdown" "unknown-card" "unknown")
  :doc "Indicates the PC/SC error code.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__ErrorCodes.html Microsoft: https://learn.microsoft.com/en-us/windows/win32/secauthn/authentication-return-values" :experimental nil :deprecated nil)

(define-domain-type share-mode
  :cdp-id "ShareMode" :type :string
  :properties nil
  :enum '("shared" "exclusive" "direct")
  :doc "Maps to the |SCARD_SHARE_*| values." :experimental nil :deprecated nil)

(define-domain-type disposition
  :cdp-id "Disposition" :type :string
  :properties nil
  :enum '("leave-card" "reset-card" "unpower-card" "eject-card")
  :doc "Indicates what the reader should do with the card." :experimental nil :deprecated nil)

(define-domain-type connection-state
  :cdp-id "ConnectionState" :type :string
  :properties nil
  :enum '("absent" "present" "swallowed" "powered" "negotiable" "specific")
  :doc "Maps to |SCARD_*| connection state values." :experimental nil :deprecated nil)

(define-domain-type reader-state-flags
  :cdp-id "ReaderStateFlags" :type :object
  :properties (
        (:name :unaware :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :ignore :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :changed :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :unknown :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :unavailable :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :empty :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :present :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :exclusive :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :inuse :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :mute :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :unpowered :type :boolean :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "Maps to the |SCARD_STATE_*| flags." :experimental nil :deprecated nil)

(define-domain-type protocol-set
  :cdp-id "ProtocolSet" :type :object
  :properties (
        (:name :t0 :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :t1 :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :raw :type :boolean :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "Maps to the |SCARD_PROTOCOL_*| flags." :experimental nil :deprecated nil)

(define-domain-type protocol
  :cdp-id "Protocol" :type :string
  :properties nil
  :enum '("t0" "t1" "raw")
  :doc "Maps to the |SCARD_PROTOCOL_*| values." :experimental nil :deprecated nil)

(define-domain-type reader-state-in
  :cdp-id "ReaderStateIn" :type :object
  :properties (
        (:name :reader :type :string :ref nil :items nil :optional nil :doc "")
        (:name :current-state :type :ref :ref "ReaderStateFlags" :items nil :optional nil :doc "")
        (:name :current-insertion-count :type :integer :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type reader-state-out
  :cdp-id "ReaderStateOut" :type :object
  :properties (
        (:name :reader :type :string :ref nil :items nil :optional nil :doc "")
        (:name :event-state :type :ref :ref "ReaderStateFlags" :items nil :optional nil :doc "")
        (:name :event-count :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :atr :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "SmartCardEmulation.enable"
  :params nil
  :returns nil
  :doc "Enables the |SmartCardEmulation| domain." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "SmartCardEmulation.disable"
  :params nil
  :returns nil
  :doc "Disables the |SmartCardEmulation| domain." :experimental nil :deprecated nil)

(define-domain-command report-establish-context-result
  :method "SmartCardEmulation.reportEstablishContextResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :context-id :type :integer :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Reports the successful result of a |SCardEstablishContext| call.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gaa1b8970169fd4883a6dc4a8f43f19b67 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardestablishcontext" :experimental nil :deprecated nil)

(define-domain-command report-release-context-result
  :method "SmartCardEmulation.reportReleaseContextResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Reports the successful result of a |SCardReleaseContext| call.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga6aabcba7744c5c9419fdd6404f73a934 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardreleasecontext" :experimental nil :deprecated nil)

(define-domain-command report-list-readers-result
  :method "SmartCardEmulation.reportListReadersResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :readers :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :returns nil
  :doc "Reports the successful result of a |SCardListReaders| call.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga93b07815789b3cf2629d439ecf20f0d9 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardlistreadersa" :experimental nil :deprecated nil)

(define-domain-command report-get-status-change-result
  :method "SmartCardEmulation.reportGetStatusChangeResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :reader-states :type :array :ref nil :items (:type :ref :ref "ReaderStateOut") :optional nil :doc ""))
  :returns nil
  :doc "Reports the successful result of a |SCardGetStatusChange| call.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga33247d5d1257d59e55647c3bb717db24 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardgetstatuschangea" :experimental nil :deprecated nil)

(define-domain-command report-begin-transaction-result
  :method "SmartCardEmulation.reportBeginTransactionResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Reports the result of a |SCardBeginTransaction| call. On success, this creates a new transaction object.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gaddb835dce01a0da1d6ca02d33ee7d861 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardbegintransaction" :experimental nil :deprecated nil)

(define-domain-command report-plain-result
  :method "SmartCardEmulation.reportPlainResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Reports the successful result of a call that returns only a result code. Used for: |SCardCancel|, |SCardDisconnect|, |SCardSetAttrib|, |SCardEndTransaction|.  This maps to: 1. SCardCancel    PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gaacbbc0c6d6c0cbbeb4f4debf6fbeeee6    Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardcancel  2. SCardDisconnect    PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga4be198045c73ec0deb79e66c0ca1738a    Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scarddisconnect  3. SCardSetAttrib    PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga060f0038a4ddfd5dd2b8fadf3c3a2e4f    Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardsetattrib  4. SCardEndTransaction    PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gae8742473b404363e5c587f570d7e2f3b    Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardendtransaction" :experimental nil :deprecated nil)

(define-domain-command report-connect-result
  :method "SmartCardEmulation.reportConnectResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :active-protocol :type :ref :ref "Protocol" :items nil :optional t :doc ""))
  :returns nil
  :doc "Reports the successful result of a |SCardConnect| call.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga4e515829752e0a8dbc4d630696a8d6a5 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardconnecta" :experimental nil :deprecated nil)

(define-domain-command report-data-result
  :method "SmartCardEmulation.reportDataResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Reports the successful result of a call that sends back data on success. Used for |SCardTransmit|, |SCardControl|, and |SCardGetAttrib|.  This maps to: 1. SCardTransmit    PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga9a2d77242a271310269065e64633ab99    Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardtransmit  2. SCardControl    PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gac3454d4657110fd7f753b2d3d8f4e32f    Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardcontrol  3. SCardGetAttrib    PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gaacfec51917255b7a25b94c5104961602    Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardgetattrib" :experimental nil :deprecated nil)

(define-domain-command report-status-result
  :method "SmartCardEmulation.reportStatusResult"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :reader-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :state :type :ref :ref "ConnectionState" :items nil :optional nil :doc "")
        (:name :atr :type :string :ref nil :items nil :optional nil :doc "")
        (:name :protocol :type :ref :ref "Protocol" :items nil :optional t :doc ""))
  :returns nil
  :doc "Reports the successful result of a |SCardStatus| call.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gae49c3c894ad7ac12a5b896bde70d0382 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardstatusa" :experimental nil :deprecated nil)

(define-domain-command report-error
  :method "SmartCardEmulation.reportError"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :result-code :type :ref :ref "ResultCode" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Reports an error result for the given request." :experimental nil :deprecated nil)

(define-domain-event establish-context-requested
  :method "SmartCardEmulation.establishContextRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardEstablishContext| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gaa1b8970169fd4883a6dc4a8f43f19b67 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardestablishcontext" :experimental nil :deprecated nil)

(define-domain-event release-context-requested
  :method "SmartCardEmulation.releaseContextRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :context-id :type :integer :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardReleaseContext| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga6aabcba7744c5c9419fdd6404f73a934 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardreleasecontext" :experimental nil :deprecated nil)

(define-domain-event list-readers-requested
  :method "SmartCardEmulation.listReadersRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :context-id :type :integer :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardListReaders| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga93b07815789b3cf2629d439ecf20f0d9 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardlistreadersa" :experimental nil :deprecated nil)

(define-domain-event get-status-change-requested
  :method "SmartCardEmulation.getStatusChangeRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :context-id :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :reader-states :type :array :ref nil :items (:type :ref :ref "ReaderStateIn") :optional nil :doc "")
        (:name :timeout :type :integer :ref nil :items nil :optional t :doc "in milliseconds, if absent, it means \"infinite\""))
  :doc "Fired when |SCardGetStatusChange| is called. Timeout is specified in milliseconds.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga33247d5d1257d59e55647c3bb717db24 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardgetstatuschangea" :experimental nil :deprecated nil)

(define-domain-event cancel-requested
  :method "SmartCardEmulation.cancelRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :context-id :type :integer :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardCancel| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gaacbbc0c6d6c0cbbeb4f4debf6fbeeee6 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardcancel" :experimental nil :deprecated nil)

(define-domain-event connect-requested
  :method "SmartCardEmulation.connectRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :context-id :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :reader :type :string :ref nil :items nil :optional nil :doc "")
        (:name :share-mode :type :ref :ref "ShareMode" :items nil :optional nil :doc "")
        (:name :preferred-protocols :type :ref :ref "ProtocolSet" :items nil :optional nil :doc ""))
  :doc "Fired when |SCardConnect| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga4e515829752e0a8dbc4d630696a8d6a5 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardconnecta" :experimental nil :deprecated nil)

(define-domain-event disconnect-requested
  :method "SmartCardEmulation.disconnectRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :disposition :type :ref :ref "Disposition" :items nil :optional nil :doc ""))
  :doc "Fired when |SCardDisconnect| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga4be198045c73ec0deb79e66c0ca1738a Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scarddisconnect" :experimental nil :deprecated nil)

(define-domain-event transmit-requested
  :method "SmartCardEmulation.transmitRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "")
        (:name :protocol :type :ref :ref "Protocol" :items nil :optional t :doc ""))
  :doc "Fired when |SCardTransmit| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga9a2d77242a271310269065e64633ab99 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardtransmit" :experimental nil :deprecated nil)

(define-domain-event control-requested
  :method "SmartCardEmulation.controlRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :control-code :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardControl| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gac3454d4657110fd7f753b2d3d8f4e32f Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardcontrol" :experimental nil :deprecated nil)

(define-domain-event get-attrib-requested
  :method "SmartCardEmulation.getAttribRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :attrib-id :type :integer :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardGetAttrib| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gaacfec51917255b7a25b94c5104961602 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardgetattrib" :experimental nil :deprecated nil)

(define-domain-event set-attrib-requested
  :method "SmartCardEmulation.setAttribRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :attrib-id :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :data :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardSetAttrib| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#ga060f0038a4ddfd5dd2b8fadf3c3a2e4f Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardsetattrib" :experimental nil :deprecated nil)

(define-domain-event status-requested
  :method "SmartCardEmulation.statusRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardStatus| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gae49c3c894ad7ac12a5b896bde70d0382 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardstatusa" :experimental nil :deprecated nil)

(define-domain-event begin-transaction-requested
  :method "SmartCardEmulation.beginTransactionRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc ""))
  :doc "Fired when |SCardBeginTransaction| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gaddb835dce01a0da1d6ca02d33ee7d861 Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardbegintransaction" :experimental nil :deprecated nil)

(define-domain-event end-transaction-requested
  :method "SmartCardEmulation.endTransactionRequested"
  :params (
        (:name :request-id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :handle :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :disposition :type :ref :ref "Disposition" :items nil :optional nil :doc ""))
  :doc "Fired when |SCardEndTransaction| is called.  This maps to: PC/SC Lite: https://pcsclite.apdu.fr/api/group__API.html#gae8742473b404363e5c587f570d7e2f3b Microsoft: https://learn.microsoft.com/en-us/windows/win32/api/winscard/nf-winscard-scardendtransaction" :experimental nil :deprecated nil)

