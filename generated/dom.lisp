;;;; DOM CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/dom
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

(in-package #:cdp/dom)

(define-domain-type node-id
  :cdp-id "NodeId" :type :integer
  :properties nil
  :enum nil
  :doc "Unique DOM node identifier." :experimental nil :deprecated nil)

(define-domain-type backend-node-id
  :cdp-id "BackendNodeId" :type :integer
  :properties nil
  :enum nil
  :doc "Unique DOM node identifier used to reference a node that may not have been pushed to the front-end." :experimental nil :deprecated nil)

(define-domain-type style-sheet-id
  :cdp-id "StyleSheetId" :type :string
  :properties nil
  :enum nil
  :doc "Unique identifier for a CSS stylesheet." :experimental nil :deprecated nil)

(define-domain-type backend-node
  :cdp-id "BackendNode" :type :object
  :properties (
        (:name :node-type :type :integer :ref nil :items nil :optional nil :doc "`Node`'s nodeType.")
        (:name :node-name :type :string :ref nil :items nil :optional nil :doc "`Node`'s nodeName.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Backend node with a friendly name." :experimental nil :deprecated nil)

(define-domain-type pseudo-type
  :cdp-id "PseudoType" :type :string
  :properties nil
  :enum '("first-line" "first-letter" "checkmark" "before" "after" "picker-icon" "interest-hint" "marker" "backdrop" "column" "selection" "search-text" "target-text" "spelling-error" "grammar-error" "highlight" "first-line-inherited" "scroll-marker" "scroll-marker-group" "scroll-button" "scrollbar" "scrollbar-thumb" "scrollbar-button" "scrollbar-track" "scrollbar-track-piece" "scrollbar-corner" "resizer" "input-list-button" "view-transition" "view-transition-group" "view-transition-image-pair" "view-transition-group-children" "view-transition-old" "view-transition-new" "placeholder" "file-selector-button" "details-content" "picker" "permission-icon" "overscroll-area-parent")
  :doc "Pseudo element type." :experimental nil :deprecated nil)

(define-domain-type shadow-root-type
  :cdp-id "ShadowRootType" :type :string
  :properties nil
  :enum '("user-agent" "open" "closed")
  :doc "Shadow root type." :experimental nil :deprecated nil)

(define-domain-type compatibility-mode
  :cdp-id "CompatibilityMode" :type :string
  :properties nil
  :enum '("QuirksMode" "LimitedQuirksMode" "NoQuirksMode")
  :doc "Document compatibility mode." :experimental nil :deprecated nil)

(define-domain-type physical-axes
  :cdp-id "PhysicalAxes" :type :string
  :properties nil
  :enum '("Horizontal" "Vertical" "Both")
  :doc "ContainerSelector physical axes" :experimental nil :deprecated nil)

(define-domain-type logical-axes
  :cdp-id "LogicalAxes" :type :string
  :properties nil
  :enum '("Inline" "Block" "Both")
  :doc "ContainerSelector logical axes" :experimental nil :deprecated nil)

(define-domain-type scroll-orientation
  :cdp-id "ScrollOrientation" :type :string
  :properties nil
  :enum '("horizontal" "vertical")
  :doc "Physical scroll orientation" :experimental nil :deprecated nil)

(define-domain-type node
  :cdp-id "Node" :type :object
  :properties (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Node identifier that is passed into the rest of the DOM messages as the `nodeId`. Backend will only push node with given `id` once. It is aware of all requested nodes and will only fire DOM events for nodes known to the client.")
        (:name :parent-id :type :ref :ref "NodeId" :items nil :optional t :doc "The id of the parent node if any.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional nil :doc "The BackendNodeId for this node.")
        (:name :node-type :type :integer :ref nil :items nil :optional nil :doc "`Node`'s nodeType.")
        (:name :node-name :type :string :ref nil :items nil :optional nil :doc "`Node`'s nodeName.")
        (:name :local-name :type :string :ref nil :items nil :optional nil :doc "`Node`'s localName.")
        (:name :node-value :type :string :ref nil :items nil :optional nil :doc "`Node`'s nodeValue.")
        (:name :child-node-count :type :integer :ref nil :items nil :optional t :doc "Child count for `Container` nodes.")
        (:name :children :type :array :ref nil :items (:type :ref :ref "Node") :optional t :doc "Child nodes of this node when requested with children.")
        (:name :attributes :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Attributes of the `Element` node in the form of flat array `[name1, value1, name2, value2]`.")
        (:name :document-url :type :string :ref nil :items nil :optional t :doc "Document URL that `Document` or `FrameOwner` node points to.")
        (:name :base-url :type :string :ref nil :items nil :optional t :doc "Base URL that `Document` or `FrameOwner` node uses for URL completion.")
        (:name :public-id :type :string :ref nil :items nil :optional t :doc "`DocumentType`'s publicId.")
        (:name :system-id :type :string :ref nil :items nil :optional t :doc "`DocumentType`'s systemId.")
        (:name :internal-subset :type :string :ref nil :items nil :optional t :doc "`DocumentType`'s internalSubset.")
        (:name :xml-version :type :string :ref nil :items nil :optional t :doc "`Document`'s XML version in case of XML documents.")
        (:name :name :type :string :ref nil :items nil :optional t :doc "`Attr`'s name.")
        (:name :value :type :string :ref nil :items nil :optional t :doc "`Attr`'s value.")
        (:name :pseudo-type :type :ref :ref "PseudoType" :items nil :optional t :doc "Pseudo element type for this node.")
        (:name :pseudo-identifier :type :string :ref nil :items nil :optional t :doc "Pseudo element identifier for this node. Only present if there is a valid pseudoType.")
        (:name :shadow-root-type :type :ref :ref "ShadowRootType" :items nil :optional t :doc "Shadow root type.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "Frame ID for frame owner elements.")
        (:name :content-document :type :ref :ref "Node" :items nil :optional t :doc "Content document for frame owner elements.")
        (:name :shadow-roots :type :array :ref nil :items (:type :ref :ref "Node") :optional t :doc "Shadow root list for given element host.")
        (:name :template-content :type :ref :ref "Node" :items nil :optional t :doc "Content document fragment for template elements.")
        (:name :pseudo-elements :type :array :ref nil :items (:type :ref :ref "Node") :optional t :doc "Pseudo elements associated with this node.")
        (:name :imported-document :type :ref :ref "Node" :items nil :optional t :doc "Deprecated, as the HTML Imports API has been removed (crbug.com/937746). This property used to return the imported document for the HTMLImport links. The property is always undefined now.")
        (:name :distributed-nodes :type :array :ref nil :items (:type :ref :ref "BackendNode") :optional t :doc "Distributed nodes for given insertion point.")
        (:name :is-svg :type :boolean :ref nil :items nil :optional t :doc "Whether the node is SVG.")
        (:name :compatibility-mode :type :ref :ref "CompatibilityMode" :items nil :optional t :doc "")
        (:name :assigned-slot :type :ref :ref "BackendNode" :items nil :optional t :doc "")
        (:name :is-scrollable :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :affected-by-starting-styles :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :adopted-style-sheets :type :array :ref nil :items (:type :ref :ref "StyleSheetId") :optional t :doc "")
        (:name :is-ad-related :type :boolean :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "DOM interaction is implemented in terms of mirror objects that represent the actual DOM nodes. DOMNode is a base node mirror type." :experimental nil :deprecated nil)

(define-domain-type detached-element-info
  :cdp-id "DetachedElementInfo" :type :object
  :properties (
        (:name :tree-node :type :ref :ref "Node" :items nil :optional nil :doc "")
        (:name :retained-node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc ""))
  :enum nil
  :doc "A structure to hold the top-level node of a detached tree and an array of its retained descendants." :experimental nil :deprecated nil)

(define-domain-type rgba
  :cdp-id "RGBA" :type :object
  :properties (
        (:name :r :type :integer :ref nil :items nil :optional nil :doc "The red component, in the [0-255] range.")
        (:name :g :type :integer :ref nil :items nil :optional nil :doc "The green component, in the [0-255] range.")
        (:name :b :type :integer :ref nil :items nil :optional nil :doc "The blue component, in the [0-255] range.")
        (:name :a :type :number :ref nil :items nil :optional t :doc "The alpha component, in the [0-1] range (default: 1)."))
  :enum nil
  :doc "A structure holding an RGBA color." :experimental nil :deprecated nil)

(define-domain-type quad
  :cdp-id "Quad" :type :array
  :properties nil
  :enum nil
  :doc "An array of quad vertices, x immediately followed by y for each point, points clock-wise." :experimental nil :deprecated nil)

(define-domain-type box-model
  :cdp-id "BoxModel" :type :object
  :properties (
        (:name :content :type :ref :ref "Quad" :items nil :optional nil :doc "Content box")
        (:name :padding :type :ref :ref "Quad" :items nil :optional nil :doc "Padding box")
        (:name :border :type :ref :ref "Quad" :items nil :optional nil :doc "Border box")
        (:name :margin :type :ref :ref "Quad" :items nil :optional nil :doc "Margin box")
        (:name :width :type :integer :ref nil :items nil :optional nil :doc "Node width")
        (:name :height :type :integer :ref nil :items nil :optional nil :doc "Node height")
        (:name :shape-outside :type :ref :ref "ShapeOutsideInfo" :items nil :optional t :doc "Shape outside coordinates"))
  :enum nil
  :doc "Box model." :experimental nil :deprecated nil)

(define-domain-type shape-outside-info
  :cdp-id "ShapeOutsideInfo" :type :object
  :properties (
        (:name :bounds :type :ref :ref "Quad" :items nil :optional nil :doc "Shape bounds")
        (:name :shape :type :array :ref nil :items (:type :any :ref nil) :optional nil :doc "Shape coordinate details")
        (:name :margin-shape :type :array :ref nil :items (:type :any :ref nil) :optional nil :doc "Margin shape bounds"))
  :enum nil
  :doc "CSS Shape Outside details." :experimental nil :deprecated nil)

(define-domain-type rect
  :cdp-id "Rect" :type :object
  :properties (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "X coordinate")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Y coordinate")
        (:name :width :type :number :ref nil :items nil :optional nil :doc "Rectangle width")
        (:name :height :type :number :ref nil :items nil :optional nil :doc "Rectangle height"))
  :enum nil
  :doc "Rectangle." :experimental nil :deprecated nil)

(define-domain-type css-computed-style-property
  :cdp-id "CSSComputedStyleProperty" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Computed style property name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Computed style property value."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command collect-class-names-from-subtree
  :method "DOM.collectClassNamesFromSubtree"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to collect class names."))
  :returns (
        (:name :class-names :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Class name list."))
  :doc "Collects class names for the node with given id and all of it's child nodes." :experimental t :deprecated nil)

(define-domain-command copy-to
  :method "DOM.copyTo"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to copy.")
        (:name :target-node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the element to drop the copy into.")
        (:name :insert-before-node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Drop the copy before this node (if absent, the copy becomes the last child of `targetNodeId`)."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node clone."))
  :doc "Creates a deep copy of the specified node and places it into the target container before the given anchor." :experimental t :deprecated nil)

(define-domain-command describe-node
  :method "DOM.describeNode"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Identifier of the node.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional t :doc "Identifier of the backend node.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper.")
        (:name :depth :type :integer :ref nil :items nil :optional t :doc "The maximum depth at which children should be retrieved, defaults to 1. Use -1 for the entire subtree or provide an integer larger than 0.")
        (:name :pierce :type :boolean :ref nil :items nil :optional t :doc "Whether or not iframes and shadow roots should be traversed when returning the subtree (default is false)."))
  :returns (
        (:name :node :type :ref :ref "Node" :items nil :optional nil :doc "Node description."))
  :doc "Describes node given its id, does not require domain to be enabled. Does not start tracking any objects, can be used for automation." :experimental nil :deprecated nil)

(define-domain-command scroll-into-view-if-needed
  :method "DOM.scrollIntoViewIfNeeded"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Identifier of the node.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional t :doc "Identifier of the backend node.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper.")
        (:name :rect :type :ref :ref "Rect" :items nil :optional t :doc "The rect to be scrolled into view, relative to the node's border box, in CSS pixels. When omitted, center of the node will be used, similar to Element.scrollIntoView."))
  :returns nil
  :doc "Scrolls the specified rect of the given node into view if not already visible. Note: exactly one between nodeId, backendNodeId and objectId should be passed to identify the node." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "DOM.disable"
  :params nil
  :returns nil
  :doc "Disables DOM agent for the given page." :experimental nil :deprecated nil)

(define-domain-command discard-search-results
  :method "DOM.discardSearchResults"
  :params (
        (:name :search-id :type :string :ref nil :items nil :optional nil :doc "Unique search session identifier."))
  :returns nil
  :doc "Discards search results from the session with the given id. `getSearchResults` should no longer be called for that search." :experimental t :deprecated nil)

(define-domain-command enable
  :method "DOM.enable"
  :params (
        (:name :include-whitespace :type :string :ref nil :items nil :optional t :doc "Whether to include whitespaces in the children array of returned Nodes."))
  :returns nil
  :doc "Enables DOM agent for the given page." :experimental nil :deprecated nil)

(define-domain-command focus
  :method "DOM.focus"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Identifier of the node.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional t :doc "Identifier of the backend node.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper."))
  :returns nil
  :doc "Focuses the given element." :experimental nil :deprecated nil)

(define-domain-command get-attributes
  :method "DOM.getAttributes"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to retrieve attributes for."))
  :returns (
        (:name :attributes :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "An interleaved array of node attribute names and values."))
  :doc "Returns attributes for the specified node." :experimental nil :deprecated nil)

(define-domain-command get-box-model
  :method "DOM.getBoxModel"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Identifier of the node.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional t :doc "Identifier of the backend node.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper."))
  :returns (
        (:name :model :type :ref :ref "BoxModel" :items nil :optional nil :doc "Box model for the node."))
  :doc "Returns boxes for the given node." :experimental nil :deprecated nil)

(define-domain-command get-content-quads
  :method "DOM.getContentQuads"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Identifier of the node.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional t :doc "Identifier of the backend node.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper."))
  :returns (
        (:name :quads :type :array :ref nil :items (:type :ref :ref "Quad") :optional nil :doc "Quads that describe node layout relative to viewport."))
  :doc "Returns quads that describe node position on the page. This method might return multiple quads for inline nodes." :experimental t :deprecated nil)

(define-domain-command get-document
  :method "DOM.getDocument"
  :params (
        (:name :depth :type :integer :ref nil :items nil :optional t :doc "The maximum depth at which children should be retrieved, defaults to 1. Use -1 for the entire subtree or provide an integer larger than 0.")
        (:name :pierce :type :boolean :ref nil :items nil :optional t :doc "Whether or not iframes and shadow roots should be traversed when returning the subtree (default is false)."))
  :returns (
        (:name :root :type :ref :ref "Node" :items nil :optional nil :doc "Resulting node."))
  :doc "Returns the root DOM node (and optionally the subtree) to the caller. Implicitly enables the DOM domain events for the current target." :experimental nil :deprecated nil)

(define-domain-command get-flattened-document
  :method "DOM.getFlattenedDocument"
  :params (
        (:name :depth :type :integer :ref nil :items nil :optional t :doc "The maximum depth at which children should be retrieved, defaults to 1. Use -1 for the entire subtree or provide an integer larger than 0.")
        (:name :pierce :type :boolean :ref nil :items nil :optional t :doc "Whether or not iframes and shadow roots should be traversed when returning the subtree (default is false)."))
  :returns (
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "Node") :optional nil :doc "Resulting node."))
  :doc "Returns the root DOM node (and optionally the subtree) to the caller. Deprecated, as it is not designed to work well with the rest of the DOM agent. Use DOMSnapshot.captureSnapshot instead." :experimental nil :deprecated t)

(define-domain-command get-nodes-for-subtree-by-style
  :method "DOM.getNodesForSubtreeByStyle"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Node ID pointing to the root of a subtree.")
        (:name :computed-styles :type :array :ref nil :items (:type :ref :ref "CSSComputedStyleProperty") :optional nil :doc "The style to filter nodes by (includes nodes if any of properties matches).")
        (:name :pierce :type :boolean :ref nil :items nil :optional t :doc "Whether or not iframes and shadow roots in the same target should be traversed when returning the results (default is false)."))
  :returns (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc "Resulting nodes."))
  :doc "Finds nodes with a given computed style in a subtree." :experimental t :deprecated nil)

(define-domain-command get-node-for-location
  :method "DOM.getNodeForLocation"
  :params (
        (:name :x :type :integer :ref nil :items nil :optional nil :doc "X coordinate.")
        (:name :y :type :integer :ref nil :items nil :optional nil :doc "Y coordinate.")
        (:name :include-user-agent-shadow-dom :type :boolean :ref nil :items nil :optional t :doc "False to skip to the nearest non-UA shadow root ancestor (default: false).")
        (:name :ignore-pointer-events-none :type :boolean :ref nil :items nil :optional t :doc "Whether to ignore pointer-events: none on elements and hit test them."))
  :returns (
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional nil :doc "Resulting node.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "Frame this node belongs to.")
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Id of the node at given coordinates, only when enabled and requested document."))
  :doc "Returns node id at given location. Depending on whether DOM domain is enabled, nodeId is either returned or not." :experimental nil :deprecated nil)

(define-domain-command get-outer-html
  :method "DOM.getOuterHTML"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Identifier of the node.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional t :doc "Identifier of the backend node.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper.")
        (:name :include-shadow-dom :type :boolean :ref nil :items nil :optional t :doc "Include all shadow roots. Equals to false if not specified."))
  :returns (
        (:name :outer-html :type :string :ref nil :items nil :optional nil :doc "Outer HTML markup."))
  :doc "Returns node's HTML markup." :experimental nil :deprecated nil)

(define-domain-command get-relayout-boundary
  :method "DOM.getRelayoutBoundary"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Relayout boundary node id for the given node."))
  :doc "Returns the id of the nearest ancestor that is a relayout boundary." :experimental t :deprecated nil)

(define-domain-command get-search-results
  :method "DOM.getSearchResults"
  :params (
        (:name :search-id :type :string :ref nil :items nil :optional nil :doc "Unique search session identifier.")
        (:name :from-index :type :integer :ref nil :items nil :optional nil :doc "Start index of the search result to be returned.")
        (:name :to-index :type :integer :ref nil :items nil :optional nil :doc "End index of the search result to be returned."))
  :returns (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc "Ids of the search result nodes."))
  :doc "Returns search results from given `fromIndex` to given `toIndex` from the search with the given identifier." :experimental t :deprecated nil)

(define-domain-command hide-highlight
  :method "DOM.hideHighlight"
  :params nil
  :returns nil
  :doc "Hides any highlight." :experimental nil :deprecated nil)

(define-domain-command highlight-node
  :method "DOM.highlightNode"
  :params nil
  :returns nil
  :doc "Highlights DOM node." :experimental nil :deprecated nil)

(define-domain-command highlight-rect
  :method "DOM.highlightRect"
  :params nil
  :returns nil
  :doc "Highlights given rectangle." :experimental nil :deprecated nil)

(define-domain-command mark-undoable-state
  :method "DOM.markUndoableState"
  :params nil
  :returns nil
  :doc "Marks last undoable state." :experimental t :deprecated nil)

(define-domain-command move-to
  :method "DOM.moveTo"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to move.")
        (:name :target-node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the element to drop the moved node into.")
        (:name :insert-before-node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Drop node before this one (if absent, the moved node becomes the last child of `targetNodeId`)."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "New id of the moved node."))
  :doc "Moves node into the new container, places it before the given anchor." :experimental nil :deprecated nil)

(define-domain-command perform-search
  :method "DOM.performSearch"
  :params (
        (:name :query :type :string :ref nil :items nil :optional nil :doc "Plain text or query selector or XPath search query.")
        (:name :include-user-agent-shadow-dom :type :boolean :ref nil :items nil :optional t :doc "True to search in user agent shadow DOM."))
  :returns (
        (:name :search-id :type :string :ref nil :items nil :optional nil :doc "Unique search session identifier.")
        (:name :result-count :type :integer :ref nil :items nil :optional nil :doc "Number of search results."))
  :doc "Searches for a given string in the DOM tree. Use `getSearchResults` to access search results or `cancelSearch` to end this search session." :experimental t :deprecated nil)

(define-domain-command push-node-by-path-to-frontend
  :method "DOM.pushNodeByPathToFrontend"
  :params (
        (:name :path :type :string :ref nil :items nil :optional nil :doc "Path to node in the proprietary format."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node for given path."))
  :doc "Requests that the node is sent to the caller given its path. // FIXME, use XPath" :experimental t :deprecated nil)

(define-domain-command push-nodes-by-backend-ids-to-frontend
  :method "DOM.pushNodesByBackendIdsToFrontend"
  :params (
        (:name :backend-node-ids :type :array :ref nil :items (:type :ref :ref "BackendNodeId") :optional nil :doc "The array of backend node ids."))
  :returns (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc "The array of ids of pushed nodes that correspond to the backend ids specified in backendNodeIds."))
  :doc "Requests that a batch of nodes is sent to the caller given their backend node ids." :experimental t :deprecated nil)

(define-domain-command query-selector
  :method "DOM.querySelector"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to query upon.")
        (:name :selector :type :string :ref nil :items nil :optional nil :doc "Selector string."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Query selector result."))
  :doc "Executes `querySelector` on a given node." :experimental nil :deprecated nil)

(define-domain-command query-selector-all
  :method "DOM.querySelectorAll"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to query upon.")
        (:name :selector :type :string :ref nil :items nil :optional nil :doc "Selector string."))
  :returns (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc "Query selector result."))
  :doc "Executes `querySelectorAll` on a given node." :experimental nil :deprecated nil)

(define-domain-command get-top-layer-elements
  :method "DOM.getTopLayerElements"
  :params nil
  :returns (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc "NodeIds of top layer elements"))
  :doc "Returns NodeIds of current top layer elements. Top layer is rendered closest to the user within a viewport, therefore its elements always appear on top of all other content." :experimental t :deprecated nil)

(define-domain-command get-element-by-relation
  :method "DOM.getElementByRelation"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node from which to query the relation.")
        (:name :relation :type :string :ref nil :items nil :optional nil :doc "Type of relation to get."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "NodeId of the element matching the queried relation."))
  :doc "Returns the NodeId of the matched element according to certain relations." :experimental t :deprecated nil)

(define-domain-command redo
  :method "DOM.redo"
  :params nil
  :returns nil
  :doc "Re-does the last undone action." :experimental t :deprecated nil)

(define-domain-command remove-attribute
  :method "DOM.removeAttribute"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the element to remove attribute from.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Name of the attribute to remove."))
  :returns nil
  :doc "Removes attribute with given name from an element with given id." :experimental nil :deprecated nil)

(define-domain-command remove-node
  :method "DOM.removeNode"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to remove."))
  :returns nil
  :doc "Removes node with given id." :experimental nil :deprecated nil)

(define-domain-command request-child-nodes
  :method "DOM.requestChildNodes"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to get children for.")
        (:name :depth :type :integer :ref nil :items nil :optional t :doc "The maximum depth at which children should be retrieved, defaults to 1. Use -1 for the entire subtree or provide an integer larger than 0.")
        (:name :pierce :type :boolean :ref nil :items nil :optional t :doc "Whether or not iframes and shadow roots should be traversed when returning the sub-tree (default is false)."))
  :returns nil
  :doc "Requests that children of the node with given id are returned to the caller in form of `setChildNodes` events where not only immediate children are retrieved, but all children down to the specified depth." :experimental nil :deprecated nil)

(define-domain-command request-node
  :method "DOM.requestNode"
  :params (
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional nil :doc "JavaScript object id to convert into node."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Node id for given object."))
  :doc "Requests that the node is sent to the caller given the JavaScript node object reference. All nodes that form the path from the node to the root are also sent to the client as a series of `setChildNodes` notifications." :experimental nil :deprecated nil)

(define-domain-command resolve-node
  :method "DOM.resolveNode"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Id of the node to resolve.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Backend identifier of the node to resolve.")
        (:name :object-group :type :string :ref nil :items nil :optional t :doc "Symbolic group name that can be used to release multiple objects.")
        (:name :execution-context-id :type :ref :ref "Runtime.ExecutionContextId" :items nil :optional t :doc "Execution context in which to resolve the node."))
  :returns (
        (:name :object :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "JavaScript object wrapper for given node."))
  :doc "Resolves the JavaScript node object for a given NodeId or BackendNodeId." :experimental nil :deprecated nil)

(define-domain-command set-attribute-value
  :method "DOM.setAttributeValue"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the element to set attribute for.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Attribute name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Attribute value."))
  :returns nil
  :doc "Sets attribute for an element with given id." :experimental nil :deprecated nil)

(define-domain-command set-attributes-as-text
  :method "DOM.setAttributesAsText"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the element to set attributes for.")
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Text with a number of attributes. Will parse this text using HTML parser.")
        (:name :name :type :string :ref nil :items nil :optional t :doc "Attribute name to replace with new attributes derived from text in case text parsed successfully."))
  :returns nil
  :doc "Sets attributes on element with given id. This method is useful when user edits some existing attribute value and types in several attribute name/value pairs." :experimental nil :deprecated nil)

(define-domain-command set-file-input-files
  :method "DOM.setFileInputFiles"
  :params (
        (:name :files :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Array of file paths to set.")
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Identifier of the node.")
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional t :doc "Identifier of the backend node.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node wrapper."))
  :returns nil
  :doc "Sets files for the given file input element." :experimental nil :deprecated nil)

(define-domain-command set-node-stack-traces-enabled
  :method "DOM.setNodeStackTracesEnabled"
  :params (
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc "Enable or disable."))
  :returns nil
  :doc "Sets if stack traces should be captured for Nodes. See `Node.getNodeStackTraces`. Default is disabled." :experimental t :deprecated nil)

(define-domain-command get-node-stack-traces
  :method "DOM.getNodeStackTraces"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to get stack traces for."))
  :returns (
        (:name :creation :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "Creation stack trace, if available."))
  :doc "Gets stack traces associated with a Node. As of now, only provides stack trace for Node creation." :experimental t :deprecated nil)

(define-domain-command get-file-info
  :method "DOM.getFileInfo"
  :params (
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional nil :doc "JavaScript object id of the node wrapper."))
  :returns (
        (:name :path :type :string :ref nil :items nil :optional nil :doc ""))
  :doc "Returns file information for the given File wrapper." :experimental t :deprecated nil)

(define-domain-command get-detached-dom-nodes
  :method "DOM.getDetachedDomNodes"
  :params nil
  :returns (
        (:name :detached-nodes :type :array :ref nil :items (:type :ref :ref "DetachedElementInfo") :optional nil :doc "The list of detached nodes"))
  :doc "Returns list of detached nodes" :experimental t :deprecated nil)

(define-domain-command set-inspected-node
  :method "DOM.setInspectedNode"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "DOM node id to be accessible by means of $x command line API."))
  :returns nil
  :doc "Enables console to refer to the node with given id via $x (see Command Line API for more details $x functions)." :experimental t :deprecated nil)

(define-domain-command set-node-name
  :method "DOM.setNodeName"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to set name for.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "New node's name."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "New node's id."))
  :doc "Sets node name for a node with given id." :experimental nil :deprecated nil)

(define-domain-command set-node-value
  :method "DOM.setNodeValue"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to set value for.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "New node's value."))
  :returns nil
  :doc "Sets node value for a node with given id." :experimental nil :deprecated nil)

(define-domain-command set-outer-html
  :method "DOM.setOuterHTML"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node to set markup for.")
        (:name :outer-html :type :string :ref nil :items nil :optional nil :doc "Outer HTML markup to set."))
  :returns nil
  :doc "Sets node HTML markup, returns new node id." :experimental nil :deprecated nil)

(define-domain-command undo
  :method "DOM.undo"
  :params nil
  :returns nil
  :doc "Undoes the last performed action." :experimental t :deprecated nil)

(define-domain-command get-frame-owner
  :method "DOM.getFrameOwner"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc ""))
  :returns (
        (:name :backend-node-id :type :ref :ref "BackendNodeId" :items nil :optional nil :doc "Resulting node.")
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "Id of the node at given coordinates, only when enabled and requested document."))
  :doc "Returns iframe node that owns iframe with the given domain." :experimental t :deprecated nil)

(define-domain-command get-container-for-node
  :method "DOM.getContainerForNode"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "")
        (:name :container-name :type :string :ref nil :items nil :optional t :doc "")
        (:name :physical-axes :type :ref :ref "PhysicalAxes" :items nil :optional t :doc "")
        (:name :logical-axes :type :ref :ref "LogicalAxes" :items nil :optional t :doc "")
        (:name :queries-scroll-state :type :boolean :ref nil :items nil :optional t :doc "")
        (:name :queries-anchored :type :boolean :ref nil :items nil :optional t :doc ""))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional t :doc "The container node for the given node, or null if not found."))
  :doc "Returns the query container of the given node based on container query conditions: containerName, physical and logical axes, and whether it queries scroll-state or anchored elements. If no axes are provided and queriesScrollState is false, the style container is returned, which is the direct parent or the closest element with a matching container-name." :experimental t :deprecated nil)

(define-domain-command get-querying-descendants-for-container
  :method "DOM.getQueryingDescendantsForContainer"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the container node to find querying descendants from."))
  :returns (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc "Descendant nodes with container queries against the given container."))
  :doc "Returns the descendants of a container query container that have container queries against this container." :experimental t :deprecated nil)

(define-domain-command get-anchor-element
  :method "DOM.getAnchorElement"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the positioned element from which to find the anchor.")
        (:name :anchor-specifier :type :string :ref nil :items nil :optional t :doc "An optional anchor specifier, as defined in https://www.w3.org/TR/css-anchor-position-1/#anchor-specifier. If not provided, it will return the implicit anchor element for the given positioned element."))
  :returns (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "The anchor element of the given anchor query."))
  :doc "Returns the target anchor element of the given anchor query according to https://www.w3.org/TR/css-anchor-position-1/#target." :experimental t :deprecated nil)

(define-domain-command force-show-popover
  :method "DOM.forceShowPopover"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the popover HTMLElement")
        (:name :enable :type :boolean :ref nil :items nil :optional nil :doc "If true, opens the popover and keeps it open. If false, closes the popover if it was previously force-opened."))
  :returns (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc "List of popovers that were closed in order to respect popover stacking order."))
  :doc "When enabling, this API force-opens the popover identified by nodeId and keeps it open until disabled." :experimental t :deprecated nil)

(define-domain-event attribute-modified
  :method "DOM.attributeModified"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node that has changed.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Attribute name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Attribute value."))
  :doc "Fired when `Element`'s attribute is modified." :experimental nil :deprecated nil)

(define-domain-event adopted-style-sheets-modified
  :method "DOM.adoptedStyleSheetsModified"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node that has changed.")
        (:name :adopted-style-sheets :type :array :ref nil :items (:type :ref :ref "StyleSheetId") :optional nil :doc "New adoptedStyleSheets array."))
  :doc "Fired when `Element`'s adoptedStyleSheets are modified." :experimental t :deprecated nil)

(define-domain-event attribute-removed
  :method "DOM.attributeRemoved"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node that has changed.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "A ttribute name."))
  :doc "Fired when `Element`'s attribute is removed." :experimental nil :deprecated nil)

(define-domain-event character-data-modified
  :method "DOM.characterDataModified"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node that has changed.")
        (:name :character-data :type :string :ref nil :items nil :optional nil :doc "New text value."))
  :doc "Mirrors `DOMCharacterDataModified` event." :experimental nil :deprecated nil)

(define-domain-event child-node-count-updated
  :method "DOM.childNodeCountUpdated"
  :params (
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node that has changed.")
        (:name :child-node-count :type :integer :ref nil :items nil :optional nil :doc "New node count."))
  :doc "Fired when `Container`'s child node count has changed." :experimental nil :deprecated nil)

(define-domain-event child-node-inserted
  :method "DOM.childNodeInserted"
  :params (
        (:name :parent-node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node that has changed.")
        (:name :previous-node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the previous sibling.")
        (:name :node :type :ref :ref "Node" :items nil :optional nil :doc "Inserted node data."))
  :doc "Mirrors `DOMNodeInserted` event." :experimental nil :deprecated nil)

(define-domain-event child-node-removed
  :method "DOM.childNodeRemoved"
  :params (
        (:name :parent-node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Parent id.")
        (:name :node-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Id of the node that has been removed."))
  :doc "Mirrors `DOMNodeRemoved` event." :experimental nil :deprecated nil)

(define-domain-event distributed-nodes-updated
  :method "DOM.distributedNodesUpdated"
  :params (
        (:name :insertion-point-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Insertion point where distributed nodes were updated.")
        (:name :distributed-nodes :type :array :ref nil :items (:type :ref :ref "BackendNode") :optional nil :doc "Distributed nodes for given insertion point."))
  :doc "Called when distribution is changed." :experimental t :deprecated nil)

(define-domain-event document-updated
  :method "DOM.documentUpdated"
  :params nil
  :doc "Fired when `Document` has been totally updated. Node ids are no longer valid." :experimental nil :deprecated nil)

(define-domain-event inline-style-invalidated
  :method "DOM.inlineStyleInvalidated"
  :params (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "NodeId") :optional nil :doc "Ids of the nodes for which the inline styles have been invalidated."))
  :doc "Fired when `Element`'s inline style is modified via a CSS property modification." :experimental t :deprecated nil)

(define-domain-event pseudo-element-added
  :method "DOM.pseudoElementAdded"
  :params (
        (:name :parent-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Pseudo element's parent element id.")
        (:name :pseudo-element :type :ref :ref "Node" :items nil :optional nil :doc "The added pseudo element."))
  :doc "Called when a pseudo element is added to an element." :experimental t :deprecated nil)

(define-domain-event top-layer-elements-updated
  :method "DOM.topLayerElementsUpdated"
  :params nil
  :doc "Called when top layer elements are changed." :experimental t :deprecated nil)

(define-domain-event scrollable-flag-updated
  :method "DOM.scrollableFlagUpdated"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "The id of the node.")
        (:name :is-scrollable :type :boolean :ref nil :items nil :optional nil :doc "If the node is scrollable."))
  :doc "Fired when a node's scrollability state changes." :experimental t :deprecated nil)

(define-domain-event ad-related-state-updated
  :method "DOM.adRelatedStateUpdated"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "The id of the node.")
        (:name :is-ad-related :type :boolean :ref nil :items nil :optional nil :doc "If the node is ad related."))
  :doc "Fired when a node's ad related state changes." :experimental t :deprecated nil)

(define-domain-event affected-by-starting-styles-flag-updated
  :method "DOM.affectedByStartingStylesFlagUpdated"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "The id of the node.")
        (:name :affected-by-starting-styles :type :boolean :ref nil :items nil :optional nil :doc "If the node has starting styles."))
  :doc "Fired when a node's starting styles changes." :experimental t :deprecated nil)

(define-domain-event pseudo-element-removed
  :method "DOM.pseudoElementRemoved"
  :params (
        (:name :parent-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Pseudo element's parent element id.")
        (:name :pseudo-element-id :type :ref :ref "NodeId" :items nil :optional nil :doc "The removed pseudo element id."))
  :doc "Called when a pseudo element is removed from an element." :experimental t :deprecated nil)

(define-domain-event set-child-nodes
  :method "DOM.setChildNodes"
  :params (
        (:name :parent-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Parent node id to populate with children.")
        (:name :nodes :type :array :ref nil :items (:type :ref :ref "Node") :optional nil :doc "Child nodes array."))
  :doc "Fired when backend wants to provide client with the missing DOM structure. This happens upon most of the calls requesting node ids." :experimental nil :deprecated nil)

(define-domain-event shadow-root-popped
  :method "DOM.shadowRootPopped"
  :params (
        (:name :host-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Host element id.")
        (:name :root-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Shadow root id."))
  :doc "Called when shadow root is popped from the element." :experimental t :deprecated nil)

(define-domain-event shadow-root-pushed
  :method "DOM.shadowRootPushed"
  :params (
        (:name :host-id :type :ref :ref "NodeId" :items nil :optional nil :doc "Host element id.")
        (:name :root :type :ref :ref "Node" :items nil :optional nil :doc "Shadow root."))
  :doc "Called when shadow root is pushed into the element." :experimental t :deprecated nil)

