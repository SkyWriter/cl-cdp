;;;; Accessibility CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/accessibility
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

(in-package #:cdp/accessibility)

(define-domain-type ax-node-id
  :cdp-id "AXNodeId" :type :string
  :properties nil
  :enum nil
  :doc "Unique accessibility node identifier." :experimental nil :deprecated nil)

(define-domain-type ax-value-type
  :cdp-id "AXValueType" :type :string
  :properties nil
  :enum '("boolean" "tristate" "booleanOrUndefined" "idref" "idrefList" "integer" "node" "nodeList" "number" "string" "computedString" "token" "tokenList" "domRelation" "role" "internalRole" "valueUndefined")
  :doc "Enum of possible property types." :experimental nil :deprecated nil)

(define-domain-type ax-value-source-type
  :cdp-id "AXValueSourceType" :type :string
  :properties nil
  :enum '("attribute" "implicit" "style" "contents" "placeholder" "relatedElement")
  :doc "Enum of possible property sources." :experimental nil :deprecated nil)

(define-domain-type ax-value-native-source-type
  :cdp-id "AXValueNativeSourceType" :type :string
  :properties nil
  :enum '("description" "figcaption" "label" "labelfor" "labelwrapped" "legend" "rubyannotation" "tablecaption" "title" "other")
  :doc "Enum of possible native property sources (as a subtype of a particular AXValueSourceType)." :experimental nil :deprecated nil)

(define-domain-type ax-value-source
  :cdp-id "AXValueSource" :type :object
  :properties (
        (:name :type :type :ref :ref "AXValueSourceType" :items nil :optional nil :doc "What type of source this is.")
        (:name :value :type :ref :ref "AXValue" :items nil :optional t :doc "The value of this property source.")
        (:name :attribute :type :string :ref nil :items nil :optional t :doc "The name of the relevant attribute, if any.")
        (:name :attribute-value :type :ref :ref "AXValue" :items nil :optional t :doc "The value of the relevant attribute, if any.")
        (:name :superseded :type :boolean :ref nil :items nil :optional t :doc "Whether this source is superseded by a higher priority source.")
        (:name :native-source :type :ref :ref "AXValueNativeSourceType" :items nil :optional t :doc "The native markup source for this value, e.g. a `<label>` element.")
        (:name :native-source-value :type :ref :ref "AXValue" :items nil :optional t :doc "The value, such as a node or node list, of the native source.")
        (:name :invalid :type :boolean :ref nil :items nil :optional t :doc "Whether the value for this property is invalid.")
        (:name :invalid-reason :type :string :ref nil :items nil :optional t :doc "Reason for the value being invalid, if it is."))
  :enum nil
  :doc "A single source for a computed AX property." :experimental nil :deprecated nil)

(define-domain-type ax-related-node
  :cdp-id "AXRelatedNode" :type :object
  :properties (
        (:name :backend-dom-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "The BackendNodeId of the related DOM node.")
        (:name :idref :type :string :ref nil :items nil :optional t :doc "The IDRef value provided, if any.")
        (:name :text :type :string :ref nil :items nil :optional t :doc "The text alternative of this node in the current context."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type ax-property
  :cdp-id "AXProperty" :type :object
  :properties (
        (:name :name :type :ref :ref "AXPropertyName" :items nil :optional nil :doc "The name of this property.")
        (:name :value :type :ref :ref "AXValue" :items nil :optional nil :doc "The value of this property."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type ax-value
  :cdp-id "AXValue" :type :object
  :properties (
        (:name :type :type :ref :ref "AXValueType" :items nil :optional nil :doc "The type of this value.")
        (:name :value :type :any :ref nil :items nil :optional t :doc "The computed value of this property.")
        (:name :related-nodes :type :array :ref nil :items (:type :ref :ref "AXRelatedNode") :optional t :doc "One or more related nodes, if applicable.")
        (:name :sources :type :array :ref nil :items (:type :ref :ref "AXValueSource") :optional t :doc "The sources which contributed to the computation of this property."))
  :enum nil
  :doc "A single computed AX property." :experimental nil :deprecated nil)

(define-domain-type ax-property-name
  :cdp-id "AXPropertyName" :type :string
  :properties nil
  :enum '("actions" "busy" "disabled" "editable" "focusable" "focused" "hidden" "hiddenRoot" "invalid" "keyshortcuts" "settable" "roledescription" "live" "atomic" "relevant" "root" "autocomplete" "hasPopup" "level" "multiselectable" "orientation" "multiline" "readonly" "required" "valuemin" "valuemax" "valuetext" "checked" "expanded" "modal" "pressed" "selected" "activedescendant" "controls" "describedby" "details" "errormessage" "flowto" "labelledby" "owns" "url" "activeFullscreenElement" "activeModalDialog" "activeAriaModalDialog" "ariaHiddenElement" "ariaHiddenSubtree" "emptyAlt" "emptyText" "inertElement" "inertSubtree" "labelContainer" "labelFor" "notRendered" "notVisible" "presentationalRole" "probablyPresentational" "inactiveCarouselTabContent" "uninteresting")
  :doc "Values of AXProperty name: - from 'busy' to 'roledescription': states which apply to every AX node - from 'live' to 'root': attributes which apply to nodes in live regions - from 'autocomplete' to 'valuetext': attributes which apply to widgets - from 'checked' to 'selected': states which apply to widgets - from 'activedescendant' to 'owns': relationships between elements other than parent/child/sibling - from 'activeFullscreenElement' to 'uninteresting': reasons why this noode is hidden" :experimental nil :deprecated nil)

(define-domain-type ax-node
  :cdp-id "AXNode" :type :object
  :properties (
        (:name :node-id :type :ref :ref "AXNodeId" :items nil :optional nil :doc "Unique identifier for this node.")
        (:name :ignored :type :boolean :ref nil :items nil :optional nil :doc "Whether this node is ignored for accessibility")
        (:name :ignored-reasons :type :array :ref nil :items (:type :ref :ref "AXProperty") :optional t :doc "Collection of reasons why this node is hidden.")
        (:name :role :type :ref :ref "AXValue" :items nil :optional t :doc "This `Node`'s role, whether explicit or implicit.")
        (:name :chrome-role :type :ref :ref "AXValue" :items nil :optional t :doc "This `Node`'s Chrome raw role.")
        (:name :name :type :ref :ref "AXValue" :items nil :optional t :doc "The accessible name for this `Node`.")
        (:name :description :type :ref :ref "AXValue" :items nil :optional t :doc "The accessible description for this `Node`.")
        (:name :value :type :ref :ref "AXValue" :items nil :optional t :doc "The value for this `Node`.")
        (:name :properties :type :array :ref nil :items (:type :ref :ref "AXProperty") :optional t :doc "All other properties")
        (:name :parent-id :type :ref :ref "AXNodeId" :items nil :optional t :doc "ID for this node's parent.")
        (:name :child-ids :type :array :ref nil :items (:type :ref :ref "AXNodeId") :optional t :doc "IDs for each of this node's child nodes.")
        (:name :backend-dom-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "The backend ID for the associated DOM node, if any.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "The frame ID for the frame associated with this nodes document."))
  :enum nil
  :doc "A node in the accessibility tree." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Accessibility.disable"
  :params nil
  :returns nil
  :doc "Disables the accessibility domain." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Accessibility.enable"
  :params nil
  :returns nil
  :doc "Enables the accessibility domain which causes `AXNodeId`s to remain consistent between method calls. This turns on accessibility for the page, which can impact performance until accessibility is disabled." :experimental nil :deprecated nil)

(define-domain-command get-partial-ax-tree
  :method "Accessibility.getPartialAXTree"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "Identifier of the node to get the partial accessibility tree for.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Identifier of the backend node to get the partial accessibility tree for.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper to get the partial accessibility tree for.")
        (:name :fetch-relatives :type :boolean :ref nil :items nil :optional t :doc "Whether to fetch this node's ancestors, siblings and children. Defaults to true."))
  :returns (
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "AXNode") :optional nil :doc "The `Accessibility.AXNode` for this DOM node, if it exists, plus its ancestors, siblings and children, if requested."))
  :doc "Fetches the accessibility node and partial accessibility tree for this DOM node, if it exists." :experimental t :deprecated nil)

(define-domain-command get-full-ax-tree
  :method "Accessibility.getFullAXTree"
  :params (
        (:name :depth :type :integer :ref nil :items nil :optional t :doc "The maximum depth at which descendants of the root node should be retrieved. If omitted, the full tree is returned.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "The frame for whose document the AX tree should be retrieved. If omitted, the root frame is used."))
  :returns (
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "AXNode") :optional nil :doc ""))
  :doc "Fetches the entire accessibility tree for the root Document" :experimental t :deprecated nil)

(define-domain-command get-root-ax-node
  :method "Accessibility.getRootAXNode"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "The frame in whose document the node resides. If omitted, the root frame is used."))
  :returns (
        (:name :node :type :ref :ref "AXNode" :items nil :optional nil :doc ""))
  :doc "Fetches the root node. Requires `enable()` to have been called previously." :experimental t :deprecated nil)

(define-domain-command get-ax-node-and-ancestors
  :method "Accessibility.getAXNodeAndAncestors"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "Identifier of the node to get.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Identifier of the backend node to get.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper to get."))
  :returns (
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "AXNode") :optional nil :doc ""))
  :doc "Fetches a node and all ancestors up to and including the root. Requires `enable()` to have been called previously." :experimental t :deprecated nil)

(define-domain-command get-child-ax-nodes
  :method "Accessibility.getChildAXNodes"
  :params (
        (:name :id :type :ref :ref "AXNodeId" :items nil :optional nil :doc "")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "The frame in whose document the node resides. If omitted, the root frame is used."))
  :returns (
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "AXNode") :optional nil :doc ""))
  :doc "Fetches a particular accessibility node by AXNodeId. Requires `enable()` to have been called previously." :experimental t :deprecated nil)

(define-domain-command query-ax-tree
  :method "Accessibility.queryAXTree"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "Identifier of the node for the root to query.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Identifier of the backend node for the root to query.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper for the root to query.")
        (:name :accessible-name :type :string :ref nil :items nil :optional t :doc "Find nodes with this computed name.")
        (:name :role :type :string :ref nil :items nil :optional t :doc "Find nodes with this computed role."))
  :returns (
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "AXNode") :optional nil :doc "A list of `Accessibility.AXNode` matching the specified attributes, including nodes that are ignored for accessibility."))
  :doc "Query a DOM node's accessibility subtree for accessible name and role. This command computes the name and role for all nodes in the subtree, including those that are ignored for accessibility, and returns those that match the specified name and role. If no DOM node is specified, or the DOM node does not exist, the command returns an error. If neither `accessibleName` or `role` is specified, it returns all the accessibility nodes in the subtree." :experimental t :deprecated nil)

(define-domain-event load-complete
  :method "Accessibility.loadComplete"
  :params (
        (:name :root :type :ref :ref "AXNode" :items nil :optional nil :doc "New document root node."))
  :doc "The loadComplete event mirrors the load complete event sent by the browser to assistive technology when the web page has finished loading." :experimental t :deprecated nil)

(define-domain-event nodes-updated
  :method "Accessibility.nodesUpdated"
  :params (
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "AXNode") :optional nil :doc "Updated node data."))
  :doc "The nodesUpdated event is sent every time a previously requested node has changed the in tree." :experimental t :deprecated nil)

