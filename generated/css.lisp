;;;; CSS CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/css
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

(in-package #:cdp/css)

(define-domain-type style-sheet-origin
  :cdp-id "StyleSheetOrigin" :type :string
  :properties nil
  :enum '("injected" "user-agent" "inspector" "regular")
  :doc "Stylesheet type: \"injected\" for stylesheets injected via extension, \"user-agent\" for user-agent stylesheets, \"inspector\" for stylesheets created by the inspector (i.e. those holding the \"via inspector\" rules), \"regular\" for regular stylesheets." :experimental nil :deprecated nil)

(define-domain-type pseudo-element-matches
  :cdp-id "PseudoElementMatches" :type :object
  :properties (
        (:name :pseudo-type :type :ref :ref "DOM.PseudoType" :items nil :optional nil :doc "Pseudo element type.")
        (:name :pseudo-identifier :type :string :ref nil :items nil :optional t :doc "Pseudo element custom ident.")
        (:name :matches :type :array :ref nil :items (:type :ref :ref "RuleMatch") :optional nil :doc "Matches of CSS rules applicable to the pseudo style."))
  :enum nil
  :doc "CSS rule collection for a single pseudo style." :experimental nil :deprecated nil)

(define-domain-type css-animation-style
  :cdp-id "CSSAnimationStyle" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional t :doc "The name of the animation.")
        (:name :style :type :ref :ref "CSSStyle" :items nil :optional nil :doc "The style coming from the animation."))
  :enum nil
  :doc "CSS style coming from animations with the name of the animation." :experimental nil :deprecated nil)

(define-domain-type inherited-style-entry
  :cdp-id "InheritedStyleEntry" :type :object
  :properties (
        (:name :inline-style :type :ref :ref "CSSStyle" :items nil :optional t :doc "The ancestor node's inline style, if any, in the style inheritance chain.")
        (:name :matched-css-rules :type :array :ref nil :items (:type :ref :ref "RuleMatch") :optional nil :doc "Matches of CSS rules matching the ancestor node in the style inheritance chain."))
  :enum nil
  :doc "Inherited CSS rule collection from ancestor node." :experimental nil :deprecated nil)

(define-domain-type inherited-animated-style-entry
  :cdp-id "InheritedAnimatedStyleEntry" :type :object
  :properties (
        (:name :animation-styles :type :array :ref nil :items (:type :ref :ref "CSSAnimationStyle") :optional t :doc "Styles coming from the animations of the ancestor, if any, in the style inheritance chain.")
        (:name :transitions-style :type :ref :ref "CSSStyle" :items nil :optional t :doc "The style coming from the transitions of the ancestor, if any, in the style inheritance chain."))
  :enum nil
  :doc "Inherited CSS style collection for animated styles from ancestor node." :experimental nil :deprecated nil)

(define-domain-type inherited-pseudo-element-matches
  :cdp-id "InheritedPseudoElementMatches" :type :object
  :properties (
        (:name :pseudo-elements :type :array :ref nil :items (:type :ref :ref "PseudoElementMatches") :optional nil :doc "Matches of pseudo styles from the pseudos of an ancestor node."))
  :enum nil
  :doc "Inherited pseudo element matches from pseudos of an ancestor node." :experimental nil :deprecated nil)

(define-domain-type rule-match
  :cdp-id "RuleMatch" :type :object
  :properties (
        (:name :rule :type :ref :ref "CSSRule" :items nil :optional nil :doc "CSS rule in the match.")
        (:name :matching-selectors :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "Matching selector indices in the rule's selectorList selectors (0-based)."))
  :enum nil
  :doc "Match data for a CSS rule." :experimental nil :deprecated nil)

(define-domain-type value
  :cdp-id "Value" :type :object
  :properties (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Value text.")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "Value range in the underlying resource (if available).")
        (:name :specificity :type :ref :ref "Specificity" :items nil :optional t :doc "Specificity of the selector."))
  :enum nil
  :doc "Data for a simple selector (these are delimited by commas in a selector list)." :experimental nil :deprecated nil)

(define-domain-type specificity
  :cdp-id "Specificity" :type :object
  :properties (
        (:name :a :type :integer :ref nil :items nil :optional nil :doc "The a component, which represents the number of ID selectors.")
        (:name :b :type :integer :ref nil :items nil :optional nil :doc "The b component, which represents the number of class selectors, attributes selectors, and pseudo-classes.")
        (:name :c :type :integer :ref nil :items nil :optional nil :doc "The c component, which represents the number of type selectors and pseudo-elements."))
  :enum nil
  :doc "Specificity: https://drafts.csswg.org/selectors/#specificity-rules" :experimental t :deprecated nil)

(define-domain-type selector-list
  :cdp-id "SelectorList" :type :object
  :properties (
        (:name :selectors :type :array :ref nil :items (:type :ref :ref "Value") :optional nil :doc "Selectors in the list.")
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Rule selector text."))
  :enum nil
  :doc "Selector list data." :experimental nil :deprecated nil)

(define-domain-type css-style-sheet-header
  :cdp-id "CSSStyleSheetHeader" :type :object
  :properties (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "The stylesheet identifier.")
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "Owner frame identifier.")
        (:name :source-url :type :string :ref nil :items nil :optional nil :doc "Stylesheet resource URL. Empty if this is a constructed stylesheet created using new CSSStyleSheet() (but non-empty if this is a constructed stylesheet imported as a CSS module script).")
        (:name :source-map-url :type :string :ref nil :items nil :optional t :doc "URL of source map associated with the stylesheet (if any).")
        (:name :origin :type :ref :ref "StyleSheetOrigin" :items nil :optional nil :doc "Stylesheet origin.")
        (:name :title :type :string :ref nil :items nil :optional nil :doc "Stylesheet title.")
        (:name :owner-node :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "The backend id for the owner node of the stylesheet.")
        (:name :disabled :type :boolean :ref nil :items nil :optional nil :doc "Denotes whether the stylesheet is disabled.")
        (:name :has-source-url :type :boolean :ref nil :items nil :optional t :doc "Whether the sourceURL field value comes from the sourceURL comment.")
        (:name :is-inline :type :boolean :ref nil :items nil :optional nil :doc "Whether this stylesheet is created for STYLE tag by parser. This flag is not set for document.written STYLE tags.")
        (:name :is-mutable :type :boolean :ref nil :items nil :optional nil :doc "Whether this stylesheet is mutable. Inline stylesheets become mutable after they have been modified via CSSOM API. `<link>` element's stylesheets become mutable only if DevTools modifies them. Constructed stylesheets (new CSSStyleSheet()) are mutable immediately after creation.")
        (:name :is-constructed :type :boolean :ref nil :items nil :optional nil :doc "True if this stylesheet is created through new CSSStyleSheet() or imported as a CSS module script.")
        (:name :start-line :type :number :ref nil :items nil :optional nil :doc "Line offset of the stylesheet within the resource (zero based).")
        (:name :start-column :type :number :ref nil :items nil :optional nil :doc "Column offset of the stylesheet within the resource (zero based).")
        (:name :length :type :number :ref nil :items nil :optional nil :doc "Size of the content (in characters).")
        (:name :end-line :type :number :ref nil :items nil :optional nil :doc "Line offset of the end of the stylesheet within the resource (zero based).")
        (:name :end-column :type :number :ref nil :items nil :optional nil :doc "Column offset of the end of the stylesheet within the resource (zero based).")
        (:name :loading-failed :type :boolean :ref nil :items nil :optional t :doc "If the style sheet was loaded from a network resource, this indicates when the resource failed to load"))
  :enum nil
  :doc "CSS stylesheet metainformation." :experimental nil :deprecated nil)

(define-domain-type css-rule
  :cdp-id "CSSRule" :type :object
  :properties (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :selector-list :type :ref :ref "SelectorList" :items nil :optional nil :doc "Rule selector data.")
        (:name :nesting-selectors :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Array of selectors from ancestor style rules, sorted by distance from the current rule.")
        (:name :origin :type :ref :ref "StyleSheetOrigin" :items nil :optional nil :doc "Parent stylesheet's origin.")
        (:name :style :type :ref :ref "CSSStyle" :items nil :optional nil :doc "Associated style declaration.")
        (:name :origin-tree-scope-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "The BackendNodeId of the DOM node that constitutes the origin tree scope of this rule.")
        (:name :media :type :array :ref nil :items (:type :ref :ref "CSSMedia") :optional t :doc "Media list array (for rules involving media queries). The array enumerates media queries starting with the innermost one, going outwards.")
        (:name :container-queries :type :array :ref nil :items (:type :ref :ref "CSSContainerQuery") :optional t :doc "Container query list array (for rules involving container queries). The array enumerates container queries starting with the innermost one, going outwards.")
        (:name :supports :type :array :ref nil :items (:type :ref :ref "CSSSupports") :optional t :doc "@supports CSS at-rule array. The array enumerates @supports at-rules starting with the innermost one, going outwards.")
        (:name :layers :type :array :ref nil :items (:type :ref :ref "CSSLayer") :optional t :doc "Cascade layer array. Contains the layer hierarchy that this rule belongs to starting with the innermost layer and going outwards.")
        (:name :scopes :type :array :ref nil :items (:type :ref :ref "CSSScope") :optional t :doc "@scope CSS at-rule array. The array enumerates @scope at-rules starting with the innermost one, going outwards.")
        (:name :rule-types :type :array :ref nil :items (:type :ref :ref "CSSRuleType") :optional t :doc "The array keeps the types of ancestor CSSRules from the innermost going outwards.")
        (:name :starting-styles :type :array :ref nil :items (:type :ref :ref "CSSStartingStyle") :optional t :doc "@starting-style CSS at-rule array. The array enumerates @starting-style at-rules starting with the innermost one, going outwards."))
  :enum nil
  :doc "CSS rule representation." :experimental nil :deprecated nil)

(define-domain-type css-rule-type
  :cdp-id "CSSRuleType" :type :string
  :properties nil
  :enum '("MediaRule" "SupportsRule" "ContainerRule" "LayerRule" "ScopeRule" "StyleRule" "StartingStyleRule")
  :doc "Enum indicating the type of a CSS rule, used to represent the order of a style rule's ancestors. This list only contains rule types that are collected during the ancestor rule collection." :experimental t :deprecated nil)

(define-domain-type rule-usage
  :cdp-id "RuleUsage" :type :object
  :properties (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :start-offset :type :number :ref nil :items nil :optional nil :doc "Offset of the start of the rule (including selector) from the beginning of the stylesheet.")
        (:name :end-offset :type :number :ref nil :items nil :optional nil :doc "Offset of the end of the rule body from the beginning of the stylesheet.")
        (:name :used :type :boolean :ref nil :items nil :optional nil :doc "Indicates whether the rule was actually used by some element in the page."))
  :enum nil
  :doc "CSS coverage information." :experimental nil :deprecated nil)

(define-domain-type source-range
  :cdp-id "SourceRange" :type :object
  :properties (
        (:name :start-line :type :integer :ref nil :items nil :optional nil :doc "Start line of range.")
        (:name :start-column :type :integer :ref nil :items nil :optional nil :doc "Start column of range (inclusive).")
        (:name :end-line :type :integer :ref nil :items nil :optional nil :doc "End line of range")
        (:name :end-column :type :integer :ref nil :items nil :optional nil :doc "End column of range (exclusive)."))
  :enum nil
  :doc "Text range within a resource. All numbers are zero-based." :experimental nil :deprecated nil)

(define-domain-type shorthand-entry
  :cdp-id "ShorthandEntry" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Shorthand name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Shorthand value.")
        (:name :important :type :boolean :ref nil :items nil :optional t :doc "Whether the property has \"!important\" annotation (implies `false` if absent)."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type css-computed-style-property
  :cdp-id "CSSComputedStyleProperty" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Computed style property name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "Computed style property value."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type computed-style-extra-fields
  :cdp-id "ComputedStyleExtraFields" :type :object
  :properties (
        (:name :is-appearance-base :type :boolean :ref nil :items nil :optional nil :doc "Returns whether or not this node is being rendered with base appearance, which happens when it has its appearance property set to base/base-select or it is in the subtree of an element being rendered with base appearance."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type css-style
  :cdp-id "CSSStyle" :type :object
  :properties (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :css-properties :type :array :ref nil :items (:type :ref :ref "CSSProperty") :optional nil :doc "CSS properties in the style.")
        (:name :shorthand-entries :type :array :ref nil :items (:type :ref :ref "ShorthandEntry") :optional nil :doc "Computed values for all shorthands found in the style.")
        (:name :css-text :type :string :ref nil :items nil :optional t :doc "Style declaration text (if available).")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "Style declaration range in the enclosing stylesheet (if available)."))
  :enum nil
  :doc "CSS style representation." :experimental nil :deprecated nil)

(define-domain-type css-property
  :cdp-id "CSSProperty" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "The property name.")
        (:name :value :type :string :ref nil :items nil :optional nil :doc "The property value.")
        (:name :important :type :boolean :ref nil :items nil :optional t :doc "Whether the property has \"!important\" annotation (implies `false` if absent).")
        (:name :implicit :type :boolean :ref nil :items nil :optional t :doc "Whether the property is implicit (implies `false` if absent).")
        (:name :text :type :string :ref nil :items nil :optional t :doc "The full property text as specified in the style.")
        (:name :parsed-ok :type :boolean :ref nil :items nil :optional t :doc "Whether the property is understood by the browser (implies `true` if absent).")
        (:name :disabled :type :boolean :ref nil :items nil :optional t :doc "Whether the property is disabled by the user (present for source-based properties only).")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "The entire property range in the enclosing style declaration (if available).")
        (:name :longhand-properties :type :array :ref nil :items (:type :ref :ref "CSSProperty") :optional t :doc "Parsed longhand components of this property if it is a shorthand. This field will be empty if the given property is not a shorthand."))
  :enum nil
  :doc "CSS property declaration data." :experimental nil :deprecated nil)

(define-domain-type css-media
  :cdp-id "CSSMedia" :type :object
  :properties (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Media query text.")
        (:name :source :type :string :ref nil :items nil :optional nil :doc "Source of the media query: \"mediaRule\" if specified by a @media rule, \"importRule\" if specified by an @import rule, \"linkedSheet\" if specified by a \"media\" attribute in a linked stylesheet's LINK tag, \"inlineSheet\" if specified by a \"media\" attribute in an inline stylesheet's STYLE tag.")
        (:name :source-url :type :string :ref nil :items nil :optional t :doc "URL of the document containing the media query description.")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "The associated rule (@media or @import) header range in the enclosing stylesheet (if available).")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "Identifier of the stylesheet containing this object (if exists).")
        (:name :media-list :type :array :ref nil :items (:type :ref :ref "MediaQuery") :optional t :doc "Array of media queries."))
  :enum nil
  :doc "CSS media rule descriptor." :experimental nil :deprecated nil)

(define-domain-type media-query
  :cdp-id "MediaQuery" :type :object
  :properties (
        (:name :expressions :type :array :ref nil :items (:type :ref :ref "MediaQueryExpression") :optional nil :doc "Array of media query expressions.")
        (:name :active :type :boolean :ref nil :items nil :optional nil :doc "Whether the media query condition is satisfied."))
  :enum nil
  :doc "Media query descriptor." :experimental nil :deprecated nil)

(define-domain-type media-query-expression
  :cdp-id "MediaQueryExpression" :type :object
  :properties (
        (:name :value :type :number :ref nil :items nil :optional nil :doc "Media query expression value.")
        (:name :unit :type :string :ref nil :items nil :optional nil :doc "Media query expression units.")
        (:name :feature :type :string :ref nil :items nil :optional nil :doc "Media query expression feature.")
        (:name :value-range :type :ref :ref "SourceRange" :items nil :optional t :doc "The associated range of the value text in the enclosing stylesheet (if available).")
        (:name :computed-length :type :number :ref nil :items nil :optional t :doc "Computed length of media query expression (if applicable)."))
  :enum nil
  :doc "Media query expression descriptor." :experimental nil :deprecated nil)

(define-domain-type css-container-query
  :cdp-id "CSSContainerQuery" :type :object
  :properties (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Container query text.")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "The associated rule header range in the enclosing stylesheet (if available).")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "Identifier of the stylesheet containing this object (if exists).")
        (:name :name :type :string :ref nil :items nil :optional t :doc "Optional name for the container.")
        (:name :physical-axes :type :ref :ref "DOM.PhysicalAxes" :items nil :optional t :doc "Optional physical axes queried for the container.")
        (:name :logical-axes :type :ref :ref "DOM.LogicalAxes" :items nil :optional t :doc "Optional logical axes queried for the container.")
        (:name :queries-scroll-state :type :boolean :ref nil :items nil :optional t :doc "true if the query contains scroll-state() queries.")
        (:name :queries-anchored :type :boolean :ref nil :items nil :optional t :doc "true if the query contains anchored() queries."))
  :enum nil
  :doc "CSS container query rule descriptor." :experimental t :deprecated nil)

(define-domain-type css-supports
  :cdp-id "CSSSupports" :type :object
  :properties (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Supports rule text.")
        (:name :active :type :boolean :ref nil :items nil :optional nil :doc "Whether the supports condition is satisfied.")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "The associated rule header range in the enclosing stylesheet (if available).")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "Identifier of the stylesheet containing this object (if exists)."))
  :enum nil
  :doc "CSS Supports at-rule descriptor." :experimental t :deprecated nil)

(define-domain-type css-scope
  :cdp-id "CSSScope" :type :object
  :properties (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Scope rule text.")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "The associated rule header range in the enclosing stylesheet (if available).")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "Identifier of the stylesheet containing this object (if exists)."))
  :enum nil
  :doc "CSS Scope at-rule descriptor." :experimental t :deprecated nil)

(define-domain-type css-layer
  :cdp-id "CSSLayer" :type :object
  :properties (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Layer name.")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "The associated rule header range in the enclosing stylesheet (if available).")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "Identifier of the stylesheet containing this object (if exists)."))
  :enum nil
  :doc "CSS Layer at-rule descriptor." :experimental t :deprecated nil)

(define-domain-type css-starting-style
  :cdp-id "CSSStartingStyle" :type :object
  :properties (
        (:name :range :type :ref :ref "SourceRange" :items nil :optional t :doc "The associated rule header range in the enclosing stylesheet (if available).")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "Identifier of the stylesheet containing this object (if exists)."))
  :enum nil
  :doc "CSS Starting Style at-rule descriptor." :experimental t :deprecated nil)

(define-domain-type css-layer-data
  :cdp-id "CSSLayerData" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Layer name.")
        (:name :sub-layers :type :array :ref nil :items (:type :ref :ref "CSSLayerData") :optional t :doc "Direct sub-layers")
        (:name :order :type :number :ref nil :items nil :optional nil :doc "Layer order. The order determines the order of the layer in the cascade order. A higher number has higher priority in the cascade order."))
  :enum nil
  :doc "CSS Layer data." :experimental t :deprecated nil)

(define-domain-type platform-font-usage
  :cdp-id "PlatformFontUsage" :type :object
  :properties (
        (:name :family-name :type :string :ref nil :items nil :optional nil :doc "Font's family name reported by platform.")
        (:name :post-script-name :type :string :ref nil :items nil :optional nil :doc "Font's PostScript name reported by platform.")
        (:name :is-custom-font :type :boolean :ref nil :items nil :optional nil :doc "Indicates if the font was downloaded or resolved locally.")
        (:name :glyph-count :type :number :ref nil :items nil :optional nil :doc "Amount of glyphs that were rendered with this font."))
  :enum nil
  :doc "Information about amount of glyphs that were rendered with given font." :experimental nil :deprecated nil)

(define-domain-type font-variation-axis
  :cdp-id "FontVariationAxis" :type :object
  :properties (
        (:name :tag :type :string :ref nil :items nil :optional nil :doc "The font-variation-setting tag (a.k.a. \"axis tag\").")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Human-readable variation name in the default language (normally, \"en\").")
        (:name :min-value :type :number :ref nil :items nil :optional nil :doc "The minimum value (inclusive) the font supports for this tag.")
        (:name :max-value :type :number :ref nil :items nil :optional nil :doc "The maximum value (inclusive) the font supports for this tag.")
        (:name :default-value :type :number :ref nil :items nil :optional nil :doc "The default value."))
  :enum nil
  :doc "Information about font variation axes for variable fonts" :experimental nil :deprecated nil)

(define-domain-type font-face
  :cdp-id "FontFace" :type :object
  :properties (
        (:name :font-family :type :string :ref nil :items nil :optional nil :doc "The font-family.")
        (:name :font-style :type :string :ref nil :items nil :optional nil :doc "The font-style.")
        (:name :font-variant :type :string :ref nil :items nil :optional nil :doc "The font-variant.")
        (:name :font-weight :type :string :ref nil :items nil :optional nil :doc "The font-weight.")
        (:name :font-stretch :type :string :ref nil :items nil :optional nil :doc "The font-stretch.")
        (:name :font-display :type :string :ref nil :items nil :optional nil :doc "The font-display.")
        (:name :unicode-range :type :string :ref nil :items nil :optional nil :doc "The unicode-range.")
        (:name :src :type :string :ref nil :items nil :optional nil :doc "The src.")
        (:name :platform-font-family :type :string :ref nil :items nil :optional nil :doc "The resolved platform font family")
        (:name :font-variation-axes :type :array :ref nil :items (:type :ref :ref "FontVariationAxis") :optional t :doc "Available variation settings (a.k.a. \"axes\")."))
  :enum nil
  :doc "Properties of a web font: https://www.w3.org/TR/2008/REC-CSS2-20080411/fonts.html#font-descriptions and additional information such as platformFontFamily and fontVariationAxes." :experimental nil :deprecated nil)

(define-domain-type css-try-rule
  :cdp-id "CSSTryRule" :type :object
  :properties (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :origin :type :ref :ref "StyleSheetOrigin" :items nil :optional nil :doc "Parent stylesheet's origin.")
        (:name :style :type :ref :ref "CSSStyle" :items nil :optional nil :doc "Associated style declaration."))
  :enum nil
  :doc "CSS try rule representation." :experimental nil :deprecated nil)

(define-domain-type css-position-try-rule
  :cdp-id "CSSPositionTryRule" :type :object
  :properties (
        (:name :name :type :ref :ref "Value" :items nil :optional nil :doc "The prelude dashed-ident name")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :origin :type :ref :ref "StyleSheetOrigin" :items nil :optional nil :doc "Parent stylesheet's origin.")
        (:name :style :type :ref :ref "CSSStyle" :items nil :optional nil :doc "Associated style declaration.")
        (:name :active :type :boolean :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "CSS @position-try rule representation." :experimental nil :deprecated nil)

(define-domain-type css-keyframes-rule
  :cdp-id "CSSKeyframesRule" :type :object
  :properties (
        (:name :animation-name :type :ref :ref "Value" :items nil :optional nil :doc "Animation name.")
        (:name :keyframes :type :array :ref nil :items (:type :ref :ref "CSSKeyframeRule") :optional nil :doc "List of keyframes."))
  :enum nil
  :doc "CSS keyframes rule representation." :experimental nil :deprecated nil)

(define-domain-type css-property-registration
  :cdp-id "CSSPropertyRegistration" :type :object
  :properties (
        (:name :property-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :initial-value :type :ref :ref "Value" :items nil :optional t :doc "")
        (:name :inherits :type :boolean :ref nil :items nil :optional nil :doc "")
        (:name :syntax :type :string :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Representation of a custom property registration through CSS.registerProperty" :experimental nil :deprecated nil)

(define-domain-type css-at-rule
  :cdp-id "CSSAtRule" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of at-rule.")
        (:name :subsection :type :string :ref nil :items nil :optional t :doc "Subsection of font-feature-values, if this is a subsection.")
        (:name :name :type :ref :ref "Value" :items nil :optional t :doc "LINT.ThenChange(//third_party/blink/renderer/core/inspector/inspector_style_sheet.cc:FontVariantAlternatesFeatureType,//third_party/blink/renderer/core/inspector/inspector_css_agent.cc:FontVariantAlternatesFeatureType) Associated name, if applicable.")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :origin :type :ref :ref "StyleSheetOrigin" :items nil :optional nil :doc "Parent stylesheet's origin.")
        (:name :style :type :ref :ref "CSSStyle" :items nil :optional nil :doc "Associated style declaration."))
  :enum nil
  :doc "CSS generic @rule representation." :experimental nil :deprecated nil)

(define-domain-type css-property-rule
  :cdp-id "CSSPropertyRule" :type :object
  :properties (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :origin :type :ref :ref "StyleSheetOrigin" :items nil :optional nil :doc "Parent stylesheet's origin.")
        (:name :property-name :type :ref :ref "Value" :items nil :optional nil :doc "Associated property name.")
        (:name :style :type :ref :ref "CSSStyle" :items nil :optional nil :doc "Associated style declaration."))
  :enum nil
  :doc "CSS property at-rule representation." :experimental nil :deprecated nil)

(define-domain-type css-function-parameter
  :cdp-id "CSSFunctionParameter" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "The parameter name.")
        (:name :type :type :string :ref nil :items nil :optional nil :doc "The parameter type."))
  :enum nil
  :doc "CSS function argument representation." :experimental nil :deprecated nil)

(define-domain-type css-function-condition-node
  :cdp-id "CSSFunctionConditionNode" :type :object
  :properties (
        (:name :media :type :ref :ref "CSSMedia" :items nil :optional t :doc "Media query for this conditional block. Only one type of condition should be set.")
        (:name :container-queries :type :ref :ref "CSSContainerQuery" :items nil :optional t :doc "Container query for this conditional block. Only one type of condition should be set.")
        (:name :supports :type :ref :ref "CSSSupports" :items nil :optional t :doc "@supports CSS at-rule condition. Only one type of condition should be set.")
        (:name :children :type :array :ref nil :items (:type :ref :ref "CSSFunctionNode") :optional nil :doc "Block body.")
        (:name :condition-text :type :string :ref nil :items nil :optional nil :doc "The condition text."))
  :enum nil
  :doc "CSS function conditional block representation." :experimental nil :deprecated nil)

(define-domain-type css-function-node
  :cdp-id "CSSFunctionNode" :type :object
  :properties (
        (:name :condition :type :ref :ref "CSSFunctionConditionNode" :items nil :optional t :doc "A conditional block. If set, style should not be set.")
        (:name :style :type :ref :ref "CSSStyle" :items nil :optional t :doc "Values set by this node. If set, condition should not be set."))
  :enum nil
  :doc "Section of the body of a CSS function rule." :experimental nil :deprecated nil)

(define-domain-type css-function-rule
  :cdp-id "CSSFunctionRule" :type :object
  :properties (
        (:name :name :type :ref :ref "Value" :items nil :optional nil :doc "Name of the function.")
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :origin :type :ref :ref "StyleSheetOrigin" :items nil :optional nil :doc "Parent stylesheet's origin.")
        (:name :parameters :type :array :ref nil :items (:type :ref :ref "CSSFunctionParameter") :optional nil :doc "List of parameters.")
        (:name :children :type :array :ref nil :items (:type :ref :ref "CSSFunctionNode") :optional nil :doc "Function body."))
  :enum nil
  :doc "CSS function at-rule representation." :experimental nil :deprecated nil)

(define-domain-type css-keyframe-rule
  :cdp-id "CSSKeyframeRule" :type :object
  :properties (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional t :doc "The css style sheet identifier (absent for user agent stylesheet and user-specified stylesheet rules) this rule came from.")
        (:name :origin :type :ref :ref "StyleSheetOrigin" :items nil :optional nil :doc "Parent stylesheet's origin.")
        (:name :key-text :type :ref :ref "Value" :items nil :optional nil :doc "Associated key text.")
        (:name :style :type :ref :ref "CSSStyle" :items nil :optional nil :doc "Associated style declaration."))
  :enum nil
  :doc "CSS keyframe rule representation." :experimental nil :deprecated nil)

(define-domain-type style-declaration-edit
  :cdp-id "StyleDeclarationEdit" :type :object
  :properties (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "The css style sheet identifier.")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional nil :doc "The range of the style text in the enclosing stylesheet.")
        (:name :text :type :string :ref nil :items nil :optional nil :doc "New style text."))
  :enum nil
  :doc "A descriptor of operation to mutate style declaration text." :experimental nil :deprecated nil)

(define-domain-command add-rule
  :method "CSS.addRule"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "The css style sheet identifier where a new rule should be inserted.")
        (:name :rule-text :type :string :ref nil :items nil :optional nil :doc "The text of a new rule.")
        (:name :location :type :ref :ref "SourceRange" :items nil :optional nil :doc "Text position of a new rule in the target style sheet.")
        (:name :node-for-property-syntax-validation :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "NodeId for the DOM node in whose context custom property declarations for registered properties should be validated. If omitted, declarations in the new rule text can only be validated statically, which may produce incorrect results if the declaration contains a var() for example."))
  :returns (
        (:name :rule :type :ref :ref "CSSRule" :items nil :optional nil :doc "The newly created rule."))
  :doc "Inserts a new rule with the given `ruleText` in a stylesheet with given `styleSheetId`, at the position specified by `location`." :experimental nil :deprecated nil)

(define-domain-command collect-class-names
  :method "CSS.collectClassNames"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc ""))
  :returns (
        (:name :class-names :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Class name list."))
  :doc "Returns all class names from specified stylesheet." :experimental nil :deprecated nil)

(define-domain-command create-style-sheet
  :method "CSS.createStyleSheet"
  :params (
        (:name :frame-id :type :ref :ref "Page.FrameId" :items nil :optional nil :doc "Identifier of the frame where \"via-inspector\" stylesheet should be created.")
        (:name :force :type :boolean :ref nil :items nil :optional t :doc "If true, creates a new stylesheet for every call. If false, returns a stylesheet previously created by a call with force=false for the frame's document if it exists or creates a new stylesheet (default: false)."))
  :returns (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "Identifier of the created \"via-inspector\" stylesheet."))
  :doc "Creates a new special \"via-inspector\" stylesheet in the frame with given `frameId`." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "CSS.disable"
  :params nil
  :returns nil
  :doc "Disables the CSS agent for the given page." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "CSS.enable"
  :params nil
  :returns nil
  :doc "Enables the CSS agent for the given page. Clients should not assume that the CSS agent has been enabled until the result of this command is received." :experimental nil :deprecated nil)

(define-domain-command force-pseudo-state
  :method "CSS.forcePseudoState"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "The element id for which to force the pseudo state.")
        (:name :forced-pseudo-classes :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Element pseudo classes to force when computing the element's style."))
  :returns nil
  :doc "Ensures that the given node will have specified pseudo-classes whenever its style is computed by the browser." :experimental nil :deprecated nil)

(define-domain-command force-starting-style
  :method "CSS.forceStartingStyle"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "The element id for which to force the starting-style state.")
        (:name :forced :type :boolean :ref nil :items nil :optional nil :doc "Boolean indicating if this is on or off."))
  :returns nil
  :doc "Ensures that the given node is in its starting-style state." :experimental nil :deprecated nil)

(define-domain-command get-background-colors
  :method "CSS.getBackgroundColors"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Id of the node to get background colors for."))
  :returns (
        (:name :background-colors :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "The range of background colors behind this element, if it contains any visible text. If no visible text is present, this will be undefined. In the case of a flat background color, this will consist of simply that color. In the case of a gradient, this will consist of each of the color stops. For anything more complicated, this will be an empty array. Images will be ignored (as if the image had failed to load).")
        (:name :computed-font-size :type :string :ref nil :items nil :optional t :doc "The computed font size for this node, as a CSS computed value string (e.g. '12px').")
        (:name :computed-font-weight :type :string :ref nil :items nil :optional t :doc "The computed font weight for this node, as a CSS computed value string (e.g. 'normal' or '100')."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command get-computed-style-for-node
  :method "CSS.getComputedStyleForNode"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc ""))
  :returns (
        (:name :computed-style :type :array :ref nil :items (:type :ref :ref "CSSComputedStyleProperty") :optional nil :doc "Computed style for the specified DOM node.")
        (:name :extra-fields :type :ref :ref "ComputedStyleExtraFields" :items nil :optional nil :doc "A list of non-standard \"extra fields\" which blink stores alongside each computed style."))
  :doc "Returns the computed style for a DOM node identified by `nodeId`." :experimental nil :deprecated nil)

(define-domain-command resolve-values
  :method "CSS.resolveValues"
  :params (
        (:name :values :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Cascade-dependent keywords (revert/revert-layer) do not work.")
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Id of the node in whose context the expression is evaluated")
        (:name :property-name :type :string :ref nil :items nil :optional t :doc "Only longhands and custom property names are accepted.")
        (:name :pseudo-type :type :ref :ref "DOM.PseudoType" :items nil :optional t :doc "Pseudo element type, only works for pseudo elements that generate elements in the tree, such as ::before and ::after.")
        (:name :pseudo-identifier :type :string :ref nil :items nil :optional t :doc "Pseudo element custom ident."))
  :returns (
        (:name :results :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :doc "Resolve the specified values in the context of the provided element. For example, a value of '1em' is evaluated according to the computed 'font-size' of the element and a value 'calc(1px + 2px)' will be resolved to '3px'. If the `propertyName` was specified the `values` are resolved as if they were property's declaration. If a value cannot be parsed according to the provided property syntax, the value is parsed using combined syntax as if null `propertyName` was provided. If the value cannot be resolved even then, return the provided value without any changes. Note: this function currently does not resolve CSS random() function, it returns unmodified random() function parts.`" :experimental t :deprecated nil)

(define-domain-command get-longhand-properties
  :method "CSS.getLonghandProperties"
  :params (
        (:name :shorthand-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :longhand-properties :type :array :ref nil :items (:type :ref :ref "CSSProperty") :optional nil :doc ""))
  :doc "" :experimental t :deprecated nil)

(define-domain-command get-inline-styles-for-node
  :method "CSS.getInlineStylesForNode"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc ""))
  :returns (
        (:name :inline-style :type :ref :ref "CSSStyle" :items nil :optional t :doc "Inline style for the specified DOM node.")
        (:name :attributes-style :type :ref :ref "CSSStyle" :items nil :optional t :doc "Attribute-defined element style (e.g. resulting from \"width=20 height=100%\")."))
  :doc "Returns the styles defined inline (explicitly in the \"style\" attribute and implicitly, using DOM attributes) for a DOM node identified by `nodeId`." :experimental nil :deprecated nil)

(define-domain-command get-animated-styles-for-node
  :method "CSS.getAnimatedStylesForNode"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc ""))
  :returns (
        (:name :animation-styles :type :array :ref nil :items (:type :ref :ref "CSSAnimationStyle") :optional t :doc "Styles coming from animations.")
        (:name :transitions-style :type :ref :ref "CSSStyle" :items nil :optional t :doc "Style coming from transitions.")
        (:name :inherited :type :array :ref nil :items (:type :ref :ref "InheritedAnimatedStyleEntry") :optional t :doc "Inherited style entries for animationsStyle and transitionsStyle from the inheritance chain of the element."))
  :doc "Returns the styles coming from animations & transitions including the animation & transition styles coming from inheritance chain." :experimental t :deprecated nil)

(define-domain-command get-matched-styles-for-node
  :method "CSS.getMatchedStylesForNode"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc ""))
  :returns (
        (:name :inline-style :type :ref :ref "CSSStyle" :items nil :optional t :doc "Inline style for the specified DOM node.")
        (:name :attributes-style :type :ref :ref "CSSStyle" :items nil :optional t :doc "Attribute-defined element style (e.g. resulting from \"width=20 height=100%\").")
        (:name :matched-css-rules :type :array :ref nil :items (:type :ref :ref "RuleMatch") :optional t :doc "CSS rules matching this node, from all applicable stylesheets.")
        (:name :pseudo-elements :type :array :ref nil :items (:type :ref :ref "PseudoElementMatches") :optional t :doc "Pseudo style matches for this node.")
        (:name :inherited :type :array :ref nil :items (:type :ref :ref "InheritedStyleEntry") :optional t :doc "A chain of inherited styles (from the immediate node parent up to the DOM tree root).")
        (:name :inherited-pseudo-elements :type :array :ref nil :items (:type :ref :ref "InheritedPseudoElementMatches") :optional t :doc "A chain of inherited pseudo element styles (from the immediate node parent up to the DOM tree root).")
        (:name :css-keyframes-rules :type :array :ref nil :items (:type :ref :ref "CSSKeyframesRule") :optional t :doc "A list of CSS keyframed animations matching this node.")
        (:name :css-position-try-rules :type :array :ref nil :items (:type :ref :ref "CSSPositionTryRule") :optional t :doc "A list of CSS @position-try rules matching this node, based on the position-try-fallbacks property.")
        (:name :active-position-fallback-index :type :integer :ref nil :items nil :optional t :doc "Index of the active fallback in the applied position-try-fallback property, will not be set if there is no active position-try fallback.")
        (:name :css-property-rules :type :array :ref nil :items (:type :ref :ref "CSSPropertyRule") :optional t :doc "A list of CSS at-property rules matching this node.")
        (:name :css-property-registrations :type :array :ref nil :items (:type :ref :ref "CSSPropertyRegistration") :optional t :doc "A list of CSS property registrations matching this node.")
        (:name :css-at-rules :type :array :ref nil :items (:type :ref :ref "CSSAtRule") :optional t :doc "A list of simple @rules matching this node or its pseudo-elements.")
        (:name :parent-layout-node-id :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "Id of the first parent element that does not have display: contents.")
        (:name :css-function-rules :type :array :ref nil :items (:type :ref :ref "CSSFunctionRule") :optional t :doc "A list of CSS at-function rules referenced by styles of this node."))
  :doc "Returns requested styles for a DOM node identified by `nodeId`." :experimental nil :deprecated nil)

(define-domain-command get-environment-variables
  :method "CSS.getEnvironmentVariables"
  :params nil
  :returns (
        (:name :environment-variables :type :object :ref nil :items nil :optional nil :doc ""))
  :doc "Returns the values of the default UA-defined environment variables used in env()" :experimental t :deprecated nil)

(define-domain-command get-media-queries
  :method "CSS.getMediaQueries"
  :params nil
  :returns (
        (:name :medias :type :array :ref nil :items (:type :ref :ref "CSSMedia") :optional nil :doc ""))
  :doc "Returns all media queries parsed by the rendering engine." :experimental nil :deprecated nil)

(define-domain-command get-platform-fonts-for-node
  :method "CSS.getPlatformFontsForNode"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc ""))
  :returns (
        (:name :fonts :type :array :ref nil :items (:type :ref :ref "PlatformFontUsage") :optional nil :doc "Usage statistics for every employed platform font."))
  :doc "Requests information about platform fonts which we used to render child TextNodes in the given node." :experimental nil :deprecated nil)

(define-domain-command get-style-sheet-text
  :method "CSS.getStyleSheetText"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc ""))
  :returns (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "The stylesheet text."))
  :doc "Returns the current textual content for a stylesheet." :experimental nil :deprecated nil)

(define-domain-command get-layers-for-node
  :method "CSS.getLayersForNode"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc ""))
  :returns (
        (:name :root-layer :type :ref :ref "CSSLayerData" :items nil :optional nil :doc ""))
  :doc "Returns all layers parsed by the rendering engine for the tree scope of a node. Given a DOM element identified by nodeId, getLayersForNode returns the root layer for the nearest ancestor document or shadow root. The layer root contains the full layer tree for the tree scope and their ordering." :experimental t :deprecated nil)

(define-domain-command get-location-for-selector
  :method "CSS.getLocationForSelector"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :selector-text :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :ranges :type :array :ref nil :items (:type :ref :ref "SourceRange") :optional nil :doc ""))
  :doc "Given a CSS selector text and a style sheet ID, getLocationForSelector returns an array of locations of the CSS selector in the style sheet." :experimental t :deprecated nil)

(define-domain-command track-computed-style-updates-for-node
  :method "CSS.trackComputedStyleUpdatesForNode"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional t :doc ""))
  :returns nil
  :doc "Starts tracking the given node for the computed style updates and whenever the computed style is updated for node, it queues a `computedStyleUpdated` event with throttling. There can only be 1 node tracked for computed style updates so passing a new node id removes tracking from the previous node. Pass `undefined` to disable tracking." :experimental t :deprecated nil)

(define-domain-command track-computed-style-updates
  :method "CSS.trackComputedStyleUpdates"
  :params (
        (:name :properties-to-track :type :array :ref nil :items (:type :ref :ref "CSSComputedStyleProperty") :optional nil :doc ""))
  :returns nil
  :doc "Starts tracking the given computed styles for updates. The specified array of properties replaces the one previously specified. Pass empty array to disable tracking. Use takeComputedStyleUpdates to retrieve the list of nodes that had properties modified. The changes to computed style properties are only tracked for nodes pushed to the front-end by the DOM agent. If no changes to the tracked properties occur after the node has been pushed to the front-end, no updates will be issued for the node." :experimental t :deprecated nil)

(define-domain-command take-computed-style-updates
  :method "CSS.takeComputedStyleUpdates"
  :params nil
  :returns (
        (:name :node-ids :type :array :ref nil :items (:type :ref :ref "DOM.NodeId") :optional nil :doc "The list of node Ids that have their tracked computed styles updated."))
  :doc "Polls the next batch of computed style updates." :experimental t :deprecated nil)

(define-domain-command set-effective-property-value-for-node
  :method "CSS.setEffectivePropertyValueForNode"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "The element id for which to set property.")
        (:name :property-name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Find a rule with the given active property for the given node and set the new value for this property" :experimental nil :deprecated nil)

(define-domain-command set-property-rule-property-name
  :method "CSS.setPropertyRulePropertyName"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional nil :doc "")
        (:name :property-name :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :property-name :type :ref :ref "Value" :items nil :optional nil :doc "The resulting key text after modification."))
  :doc "Modifies the property rule property name." :experimental nil :deprecated nil)

(define-domain-command set-keyframe-key
  :method "CSS.setKeyframeKey"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional nil :doc "")
        (:name :key-text :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :key-text :type :ref :ref "Value" :items nil :optional nil :doc "The resulting key text after modification."))
  :doc "Modifies the keyframe rule key text." :experimental nil :deprecated nil)

(define-domain-command set-media-text
  :method "CSS.setMediaText"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional nil :doc "")
        (:name :text :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :media :type :ref :ref "CSSMedia" :items nil :optional nil :doc "The resulting CSS media rule after modification."))
  :doc "Modifies the rule selector." :experimental nil :deprecated nil)

(define-domain-command set-container-query-text
  :method "CSS.setContainerQueryText"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional nil :doc "")
        (:name :text :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :container-query :type :ref :ref "CSSContainerQuery" :items nil :optional nil :doc "The resulting CSS container query rule after modification."))
  :doc "Modifies the expression of a container query." :experimental t :deprecated nil)

(define-domain-command set-supports-text
  :method "CSS.setSupportsText"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional nil :doc "")
        (:name :text :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :supports :type :ref :ref "CSSSupports" :items nil :optional nil :doc "The resulting CSS Supports rule after modification."))
  :doc "Modifies the expression of a supports at-rule." :experimental t :deprecated nil)

(define-domain-command set-scope-text
  :method "CSS.setScopeText"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional nil :doc "")
        (:name :text :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :scope :type :ref :ref "CSSScope" :items nil :optional nil :doc "The resulting CSS Scope rule after modification."))
  :doc "Modifies the expression of a scope at-rule." :experimental t :deprecated nil)

(define-domain-command set-rule-selector
  :method "CSS.setRuleSelector"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :range :type :ref :ref "SourceRange" :items nil :optional nil :doc "")
        (:name :selector :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :selector-list :type :ref :ref "SelectorList" :items nil :optional nil :doc "The resulting selector list after modification."))
  :doc "Modifies the rule selector." :experimental nil :deprecated nil)

(define-domain-command set-style-sheet-text
  :method "CSS.setStyleSheetText"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "")
        (:name :text :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :source-map-url :type :string :ref nil :items nil :optional t :doc "URL of source map associated with script (if any)."))
  :doc "Sets the new stylesheet text." :experimental nil :deprecated nil)

(define-domain-command set-style-texts
  :method "CSS.setStyleTexts"
  :params (
        (:name :edits :type :array :ref nil :items (:type :ref :ref "StyleDeclarationEdit") :optional nil :doc "")
        (:name :node-for-property-syntax-validation :type :ref :ref "DOM.NodeId" :items nil :optional t :doc "NodeId for the DOM node in whose context custom property declarations for registered properties should be validated. If omitted, declarations in the new rule text can only be validated statically, which may produce incorrect results if the declaration contains a var() for example."))
  :returns (
        (:name :styles :type :array :ref nil :items (:type :ref :ref "CSSStyle") :optional nil :doc "The resulting styles after modification."))
  :doc "Applies specified style edits one after another in the given order." :experimental nil :deprecated nil)

(define-domain-command start-rule-usage-tracking
  :method "CSS.startRuleUsageTracking"
  :params nil
  :returns nil
  :doc "Enables the selector recording." :experimental nil :deprecated nil)

(define-domain-command stop-rule-usage-tracking
  :method "CSS.stopRuleUsageTracking"
  :params nil
  :returns (
        (:name :rule-usage :type :array :ref nil :items (:type :ref :ref "RuleUsage") :optional nil :doc ""))
  :doc "Stop tracking rule usage and return the list of rules that were used since last call to `takeCoverageDelta` (or since start of coverage instrumentation)." :experimental nil :deprecated nil)

(define-domain-command take-coverage-delta
  :method "CSS.takeCoverageDelta"
  :params nil
  :returns (
        (:name :coverage :type :array :ref nil :items (:type :ref :ref "RuleUsage") :optional nil :doc "")
        (:name :timestamp :type :number :ref nil :items nil :optional nil :doc "Monotonically increasing time, in seconds."))
  :doc "Obtain list of rules that became used since last call to this method (or since start of coverage instrumentation)." :experimental nil :deprecated nil)

(define-domain-command set-local-fonts-enabled
  :method "CSS.setLocalFontsEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc "Whether rendering of local fonts is enabled."))
  :returns nil
  :doc "Enables/disables rendering of local CSS fonts (enabled by default)." :experimental t :deprecated nil)

(define-domain-event fonts-updated
  :method "CSS.fontsUpdated"
  :params (
        (:name :font :type :ref :ref "FontFace" :items nil :optional t :doc "The web font that has loaded."))
  :doc "Fires whenever a web font is updated.  A non-empty font parameter indicates a successfully loaded web font." :experimental nil :deprecated nil)

(define-domain-event media-query-result-changed
  :method "CSS.mediaQueryResultChanged"
  :params nil
  :doc "Fires whenever a MediaQuery result changes (for example, after a browser window has been resized.) The current implementation considers only viewport-dependent media features." :experimental nil :deprecated nil)

(define-domain-event style-sheet-added
  :method "CSS.styleSheetAdded"
  :params (
        (:name :header :type :ref :ref "CSSStyleSheetHeader" :items nil :optional nil :doc "Added stylesheet metainfo."))
  :doc "Fired whenever an active document stylesheet is added." :experimental nil :deprecated nil)

(define-domain-event style-sheet-changed
  :method "CSS.styleSheetChanged"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc ""))
  :doc "Fired whenever a stylesheet is changed as a result of the client operation." :experimental nil :deprecated nil)

(define-domain-event style-sheet-removed
  :method "CSS.styleSheetRemoved"
  :params (
        (:name :style-sheet-id :type :ref :ref "DOM.StyleSheetId" :items nil :optional nil :doc "Identifier of the removed stylesheet."))
  :doc "Fired whenever an active document stylesheet is removed." :experimental nil :deprecated nil)

(define-domain-event computed-style-updated
  :method "CSS.computedStyleUpdated"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "The node id that has updated computed styles."))
  :doc "" :experimental t :deprecated nil)

