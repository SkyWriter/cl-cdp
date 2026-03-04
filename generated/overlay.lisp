;;;; Overlay CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/overlay
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

(in-package #:cdp/overlay)

(define-domain-type source-order-config
  :cdp-id "SourceOrderConfig" :type :object
  :properties (
        (:name :parent-outline-color :type :ref :ref "DOM.RGBA" :items nil :optional nil :doc "the color to outline the given element in.")
        (:name :child-outline-color :type :ref :ref "DOM.RGBA" :items nil :optional nil :doc "the color to outline the child elements in."))
  :enum nil
  :doc "Configuration data for drawing the source order of an elements children." :experimental nil :deprecated nil)

(define-domain-type grid-highlight-config
  :cdp-id "GridHighlightConfig" :type :object
  :properties (
        (:name :show-grid-extension-lines :type :boolean :ref nil :items nil :optional t :doc "Whether the extension lines from grid cells to the rulers should be shown (default: false).")
        (:name :show-positive-line-numbers :type :boolean :ref nil :items nil :optional t :doc "Show Positive line number labels (default: false).")
        (:name :show-negative-line-numbers :type :boolean :ref nil :items nil :optional t :doc "Show Negative line number labels (default: false).")
        (:name :show-area-names :type :boolean :ref nil :items nil :optional t :doc "Show area name labels (default: false).")
        (:name :show-line-names :type :boolean :ref nil :items nil :optional t :doc "Show line name labels (default: false).")
        (:name :show-track-sizes :type :boolean :ref nil :items nil :optional t :doc "Show track size labels (default: false).")
        (:name :grid-border-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The grid container border highlight color (default: transparent).")
        (:name :cell-border-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The cell border color (default: transparent). Deprecated, please use rowLineColor and columnLineColor instead.")
        (:name :row-line-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The row line color (default: transparent).")
        (:name :column-line-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The column line color (default: transparent).")
        (:name :grid-border-dash :type :boolean :ref nil :items nil :optional t :doc "Whether the grid border is dashed (default: false).")
        (:name :cell-border-dash :type :boolean :ref nil :items nil :optional t :doc "Whether the cell border is dashed (default: false). Deprecated, please us rowLineDash and columnLineDash instead.")
        (:name :row-line-dash :type :boolean :ref nil :items nil :optional t :doc "Whether row lines are dashed (default: false).")
        (:name :column-line-dash :type :boolean :ref nil :items nil :optional t :doc "Whether column lines are dashed (default: false).")
        (:name :row-gap-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The row gap highlight fill color (default: transparent).")
        (:name :row-hatch-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The row gap hatching fill color (default: transparent).")
        (:name :column-gap-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The column gap highlight fill color (default: transparent).")
        (:name :column-hatch-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The column gap hatching fill color (default: transparent).")
        (:name :area-border-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The named grid areas border color (Default: transparent).")
        (:name :grid-background-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The grid container background color (Default: transparent)."))
  :enum nil
  :doc "Configuration data for the highlighting of Grid elements." :experimental nil :deprecated nil)

(define-domain-type flex-container-highlight-config
  :cdp-id "FlexContainerHighlightConfig" :type :object
  :properties (
        (:name :container-border :type :ref :ref "LineStyle" :items nil :optional t :doc "The style of the container border")
        (:name :line-separator :type :ref :ref "LineStyle" :items nil :optional t :doc "The style of the separator between lines")
        (:name :item-separator :type :ref :ref "LineStyle" :items nil :optional t :doc "The style of the separator between items")
        (:name :main-distributed-space :type :ref :ref "BoxStyle" :items nil :optional t :doc "Style of content-distribution space on the main axis (justify-content).")
        (:name :cross-distributed-space :type :ref :ref "BoxStyle" :items nil :optional t :doc "Style of content-distribution space on the cross axis (align-content).")
        (:name :row-gap-space :type :ref :ref "BoxStyle" :items nil :optional t :doc "Style of empty space caused by row gaps (gap/row-gap).")
        (:name :column-gap-space :type :ref :ref "BoxStyle" :items nil :optional t :doc "Style of empty space caused by columns gaps (gap/column-gap).")
        (:name :cross-alignment :type :ref :ref "LineStyle" :items nil :optional t :doc "Style of the self-alignment line (align-items)."))
  :enum nil
  :doc "Configuration data for the highlighting of Flex container elements." :experimental nil :deprecated nil)

(define-domain-type flex-item-highlight-config
  :cdp-id "FlexItemHighlightConfig" :type :object
  :properties (
        (:name :base-size-box :type :ref :ref "BoxStyle" :items nil :optional t :doc "Style of the box representing the item's base size")
        (:name :base-size-border :type :ref :ref "LineStyle" :items nil :optional t :doc "Style of the border around the box representing the item's base size")
        (:name :flexibility-arrow :type :ref :ref "LineStyle" :items nil :optional t :doc "Style of the arrow representing if the item grew or shrank"))
  :enum nil
  :doc "Configuration data for the highlighting of Flex item elements." :experimental nil :deprecated nil)

(define-domain-type line-style
  :cdp-id "LineStyle" :type :object
  :properties (
        (:name :color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The color of the line (default: transparent)")
        (:name :pattern :type :string :ref nil :items nil :optional t :doc "The line pattern (default: solid)"))
  :enum nil
  :doc "Style information for drawing a line." :experimental nil :deprecated nil)

(define-domain-type box-style
  :cdp-id "BoxStyle" :type :object
  :properties (
        (:name :fill-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The background color for the box (default: transparent)")
        (:name :hatch-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The hatching color for the box (default: transparent)"))
  :enum nil
  :doc "Style information for drawing a box." :experimental nil :deprecated nil)

(define-domain-type contrast-algorithm
  :cdp-id "ContrastAlgorithm" :type :string
  :properties nil
  :enum '("aa" "aaa" "apca")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type highlight-config
  :cdp-id "HighlightConfig" :type :object
  :properties (
        (:name :show-info :type :boolean :ref nil :items nil :optional t :doc "Whether the node info tooltip should be shown (default: false).")
        (:name :show-styles :type :boolean :ref nil :items nil :optional t :doc "Whether the node styles in the tooltip (default: false).")
        (:name :show-rulers :type :boolean :ref nil :items nil :optional t :doc "Whether the rulers should be shown (default: false).")
        (:name :show-accessibility-info :type :boolean :ref nil :items nil :optional t :doc "Whether the a11y info should be shown (default: true).")
        (:name :show-extension-lines :type :boolean :ref nil :items nil :optional t :doc "Whether the extension lines from node to the rulers should be shown (default: false).")
        (:name :content-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The content box highlight fill color (default: transparent).")
        (:name :padding-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The padding highlight fill color (default: transparent).")
        (:name :border-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The border highlight fill color (default: transparent).")
        (:name :margin-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The margin highlight fill color (default: transparent).")
        (:name :event-target-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The event target element highlight fill color (default: transparent).")
        (:name :shape-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The shape outside fill color (default: transparent).")
        (:name :shape-margin-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The shape margin fill color (default: transparent).")
        (:name :css-grid-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The grid layout color (default: transparent).")
        (:name :color-format :type :ref :ref "ColorFormat" :items nil :optional t :doc "The color format used to format color styles (default: hex).")
        (:name :grid-highlight-config :type :ref :ref "GridHighlightConfig" :items nil :optional t :doc "The grid layout highlight configuration (default: all transparent).")
        (:name :flex-container-highlight-config :type :ref :ref "FlexContainerHighlightConfig" :items nil :optional t :doc "The flex container highlight configuration (default: all transparent).")
        (:name :flex-item-highlight-config :type :ref :ref "FlexItemHighlightConfig" :items nil :optional t :doc "The flex item highlight configuration (default: all transparent).")
        (:name :contrast-algorithm :type :ref :ref "ContrastAlgorithm" :items nil :optional t :doc "The contrast algorithm to use for the contrast ratio (default: aa).")
        (:name :container-query-container-highlight-config :type :ref :ref "ContainerQueryContainerHighlightConfig" :items nil :optional t :doc "The container query container highlight configuration (default: all transparent)."))
  :enum nil
  :doc "Configuration data for the highlighting of page elements." :experimental nil :deprecated nil)

(define-domain-type color-format
  :cdp-id "ColorFormat" :type :string
  :properties nil
  :enum '("rgb" "hsl" "hwb" "hex")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type grid-node-highlight-config
  :cdp-id "GridNodeHighlightConfig" :type :object
  :properties (
        (:name :grid-highlight-config :type :ref :ref "GridHighlightConfig" :items nil :optional nil :doc "A descriptor for the highlight appearance.")
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Identifier of the node to highlight."))
  :enum nil
  :doc "Configurations for Persistent Grid Highlight" :experimental nil :deprecated nil)

(define-domain-type flex-node-highlight-config
  :cdp-id "FlexNodeHighlightConfig" :type :object
  :properties (
        (:name :flex-container-highlight-config :type :ref :ref "FlexContainerHighlightConfig" :items nil :optional nil :doc "A descriptor for the highlight appearance of flex containers.")
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Identifier of the node to highlight."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type scroll-snap-container-highlight-config
  :cdp-id "ScrollSnapContainerHighlightConfig" :type :object
  :properties (
        (:name :snapport-border :type :ref :ref "LineStyle" :items nil :optional t :doc "The style of the snapport border (default: transparent)")
        (:name :snap-area-border :type :ref :ref "LineStyle" :items nil :optional t :doc "The style of the snap area border (default: transparent)")
        (:name :scroll-margin-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The margin highlight fill color (default: transparent).")
        (:name :scroll-padding-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The padding highlight fill color (default: transparent)."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type scroll-snap-highlight-config
  :cdp-id "ScrollSnapHighlightConfig" :type :object
  :properties (
        (:name :scroll-snap-container-highlight-config :type :ref :ref "ScrollSnapContainerHighlightConfig" :items nil :optional nil :doc "A descriptor for the highlight appearance of scroll snap containers.")
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Identifier of the node to highlight."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type hinge-config
  :cdp-id "HingeConfig" :type :object
  :properties (
        (:name :rect :type :ref :ref "DOM.Rect" :items nil :optional nil :doc "A rectangle represent hinge")
        (:name :content-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The content box highlight fill color (default: a dark color).")
        (:name :outline-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The content box highlight outline color (default: transparent)."))
  :enum nil
  :doc "Configuration for dual screen hinge" :experimental nil :deprecated nil)

(define-domain-type window-controls-overlay-config
  :cdp-id "WindowControlsOverlayConfig" :type :object
  :properties (
        (:name :show-css :type :boolean :ref nil :items nil :optional nil :doc "Whether the title bar CSS should be shown when emulating the Window Controls Overlay.")
        (:name :selected-platform :type :string :ref nil :items nil :optional nil :doc "Selected platforms to show the overlay.")
        (:name :theme-color :type :string :ref nil :items nil :optional nil :doc "The theme color defined in app manifest."))
  :enum nil
  :doc "Configuration for Window Controls Overlay" :experimental nil :deprecated nil)

(define-domain-type container-query-highlight-config
  :cdp-id "ContainerQueryHighlightConfig" :type :object
  :properties (
        (:name :container-query-container-highlight-config :type :ref :ref "ContainerQueryContainerHighlightConfig" :items nil :optional nil :doc "A descriptor for the highlight appearance of container query containers.")
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Identifier of the container node to highlight."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type container-query-container-highlight-config
  :cdp-id "ContainerQueryContainerHighlightConfig" :type :object
  :properties (
        (:name :container-border :type :ref :ref "LineStyle" :items nil :optional t :doc "The style of the container border.")
        (:name :descendant-border :type :ref :ref "LineStyle" :items nil :optional t :doc "The style of the descendants' borders."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type isolated-element-highlight-config
  :cdp-id "IsolatedElementHighlightConfig" :type :object
  :properties (
        (:name :isolation-mode-highlight-config :type :ref :ref "IsolationModeHighlightConfig" :items nil :optional nil :doc "A descriptor for the highlight appearance of an element in isolation mode.")
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Identifier of the isolated element to highlight."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type isolation-mode-highlight-config
  :cdp-id "IsolationModeHighlightConfig" :type :object
  :properties (
        (:name :resizer-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The fill color of the resizers (default: transparent).")
        (:name :resizer-handle-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The fill color for resizer handles (default: transparent).")
        (:name :mask-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The fill color for the mask covering non-isolated elements (default: transparent)."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type inspect-mode
  :cdp-id "InspectMode" :type :string
  :properties nil
  :enum '("searchForNode" "searchForUAShadowDOM" "captureAreaScreenshot" "none")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type inspected-element-anchor-config
  :cdp-id "InspectedElementAnchorConfig" :type :object
  :properties (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "Identifier of the node to highlight.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Identifier of the backend node to highlight."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Overlay.disable"
  :params nil
  :returns nil
  :doc "Disables domain notifications." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Overlay.enable"
  :params nil
  :returns nil
  :doc "Enables domain notifications." :experimental nil :deprecated nil)

(define-domain-command get-highlight-object-for-test
  :method "Overlay.getHighlightObjectForTest"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Id of the node to get highlight object for.")
        (:name :include-distance :type :boolean :ref nil :items nil :optional t :doc "Whether to include distance info.")
        (:name :include-style :type :boolean :ref nil :items nil :optional t :doc "Whether to include style info.")
        (:name :color-format :type :ref :ref "ColorFormat" :items nil :optional t :doc "The color format to get config with (default: hex).")
        (:name :show-accessibility-info :type :boolean :ref nil :items nil :optional t :doc "Whether to show accessibility info (default: true)."))
  :returns (
        (:name :highlight :type :object :ref nil :items nil :optional nil :doc "Highlight data for the node."))
  :doc "For testing." :experimental nil :deprecated nil)

(define-domain-command get-grid-highlight-objects-for-test
  :method "Overlay.getGridHighlightObjectsForTest"
  :params (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "DOM.NodeId") :optional nil :doc "Ids of the node to get highlight object for."))
  :returns (
        (:name :highlights :type :object :ref nil :items nil :optional nil :doc "Grid Highlight data for the node ids provided."))
  :doc "For Persistent Grid testing." :experimental nil :deprecated nil)

(define-domain-command get-source-order-highlight-object-for-test
  :method "Overlay.getSourceOrderHighlightObjectForTest"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Id of the node to highlight."))
  :returns (
        (:name :highlight :type :object :ref nil :items nil :optional nil :doc "Source order highlight data for the node id provided."))
  :doc "For Source Order Viewer testing." :experimental nil :deprecated nil)

(define-domain-command hide-highlight
  :method "Overlay.hideHighlight"
  :params nil
  :returns nil
  :doc "Hides any highlight." :experimental nil :deprecated nil)

(define-domain-command highlight-frame
  :method "Overlay.highlightFrame"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "Identifier of the frame to highlight.")
        (:name :content-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The content box highlight fill color (default: transparent).")
        (:name :content-outline-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The content box highlight outline color (default: transparent)."))
  :returns nil
  :doc "Highlights owner element of the frame with given id. Deprecated: Doesn't work reliably and cannot be fixed due to process separation (the owner node might be in a different process). Determine the owner node in the client and use highlightNode." :experimental nil :deprecated t)

(define-domain-command highlight-node
  :method "Overlay.highlightNode"
  :params (
        (:name :highlight-config :type :ref :ref "HighlightConfig" :items nil :optional nil :doc "A descriptor for the highlight appearance.")
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "Identifier of the node to highlight.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Identifier of the backend node to highlight.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node to be highlighted.")
        (:name :selector :type :string :ref nil :items nil :optional t :doc "Selectors to highlight relevant nodes."))
  :returns nil
  :doc "Highlights DOM node with given id or with the given JavaScript object wrapper. Either nodeId or objectId must be specified." :experimental nil :deprecated nil)

(define-domain-command highlight-quad
  :method "Overlay.highlightQuad"
  :params (
        (:name :quad :type :ref :ref "DOM.Quad" :items nil :optional nil :doc "Quad to highlight")
        (:name :color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The highlight fill color (default: transparent).")
        (:name :outline-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The highlight outline color (default: transparent)."))
  :returns nil
  :doc "Highlights given quad. Coordinates are absolute with respect to the main frame viewport." :experimental nil :deprecated nil)

(define-domain-command highlight-rect
  :method "Overlay.highlightRect"
  :params (
        (:name :x :type :integer :ref nil :items nil :optional nil :doc "X coordinate")
        (:name :y :type :integer :ref nil :items nil :optional nil :doc "Y coordinate")
        (:name :width :type :integer :ref nil :items nil :optional nil :doc "Rectangle width")
        (:name :height :type :integer :ref nil :items nil :optional nil :doc "Rectangle height")
        (:name :color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The highlight fill color (default: transparent).")
        (:name :outline-color :type :ref :ref "DOM.RGBA" :items nil :optional t :doc "The highlight outline color (default: transparent)."))
  :returns nil
  :doc "Highlights given rectangle. Coordinates are absolute with respect to the main frame viewport. Issue: the method does not handle device pixel ratio (DPR) correctly. The coordinates currently have to be adjusted by the client if DPR is not 1 (see crbug.com/437807128)." :experimental nil :deprecated nil)

(define-domain-command highlight-source-order
  :method "Overlay.highlightSourceOrder"
  :params (
        (:name :source-order-config :type :ref :ref "SourceOrderConfig" :items nil :optional nil :doc "A descriptor for the appearance of the overlay drawing.")
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "Identifier of the node to highlight.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Identifier of the backend node to highlight.")
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional t :doc "JavaScript object id of the node to be highlighted."))
  :returns nil
  :doc "Highlights the source order of the children of the DOM node with given id or with the given JavaScript object wrapper. Either nodeId or objectId must be specified." :experimental nil :deprecated nil)

(define-domain-command set-inspect-mode
  :method "Overlay.setInspectMode"
  :params (
        (:name :mode :type :ref :ref "InspectMode" :items nil :optional nil :doc "Set an inspection mode.")
        (:name :highlight-config :type :ref :ref "HighlightConfig" :items nil :optional t :doc "A descriptor for the highlight appearance of hovered-over nodes. May be omitted if `enabled == false`."))
  :returns nil
  :doc "Enters the 'inspect' mode. In this mode, elements that user is hovering over are highlighted. Backend then generates 'inspectNodeRequested' event upon element selection." :experimental nil :deprecated nil)

(define-domain-command set-show-ad-highlights
  :method "Overlay.setShowAdHighlights"
  :params (
        (:name :show :type :boolean :ref nil :items nil :optional nil :doc "True for showing ad highlights"))
  :returns nil
  :doc "Highlights owner element of all frames detected to be ads." :experimental nil :deprecated nil)

(define-domain-command set-paused-in-debugger-message
  :method "Overlay.setPausedInDebuggerMessage"
  :params (
        (:name :message :type :string :ref nil :items nil :optional t :doc "The message to display, also triggers resume and step over controls."))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command set-show-debug-borders
  :method "Overlay.setShowDebugBorders"
  :params (
        (:name :show :type :boolean :ref nil :items nil :optional nil :doc "True for showing debug borders"))
  :returns nil
  :doc "Requests that backend shows debug borders on layers" :experimental nil :deprecated nil)

(define-domain-command set-show-fps-counter
  :method "Overlay.setShowFPSCounter"
  :params (
        (:name :show :type :boolean :ref nil :items nil :optional nil :doc "True for showing the FPS counter"))
  :returns nil
  :doc "Requests that backend shows the FPS counter" :experimental nil :deprecated nil)

(define-domain-command set-show-grid-overlays
  :method "Overlay.setShowGridOverlays"
  :params (
        (:name :grid-node-highlight-configs :type :array :ref nil :items (:type :ref :ref "GridNodeHighlightConfig") :optional nil :doc "An array of node identifiers and descriptors for the highlight appearance."))
  :returns nil
  :doc "Highlight multiple elements with the CSS Grid overlay." :experimental nil :deprecated nil)

(define-domain-command set-show-flex-overlays
  :method "Overlay.setShowFlexOverlays"
  :params (
        (:name :flex-node-highlight-configs :type :array :ref nil :items (:type :ref :ref "FlexNodeHighlightConfig") :optional nil :doc "An array of node identifiers and descriptors for the highlight appearance."))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command set-show-scroll-snap-overlays
  :method "Overlay.setShowScrollSnapOverlays"
  :params (
        (:name :scroll-snap-highlight-configs :type :array :ref nil :items (:type :ref :ref "ScrollSnapHighlightConfig") :optional nil :doc "An array of node identifiers and descriptors for the highlight appearance."))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command set-show-container-query-overlays
  :method "Overlay.setShowContainerQueryOverlays"
  :params (
        (:name :container-query-highlight-configs :type :array :ref nil :items (:type :ref :ref "ContainerQueryHighlightConfig") :optional nil :doc "An array of node identifiers and descriptors for the highlight appearance."))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command set-show-inspected-element-anchor
  :method "Overlay.setShowInspectedElementAnchor"
  :params (
        (:name :inspected-element-anchor-config :type :ref :ref "InspectedElementAnchorConfig" :items nil :optional nil :doc "Node identifier for which to show an anchor for."))
  :returns nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command set-show-paint-rects
  :method "Overlay.setShowPaintRects"
  :params (
        (:name :result :type :boolean :ref nil :items nil :optional nil :doc "True for showing paint rectangles"))
  :returns nil
  :doc "Requests that backend shows paint rectangles" :experimental nil :deprecated nil)

(define-domain-command set-show-layout-shift-regions
  :method "Overlay.setShowLayoutShiftRegions"
  :params (
        (:name :result :type :boolean :ref nil :items nil :optional nil :doc "True for showing layout shift regions"))
  :returns nil
  :doc "Requests that backend shows layout shift regions" :experimental nil :deprecated nil)

(define-domain-command set-show-scroll-bottleneck-rects
  :method "Overlay.setShowScrollBottleneckRects"
  :params (
        (:name :show :type :boolean :ref nil :items nil :optional nil :doc "True for showing scroll bottleneck rects"))
  :returns nil
  :doc "Requests that backend shows scroll bottleneck rects" :experimental nil :deprecated nil)

(define-domain-command set-show-hit-test-borders
  :method "Overlay.setShowHitTestBorders"
  :params (
        (:name :show :type :boolean :ref nil :items nil :optional nil :doc "True for showing hit-test borders"))
  :returns nil
  :doc "Deprecated, no longer has any effect." :experimental nil :deprecated t)

(define-domain-command set-show-web-vitals
  :method "Overlay.setShowWebVitals"
  :params (
        (:name :show :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Deprecated, no longer has any effect." :experimental nil :deprecated t)

(define-domain-command set-show-viewport-size-on-resize
  :method "Overlay.setShowViewportSizeOnResize"
  :params (
        (:name :show :type :boolean :ref nil :items nil :optional nil :doc "Whether to paint size or not."))
  :returns nil
  :doc "Paints viewport size upon main frame resize." :experimental nil :deprecated nil)

(define-domain-command set-show-hinge
  :method "Overlay.setShowHinge"
  :params (
        (:name :hinge-config :type :ref :ref "HingeConfig" :items nil :optional t :doc "hinge data, null means hideHinge"))
  :returns nil
  :doc "Add a dual screen device hinge" :experimental nil :deprecated nil)

(define-domain-command set-show-isolated-elements
  :method "Overlay.setShowIsolatedElements"
  :params (
        (:name :isolated-element-highlight-configs :type :array :ref nil :items (:type :ref :ref "IsolatedElementHighlightConfig") :optional nil :doc "An array of node identifiers and descriptors for the highlight appearance."))
  :returns nil
  :doc "Show elements in isolation mode with overlays." :experimental nil :deprecated nil)

(define-domain-command set-show-window-controls-overlay
  :method "Overlay.setShowWindowControlsOverlay"
  :params (
        (:name :window-controls-overlay-config :type :ref :ref "WindowControlsOverlayConfig" :items nil :optional t :doc "Window Controls Overlay data, null means hide Window Controls Overlay"))
  :returns nil
  :doc "Show Window Controls Overlay for PWA" :experimental nil :deprecated nil)

(define-domain-event inspect-node-requested
  :method "Overlay.inspectNodeRequested"
  :params (
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "Id of the node to inspect."))
  :doc "Fired when the node should be inspected. This happens after call to `setInspectMode` or when user manually inspects an element." :experimental nil :deprecated nil)

(define-domain-event node-highlight-requested
  :method "Overlay.nodeHighlightRequested"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc ""))
  :doc "Fired when the node should be highlighted. This happens after call to `setInspectMode`." :experimental nil :deprecated nil)

(define-domain-event screenshot-requested
  :method "Overlay.screenshotRequested"
  :params (
        (:name :viewport :type :ref :ref "Page.Viewport" :items nil :optional nil :doc "Viewport to capture, in device independent pixels (dip)."))
  :doc "Fired when user asks to capture screenshot of some area on the page." :experimental nil :deprecated nil)

(define-domain-event inspect-panel-show-requested
  :method "Overlay.inspectPanelShowRequested"
  :params (
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "Id of the node to show in the panel."))
  :doc "Fired when user asks to show the Inspect panel." :experimental nil :deprecated nil)

(define-domain-event inspected-element-window-restored
  :method "Overlay.inspectedElementWindowRestored"
  :params (
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional nil :doc "Id of the node to restore the floating window for."))
  :doc "Fired when user asks to restore the Inspected Element floating window." :experimental nil :deprecated nil)

(define-domain-event inspect-mode-canceled
  :method "Overlay.inspectModeCanceled"
  :params nil
  :doc "Fired when user cancels the inspect mode." :experimental nil :deprecated nil)

