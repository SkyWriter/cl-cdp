;;;; IO CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/io
  (:use #:cl)
  (:shadow
    #:close
    #:read
  )
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/io)

(define-domain-type stream-handle
  :cdp-id "StreamHandle" :type :string
  :properties nil
  :enum nil
  :doc "This is either obtained from another method or specified as `blob:<uuid>` where `<uuid>` is an UUID of a Blob." :experimental nil :deprecated nil)

(define-domain-command close
  :method "IO.close"
  :params (
        (:name :handle :type :ref :ref "StreamHandle" :items nil :optional nil :doc "Handle of the stream to close."))
  :returns nil
  :doc "Close the stream, discard any temporary backing storage." :experimental nil :deprecated nil)

(define-domain-command read
  :method "IO.read"
  :params (
        (:name :handle :type :ref :ref "StreamHandle" :items nil :optional nil :doc "Handle of the stream to read.")
        (:name :offset :type :integer :ref nil :items nil :optional t :doc "Seek to the specified offset before reading (if not specified, proceed with offset following the last read). Some types of streams may only support sequential reads.")
        (:name :size :type :integer :ref nil :items nil :optional t :doc "Maximum number of bytes to read (left upon the agent discretion if not specified)."))
  :returns (
        (:name :base64-encoded :type :boolean :ref nil :items nil :optional t :doc "Set if the data is base64-encoded")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Data that were read.")
        (:name :eof :type :boolean :ref nil :items nil :optional nil :doc "Set if the end-of-file condition occurred while reading."))
  :doc "Read a chunk of the stream" :experimental nil :deprecated nil)

(define-domain-command resolve-blob
  :method "IO.resolveBlob"
  :params (
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional nil :doc "Object id of a Blob object wrapper."))
  :returns (
        (:name :uuid :type :string :ref nil :items nil :optional nil :doc "UUID of the specified Blob."))
  :doc "Return UUID of Blob object specified by a remote object id." :experimental nil :deprecated nil)

