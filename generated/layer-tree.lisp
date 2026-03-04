;;;; LayerTree CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/layer-tree
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

(in-package #:cdp/layer-tree)

(define-domain-type layer-id
  :cdp-id "LayerId" :type :string
  :properties nil
  :enum nil
  :doc "Unique Layer identifier." :experimental nil :deprecated nil)

(define-domain-type snapshot-id
  :cdp-id "SnapshotId" :type :string
  :properties nil
  :enum nil
  :doc "Unique snapshot identifier." :experimental nil :deprecated nil)

(define-domain-type scroll-rect
  :cdp-id "ScrollRect" :type :object
  :properties (
        (:name :rect :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "Rectangle itself.")
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Reason for rectangle to force scrolling on the main thread"))
  :enum nil
  :doc "Rectangle where scrolling happens on the main thread." :experimental nil :deprecated nil)

(define-domain-type sticky-position-constraint
  :cdp-id "StickyPositionConstraint" :type :object
  :properties (
        (:name :sticky-box-rect :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "Layout rectangle of the sticky element before being shifted")
        (:name :containing-block-rect :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "Layout rectangle of the containing block of the sticky element")
        (:name :nearest-layer-shifting-sticky-box :type :ref :ref "LayerId" :items nil :optional t :doc "The nearest sticky layer that shifts the sticky box")
        (:name :nearest-layer-shifting-containing-block :type :ref :ref "LayerId" :items nil :optional t :doc "The nearest sticky layer that shifts the containing block"))
  :enum nil
  :doc "Sticky position constraints." :experimental nil :deprecated nil)

(define-domain-type picture-tile
  :cdp-id "PictureTile" :type :object
  :properties (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "Offset from owning layer left boundary")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Offset from owning layer top boundary")
        (:name :picture :type :string :ref nil :items nil :optional nil :doc "Base64-encoded snapshot data. (Encoded as a base64 string when passed over JSON)"))
  :enum nil
  :doc "Serialized fragment of layer picture along with its offset within the layer." :experimental nil :deprecated nil)

(define-domain-type layer
  :cdp-id "Layer" :type :object
  :properties (
        (:name :layer-id :type :ref :ref "LayerId" :items nil :optional nil :doc "The unique id for this layer.")
        (:name :parent-layer-id :type :ref :ref "LayerId" :items nil :optional t :doc "The id of parent (not present for root).")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "The backend id for the node associated with this layer.")
        (:name :offset-x :type :number :ref nil :items nil :optional nil :doc "Offset from parent layer, X coordinate.")
        (:name :offset-y :type :number :ref nil :items nil :optional nil :doc "Offset from parent layer, Y coordinate.")
        (:name :width :type :number :ref nil :items nil :optional nil :doc "Layer width.")
        (:name :height :type :number :ref nil :items nil :optional nil :doc "Layer height.")
        (:name :transform :type :array :ref nil :items (:type :number :ref nil) :optional t :doc "Transformation matrix for layer, default is identity matrix")
        (:name :anchor-x :type :number :ref nil :items nil :optional t :doc "Transform anchor point X, absent if no transform specified")
        (:name :anchor-y :type :number :ref nil :items nil :optional t :doc "Transform anchor point Y, absent if no transform specified")
        (:name :anchor-z :type :number :ref nil :items nil :optional t :doc "Transform anchor point Z, absent if no transform specified")
        (:name :paint-count :type :integer :ref nil :items nil :optional nil :doc "Indicates how many time this layer has painted.")
        (:name :draws-content :type :boolean :ref nil :items nil :optional nil :doc "Indicates whether this layer hosts any content, rather than being used for transform/scrolling purposes only.")
        (:name :invisible :type :boolean :ref nil :items nil :optional t :doc "Set if layer is not visible.")
        (:name :scroll-rects :type :array :ref nil :items (:type :ref :ref "ScrollRect") :optional t :doc "Rectangles scrolling on main thread only.")
        (:name :sticky-position-constraint :type :ref :ref "StickyPositionConstraint" :items nil :optional t :doc "Sticky position constraint information"))
  :enum nil
  :doc "Information about a compositing layer." :experimental nil :deprecated nil)

(define-domain-type paint-profile
  :cdp-id "PaintProfile" :type :array
  :properties nil
  :enum nil
  :doc "Array of timings, one per paint step." :experimental nil :deprecated nil)

(define-domain-command compositing-reasons
  :method "LayerTree.compositingReasons"
  :params (
        (:name :layer-id :type :ref :ref "LayerId" :items nil :optional nil :doc "The id of the layer for which we want to get the reasons it was composited."))
  :returns (
        (:name :compositing-reasons :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "A list of strings specifying reasons for the given layer to become composited.")
        (:name :compositing-reason-ids :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "A list of strings specifying reason IDs for the given layer to become composited."))
  :doc "Provides the reasons why the given layer was composited." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "LayerTree.disable"
  :params nil
  :returns nil
  :doc "Disables compositing tree inspection." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "LayerTree.enable"
  :params nil
  :returns nil
  :doc "Enables compositing tree inspection." :experimental nil :deprecated nil)

(define-domain-command load-snapshot
  :method "LayerTree.loadSnapshot"
  :params (
        (:name :tiles :type :array :ref nil :items (:type :ref :ref "PictureTile") :optional nil :doc "An array of tiles composing the snapshot."))
  :returns (
        (:name :snapshot-id :type :ref :ref "SnapshotId" :items nil :optional nil :doc "The id of the snapshot."))
  :doc "Returns the snapshot identifier." :experimental nil :deprecated nil)

(define-domain-command make-snapshot
  :method "LayerTree.makeSnapshot"
  :params (
        (:name :layer-id :type :ref :ref "LayerId" :items nil :optional nil :doc "The id of the layer."))
  :returns (
        (:name :snapshot-id :type :ref :ref "SnapshotId" :items nil :optional nil :doc "The id of the layer snapshot."))
  :doc "Returns the layer snapshot identifier." :experimental nil :deprecated nil)

(define-domain-command profile-snapshot
  :method "LayerTree.profileSnapshot"
  :params (
        (:name :snapshot-id :type :ref :ref "SnapshotId" :items nil :optional nil :doc "The id of the layer snapshot.")
        (:name :min-repeat-count :type :integer :ref nil :items nil :optional t :doc "The maximum number of times to replay the snapshot (1, if not specified).")
        (:name :min-duration :type :number :ref nil :items nil :optional t :doc "The minimum duration (in seconds) to replay the snapshot.")
        (:name :clip-rect :type :ref :ref "DOM.Rect" :items nil :optional t :doc "The clip rectangle to apply when replaying the snapshot."))
  :returns (
        (:name :timings :type :array :ref nil :items (:type :ref :ref "PaintProfile") :optional nil :doc "The array of paint profiles, one per run."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command release-snapshot
  :method "LayerTree.releaseSnapshot"
  :params (
        (:name :snapshot-id :type :ref :ref "SnapshotId" :items nil :optional nil :doc "The id of the layer snapshot."))
  :returns nil
  :doc "Releases layer snapshot captured by the back-end." :experimental nil :deprecated nil)

(define-domain-command replay-snapshot
  :method "LayerTree.replaySnapshot"
  :params (
        (:name :snapshot-id :type :ref :ref "SnapshotId" :items nil :optional nil :doc "The id of the layer snapshot.")
        (:name :from-step :type :integer :ref nil :items nil :optional t :doc "The first step to replay from (replay from the very start if not specified).")
        (:name :to-step :type :integer :ref nil :items nil :optional t :doc "The last step to replay to (replay till the end if not specified).")
        (:name :scale :type :number :ref nil :items nil :optional t :doc "The scale to apply while replaying (defaults to 1)."))
  :returns (
        (:name :data-url :type :string :ref nil :items nil :optional nil :doc "A data: URL for resulting image."))
  :doc "Replays the layer snapshot and returns the resulting bitmap." :experimental nil :deprecated nil)

(define-domain-command snapshot-command-log
  :method "LayerTree.snapshotCommandLog"
  :params (
        (:name :snapshot-id :type :ref :ref "SnapshotId" :items nil :optional nil :doc "The id of the layer snapshot."))
  :returns (
        (:name :command-log :type :array :ref nil :items (:type :object :ref nil) :optional nil :doc "The array of canvas function calls."))
  :doc "Replays the layer snapshot and returns canvas log." :experimental nil :deprecated nil)

(define-domain-event layer-painted
  :method "LayerTree.layerPainted"
  :params (
        (:name :layer-id :type :ref :ref "LayerId" :items nil :optional nil :doc "The id of the painted layer.")
        (:name :clip :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "Clip rectangle."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-event layer-tree-did-change
  :method "LayerTree.layerTreeDidChange"
  :params (
        (:name :layers :type :array :ref nil :items (:type :ref :ref "Layer") :optional t :doc "Layer tree, absent if not in the compositing mode."))
  :doc "" :experimental nil :deprecated nil)

