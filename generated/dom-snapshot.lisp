;;;; DOMSnapshot CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/dom-snapshot
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

(in-package #:cdp/dom-snapshot)

(define-domain-type dom-node
  :cdp-id "DOMNode" :type :object
  :properties (
        (:name :node-type :type :integer :ref nil :items nil :optional nil :doc "`Node`'s nodeType.")
        (:name :node-name :type :string :ref nil :items nil :optional nil :doc "`Node`'s nodeName.")
        (:name :node-value :type :string :ref nil :items nil :optional nil :doc "`Node`'s nodeValue.")
        (:name :text-value :type :string :ref nil :items nil :optional t :doc "Only set for textarea elements, contains the text value.")
        (:name :input-value :type :string :ref nil :items nil :optional t :doc "Only set for input elements, contains the input's associated text value.")
        (:name :input-checked :type :boolean :ref nil :items nil :optional t :doc "Only set for radio and checkbox input elements, indicates if the element has been checked")
        (:name :option-selected :type :boolean :ref nil :items nil :optional t :doc "Only set for option elements, indicates if the element has been selected")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "`Node`'s id, corresponds to DOM.Node.backendNodeId.")
        (:name :child-node-indexes :type :array :ref nil :items (:type :integer :ref nil) :optional t :doc "The indexes of the node's child nodes in the `domNodes` array returned by `getSnapshot`, if any.")
        (:name :attributes :type :array :ref nil :items (:type :ref :ref "NameValue") :optional t :doc "Attributes of an `Element` node.")
        (:name :pseudo-element-indexes :type :array :ref nil :items (:type :integer :ref nil) :optional t :doc "Indexes of pseudo elements associated with this node in the `domNodes` array returned by `getSnapshot`, if any.")
        (:name :layout-node-index :type :integer :ref nil :items nil :optional t :doc "The index of the node's related layout tree node in the `layoutTreeNodes` array returned by `getSnapshot`, if any.")
        (:name :document-url :type :string :ref nil :items nil :optional t :doc "Document URL that `Document` or `FrameOwner` node points to.")
        (:name :base-url :type :string :ref nil :items nil :optional t :doc "Base URL that `Document` or `FrameOwner` node uses for URL completion.")
        (:name :content-language :type :string :ref nil :items nil :optional t :doc "Only set for documents, contains the document's content language.")
        (:name :document-encoding :type :string :ref nil :items nil :optional t :doc "Only set for documents, contains the document's character set encoding.")
        (:name :public-id :type :string :ref nil :items nil :optional t :doc "`DocumentType` node's publicId.")
        (:name :system-id :type :string :ref nil :items nil :optional t :doc "`DocumentType` node's systemId.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional t :doc "Frame ID for frame owner elements and also for the document node.")
        (:name :content-document-index :type :integer :ref nil :items nil :optional t :doc "The index of a frame owner element's content document in the `domNodes` array returned by `getSnapshot`, if any.")
        (:name :pseudo-type :type :ref :ref "DOM.PseudoType" :items nil :optional t :doc "Type of a pseudo element node.")
        (:name :shadow-root-type :type :ref :ref "DOM.ShadowRootType" :items nil :optional t :doc "Shadow root type.")
        (:name :is-clickable :type :boolean :ref nil :items nil :optional t :doc "Whether this DOM node responds to mouse clicks. This includes nodes that have had click event listeners attached via JavaScript as well as anchor tags that naturally navigate when clicked.")
        (:name :event-listeners :type :array :ref nil :items (:type :ref :ref "DOMDebugger.EventListener") :optional t :doc "Details of the node's event listeners, if any.")
        (:name :current-source-url :type :string :ref nil :items nil :optional t :doc "The selected url for nodes with a srcset attribute.")
        (:name :origin-url :type :string :ref nil :items nil :optional t :doc "The url of the script (if any) that generates this node.")
        (:name :scroll-offset-x :type :number :ref nil :items nil :optional t :doc "Scroll offsets, set when this node is a Document.")
        (:name :scroll-offset-y :type :number :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "A Node in the DOM tree." :experimental nil :deprecated nil)

(define-domain-type inline-text-box
  :cdp-id "InlineTextBox" :type :object
  :properties (
        (:name :bounding-box :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "The bounding box in document coordinates. Note that scroll offset of the document is ignored.")
        (:name :start-character-index :type :integer :ref nil :items nil :optional nil :doc "The starting index in characters, for this post layout textbox substring. Characters that would be represented as a surrogate pair in UTF-16 have length 2.")
        (:name :num-characters :type :integer :ref nil :items nil :optional nil :doc "The number of characters in this post layout textbox substring. Characters that would be represented as a surrogate pair in UTF-16 have length 2."))
  :enum nil
  :doc "Details of post layout rendered text positions. The exact layout should not be regarded as stable and may change between versions." :experimental nil :deprecated nil)

(define-domain-type layout-tree-node
  :cdp-id "LayoutTreeNode" :type :object
  :properties (
        (:name :dom-node-index :type :integer :ref nil :items nil :optional nil :doc "The index of the related DOM node in the `domNodes` array returned by `getSnapshot`.")
        (:name :bounding-box :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "The bounding box in document coordinates. Note that scroll offset of the document is ignored.")
        (:name :layout-text :type :string :ref nil :items nil :optional t :doc "Contents of the LayoutText, if any.")
        (:name :inline-text-nodes :type :array :ref nil :items (:type :ref :ref "InlineTextBox") :optional t :doc "The post-layout inline text nodes, if any.")
        (:name :style-index :type :integer :ref nil :items nil :optional t :doc "Index into the `computedStyles` array returned by `getSnapshot`.")
        (:name :paint-order :type :integer :ref nil :items nil :optional t :doc "Global paint order index, which is determined by the stacking order of the nodes. Nodes that are painted together will have the same index. Only provided if includePaintOrder in getSnapshot was true.")
        (:name :is-stacking-context :type :boolean :ref nil :items nil :optional t :doc "Set to true to indicate the element begins a new stacking context."))
  :enum nil
  :doc "Details of an element in the DOM tree with a LayoutObject." :experimental nil :deprecated nil)

(define-domain-type computed-style
  :cdp-id "ComputedStyle" :type :object
  :properties (
        (:name :properties :type :array :ref nil :items (:type :ref :ref "NameValue") :optional nil :doc "Name/value pairs of computed style properties."))
  :enum nil
  :doc "A subset of the full ComputedStyle as defined by the request whitelist." :experimental nil :deprecated nil)

(define-domain-type name-value
  :cdp-id "NameValue" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Attribute/property name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Attribute/property value."))
  :enum nil
  :doc "A name/value pair." :experimental nil :deprecated nil)

(define-domain-type string-index
  :cdp-id "StringIndex" :type :integer
  :properties nil
  :enum nil
  :doc "Index of the string in the strings table." :experimental nil :deprecated nil)

(define-domain-type array-of-strings
  :cdp-id "ArrayOfStrings" :type :array
  :properties nil
  :enum nil
  :doc "Index of the string in the strings table." :experimental nil :deprecated nil)

(define-domain-type rare-string-data
  :cdp-id "RareStringData" :type :object
  :properties (
        (:name :index :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "")
        (:name :value :type :array :ref nil :items (:type :ref :ref "StringIndex") :optional nil :doc ""))
  :enum nil
  :doc "Data that is only present on rare nodes." :experimental nil :deprecated nil)

(define-domain-type rare-boolean-data
  :cdp-id "RareBooleanData" :type :object
  :properties (
        (:name :index :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type rare-integer-data
  :cdp-id "RareIntegerData" :type :object
  :properties (
        (:name :index :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "")
        (:name :value :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type rectangle
  :cdp-id "Rectangle" :type :array
  :properties nil
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type document-snapshot
  :cdp-id "DocumentSnapshot" :type :object
  :properties (
        (:name :document-url :type :ref :ref "StringIndex" :items nil :optional nil :doc "Document URL that `Document` or `FrameOwner` node points to.")
        (:name :title :type :ref :ref "StringIndex" :items nil :optional nil :doc "Document title.")
        (:name :base-url :type :ref :ref "StringIndex" :items nil :optional nil :doc "Base URL that `Document` or `FrameOwner` node uses for URL completion.")
        (:name :content-language :type :ref :ref "StringIndex" :items nil :optional nil :doc "Contains the document's content language.")
        (:name :encoding-name :type :ref :ref "StringIndex" :items nil :optional nil :doc "Contains the document's character set encoding.")
        (:name :public-id :type :ref :ref "StringIndex" :items nil :optional nil :doc "`DocumentType` node's publicId.")
        (:name :system-id :type :ref :ref "StringIndex" :items nil :optional nil :doc "`DocumentType` node's systemId.")
        (:name :frame-id :type :ref :ref "StringIndex" :items nil :optional nil :doc "Frame ID for frame owner elements and also for the document node.")
        (:name :nodes :type :ref :ref "NodeTreeSnapshot" :items nil :optional nil :doc "A table with dom nodes.")
        (:name :layout :type :ref :ref "LayoutTreeSnapshot" :items nil :optional nil :doc "The nodes in the layout tree.")
        (:name :text-boxes :type :ref :ref "TextBoxSnapshot" :items nil :optional nil :doc "The post-layout inline text nodes.")
        (:name :scroll-offset-x :type :number :ref nil :items nil :optional t :doc "Horizontal scroll offset.")
        (:name :scroll-offset-y :type :number :ref nil :items nil :optional t :doc "Vertical scroll offset.")
        (:name :content-width :type :number :ref nil :items nil :optional t :doc "Document content width.")
        (:name :content-height :type :number :ref nil :items nil :optional t :doc "Document content height."))
  :enum nil
  :doc "Document snapshot." :experimental nil :deprecated nil)

(define-domain-type node-tree-snapshot
  :cdp-id "NodeTreeSnapshot" :type :object
  :properties (
        (:name :parent-index :type :array :ref nil :items (:type :integer :ref nil) :optional t :doc "Parent node index.")
        (:name :node-type :type :array :ref nil :items (:type :integer :ref nil) :optional t :doc "`Node`'s nodeType.")
        (:name :shadow-root-type :type :ref :ref "RareStringData" :items nil :optional t :doc "Type of the shadow root the `Node` is in. String values are equal to the `ShadowRootType` enum.")
        (:name :node-name :type :array :ref nil :items (:type :ref :ref "StringIndex") :optional t :doc "`Node`'s nodeName.")
        (:name :node-value :type :array :ref nil :items (:type :ref :ref "StringIndex") :optional t :doc "`Node`'s nodeValue.")
        (:name :backend-node-id :type :array :ref nil :items (:type :ref :ref "DOM.BackendNodeId") :optional t :doc "`Node`'s id, corresponds to DOM.Node.backendNodeId.")
        (:name :attributes :type :array :ref nil :items (:type :ref :ref "ArrayOfStrings") :optional t :doc "Attributes of an `Element` node. Flatten name, value pairs.")
        (:name :text-value :type :ref :ref "RareStringData" :items nil :optional t :doc "Only set for textarea elements, contains the text value.")
        (:name :input-value :type :ref :ref "RareStringData" :items nil :optional t :doc "Only set for input elements, contains the input's associated text value.")
        (:name :input-checked :type :ref :ref "RareBooleanData" :items nil :optional t :doc "Only set for radio and checkbox input elements, indicates if the element has been checked")
        (:name :option-selected :type :ref :ref "RareBooleanData" :items nil :optional t :doc "Only set for option elements, indicates if the element has been selected")
        (:name :content-document-index :type :ref :ref "RareIntegerData" :items nil :optional t :doc "The index of the document in the list of the snapshot documents.")
        (:name :pseudo-type :type :ref :ref "RareStringData" :items nil :optional t :doc "Type of a pseudo element node.")
        (:name :pseudo-identifier :type :ref :ref "RareStringData" :items nil :optional t :doc "Pseudo element identifier for this node. Only present if there is a valid pseudoType.")
        (:name :is-clickable :type :ref :ref "RareBooleanData" :items nil :optional t :doc "Whether this DOM node responds to mouse clicks. This includes nodes that have had click event listeners attached via JavaScript as well as anchor tags that naturally navigate when clicked.")
        (:name :current-source-url :type :ref :ref "RareStringData" :items nil :optional t :doc "The selected url for nodes with a srcset attribute.")
        (:name :origin-url :type :ref :ref "RareStringData" :items nil :optional t :doc "The url of the script (if any) that generates this node."))
  :enum nil
  :doc "Table containing nodes." :experimental nil :deprecated nil)

(define-domain-type layout-tree-snapshot
  :cdp-id "LayoutTreeSnapshot" :type :object
  :properties (
        (:name :node-index :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "Index of the corresponding node in the `NodeTreeSnapshot` array returned by `captureSnapshot`.")
        (:name :styles :type :array :ref nil :items (:type :ref :ref "ArrayOfStrings") :optional nil :doc "Array of indexes specifying computed style strings, filtered according to the `computedStyles` parameter passed to `captureSnapshot`.")
        (:name :bounds :type :array :ref nil :items (:type :ref :ref "Rectangle") :optional nil :doc "The absolute position bounding box.")
        (:name :text :type :array :ref nil :items (:type :ref :ref "StringIndex") :optional nil :doc "Contents of the LayoutText, if any.")
        (:name :stacking-contexts :type :ref :ref "RareBooleanData" :items nil :optional nil :doc "Stacking context information.")
        (:name :paint-orders :type :array :ref nil :items (:type :integer :ref nil) :optional t :doc "Global paint order index, which is determined by the stacking order of the nodes. Nodes that are painted together will have the same index. Only provided if includePaintOrder in captureSnapshot was true.")
        (:name :offset-rects :type :array :ref nil :items (:type :ref :ref "Rectangle") :optional t :doc "The offset rect of nodes. Only available when includeDOMRects is set to true")
        (:name :scroll-rects :type :array :ref nil :items (:type :ref :ref "Rectangle") :optional t :doc "The scroll rect of nodes. Only available when includeDOMRects is set to true")
        (:name :client-rects :type :array :ref nil :items (:type :ref :ref "Rectangle") :optional t :doc "The client rect of nodes. Only available when includeDOMRects is set to true")
        (:name :blended-background-colors :type :array :ref nil :items (:type :ref :ref "StringIndex") :optional t :doc "The list of background colors that are blended with colors of overlapping elements.")
        (:name :text-color-opacities :type :array :ref nil :items (:type :number :ref nil) :optional t :doc "The list of computed text opacities."))
  :enum nil
  :doc "Table of details of an element in the DOM tree with a LayoutObject." :experimental nil :deprecated nil)

(define-domain-type text-box-snapshot
  :cdp-id "TextBoxSnapshot" :type :object
  :properties (
        (:name :layout-index :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "Index of the layout tree node that owns this box collection.")
        (:name :bounds :type :array :ref nil :items (:type :ref :ref "Rectangle") :optional nil :doc "The absolute position bounding box.")
        (:name :start :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "The starting index in characters, for this post layout textbox substring. Characters that would be represented as a surrogate pair in UTF-16 have length 2.")
        (:name :length :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "The number of characters in this post layout textbox substring. Characters that would be represented as a surrogate pair in UTF-16 have length 2."))
  :enum nil
  :doc "Table of details of the post layout rendered text positions. The exact layout should not be regarded as stable and may change between versions." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "DOMSnapshot.disable"
  :params nil
  :returns nil
  :doc "Disables DOM snapshot agent for the given page." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "DOMSnapshot.enable"
  :params nil
  :returns nil
  :doc "Enables DOM snapshot agent for the given page." :experimental nil :deprecated nil)

(define-domain-command get-snapshot
  :method "DOMSnapshot.getSnapshot"
  :params (
        (:name :computed-style-whitelist :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Whitelist of computed styles to return.")
        (:name :include-event-listeners :type :boolean :ref nil :items nil :optional t :doc "Whether or not to retrieve details of DOM listeners (default false).")
        (:name :include-paint-order :type :boolean :ref nil :items nil :optional t :doc "Whether to determine and include the paint order index of LayoutTreeNodes (default false).")
        (:name :include-user-agent-shadow-tree :type :boolean :ref nil :items nil :optional t :doc "Whether to include UA shadow tree in the snapshot (default false)."))
  :returns (
        (:name :dom-nodes :type :array :ref nil :items (:type :ref :ref "DOMNode") :optional nil :doc "The nodes in the DOM tree. The DOMNode at index 0 corresponds to the root document.")
        (:name :layout-tree-nodes :type :array :ref nil :items (:type :ref :ref "LayoutTreeNode") :optional nil :doc "The nodes in the layout tree.")
        (:name :computed-styles :type :array :ref nil :items (:type :ref :ref "ComputedStyle") :optional nil :doc "Whitelisted ComputedStyle properties for each node in the layout tree."))
  :doc "Returns a document snapshot, including the full DOM tree of the root node (including iframes, template contents, and imported documents) in a flattened array, as well as layout and white-listed computed style information for the nodes. Shadow DOM in the returned DOM tree is flattened." :experimental nil :deprecated t)

(define-domain-command capture-snapshot
  :method "DOMSnapshot.captureSnapshot"
  :params (
        (:name :computed-styles :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Whitelist of computed styles to return.")
        (:name :include-paint-order :type :boolean :ref nil :items nil :optional t :doc "Whether to include layout object paint orders into the snapshot.")
        (:name :include-dom-rects :type :boolean :ref nil :items nil :optional t :doc "Whether to include DOM rectangles (offsetRects, clientRects, scrollRects) into the snapshot")
        (:name :include-blended-background-colors :type :boolean :ref nil :items nil :optional t :doc "Whether to include blended background colors in the snapshot (default: false). Blended background color is achieved by blending background colors of all elements that overlap with the current element.")
        (:name :include-text-color-opacities :type :boolean :ref nil :items nil :optional t :doc "Whether to include text color opacity in the snapshot (default: false). An element might have the opacity property set that affects the text color of the element. The final text color opacity is computed based on the opacity of all overlapping elements."))
  :returns (
        (:name :documents :type :array :ref nil :items (:type :ref :ref "DocumentSnapshot") :optional nil :doc "The nodes in the DOM tree. The DOMNode at index 0 corresponds to the root document.")
        (:name :strings :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Shared string table that all string properties refer to with indexes."))
  :doc "Returns a document snapshot, including the full DOM tree of the root node (including iframes, template contents, and imported documents) in a flattened array, as well as layout and white-listed computed style information for the nodes. Shadow DOM in the returned DOM tree is flattened." :experimental nil :deprecated nil)

