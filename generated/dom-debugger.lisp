;;;; DOMDebugger CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/dom-debugger
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/dom-debugger)

(define-domain-type dom-breakpoint-type
  :cdp-id "DOMBreakpointType" :type :string
  :properties nil
  :enum '("subtree-modified" "attribute-modified" "node-removed")
  :doc "DOM breakpoint type." :experimental nil :deprecated nil)

(define-domain-type csp-violation-type
  :cdp-id "CSPViolationType" :type :string
  :properties nil
  :enum '("trustedtype-sink-violation" "trustedtype-policy-violation")
  :doc "CSP Violation type." :experimental t :deprecated nil)

(define-domain-type event-listener
  :cdp-id "EventListener" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "`EventListener`'s type.")
        (:name :use-capture :type :boolean :ref nil :items nil :optional nil :doc "`EventListener`'s useCapture.")
        (:name :passive :type :boolean :ref nil :items nil :optional nil :doc "`EventListener`'s passive flag.")
        (:name :once :type :boolean :ref nil :items nil :optional nil :doc "`EventListener`'s once flag.")
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Script id of the handler code.")
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "Line number in the script (0-based).")
        (:name :column-number :type :integer :ref nil :items nil :optional nil :doc "Column number in the script (0-based).")
        (:name :handler :type :ref :ref "Runtime.RemoteObject" :items nil :optional t :doc "Event handler function value.")
        (:name :original-handler :type :ref :ref "Runtime.RemoteObject" :items nil :optional t :doc "Event original handler function value.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Node the listener is added to (if any)."))
  :enum nil
  :doc "Object event listener." :experimental nil :deprecated nil)

(define-domain-command get-event-listeners
  :method "DOMDebugger.getEventListeners"
  :params (
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional nil :doc "Identifier of the object to return listeners for.")
        (:name :depth :type :integer :ref nil :items nil :optional t :doc "The maximum depth at which Node children should be retrieved, defaults to 1. Use -1 for the entire subtree or provide an integer larger than 0.")
        (:name :pierce :type :boolean :ref nil :items nil :optional t :doc "Whether or not iframes and shadow roots should be traversed when returning the subtree (default is false). Reports listeners for all contexts if pierce is enabled."))
  :returns (
        (:name :listeners :type :array :ref nil :items (:type :ref :ref "EventListener") :optional nil :doc "Array of relevant listeners."))
  :doc "Returns event listeners of the given object." :experimental nil :deprecated nil)

(define-domain-command remove-dom-breakpoint
  :method "DOMDebugger.removeDOMBreakpoint"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Identifier of the node to remove breakpoint from.")
        (:name :type :type :ref :ref "DOMBreakpointType" :items nil :optional nil :doc "Type of the breakpoint to remove."))
  :returns nil
  :doc "Removes DOM breakpoint that was set using `setDOMBreakpoint`." :experimental nil :deprecated nil)

(define-domain-command remove-event-listener-breakpoint
  :method "DOMDebugger.removeEventListenerBreakpoint"
  :params (
        (:name :event-name :type :string :ref nil :items nil :optional nil :doc "Event name.")
        (:name :target-name :type :string :ref nil :items nil :optional t :doc "EventTarget interface name."))
  :returns nil
  :doc "Removes breakpoint on particular DOM event." :experimental nil :deprecated nil)

(define-domain-command remove-instrumentation-breakpoint
  :method "DOMDebugger.removeInstrumentationBreakpoint"
  :params (
        (:name :event-name :type :string :ref nil :items nil :optional nil :doc "Instrumentation name to stop on."))
  :returns nil
  :doc "Removes breakpoint on particular native event." :experimental t :deprecated t)

(define-domain-command remove-xhr-breakpoint
  :method "DOMDebugger.removeXHRBreakpoint"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Resource URL substring."))
  :returns nil
  :doc "Removes breakpoint from XMLHttpRequest." :experimental nil :deprecated nil)

(define-domain-command set-break-on-csp-violation
  :method "DOMDebugger.setBreakOnCSPViolation"
  :params (
        (:name :violation-types :type :array :ref nil :items (:type :ref :ref "CSPViolationType") :optional nil :doc "CSP Violations to stop upon."))
  :returns nil
  :doc "Sets breakpoint on particular CSP violations." :experimental t :deprecated nil)

(define-domain-command set-dom-breakpoint
  :method "DOMDebugger.setDOMBreakpoint"
  :params (
        (:name :node-id :type :ref :ref "DOM.NodeId" :items nil :optional nil :doc "Identifier of the node to set breakpoint on.")
        (:name :type :type :ref :ref "DOMBreakpointType" :items nil :optional nil :doc "Type of the operation to stop upon."))
  :returns nil
  :doc "Sets breakpoint on particular operation with DOM." :experimental nil :deprecated nil)

(define-domain-command set-event-listener-breakpoint
  :method "DOMDebugger.setEventListenerBreakpoint"
  :params (
        (:name :event-name :type :string :ref nil :items nil :optional nil :doc "DOM Event name to stop on (any DOM event will do).")
        (:name :target-name :type :string :ref nil :items nil :optional t :doc "EventTarget interface name to stop on. If equal to `\"*\"` or not provided, will stop on any EventTarget."))
  :returns nil
  :doc "Sets breakpoint on particular DOM event." :experimental nil :deprecated nil)

(define-domain-command set-instrumentation-breakpoint
  :method "DOMDebugger.setInstrumentationBreakpoint"
  :params (
        (:name :event-name :type :string :ref nil :items nil :optional nil :doc "Instrumentation name to stop on."))
  :returns nil
  :doc "Sets breakpoint on particular native event." :experimental t :deprecated t)

(define-domain-command set-xhr-breakpoint
  :method "DOMDebugger.setXHRBreakpoint"
  :params (
        (:name :url :type :string :ref nil :items nil :optional nil :doc "Resource URL substring. All XHRs having this substring in the URL will get stopped upon."))
  :returns nil
  :doc "Sets breakpoint on XMLHttpRequest." :experimental nil :deprecated nil)

