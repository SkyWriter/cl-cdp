;;;; Runtime CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/runtime
  (:use #:cl)
  (:shadow
    #:disable
    #:enable
    #:get-properties
  )
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/runtime)

(define-domain-type script-id
  :cdp-id "ScriptId" :type :string
  :properties nil
  :enum nil
  :doc "Unique script identifier." :experimental nil :deprecated nil)

(define-domain-type serialization-options
  :cdp-id "SerializationOptions" :type :object
  :properties (
        (:name :serialization :type :string :ref nil :items nil :optional nil :doc "")
        (:name :max-depth :type :integer :ref nil :items nil :optional t :doc "Deep serialization depth. Default is full depth. Respected only in `deep` serialization mode.")
        (:name :additional-parameters :type :object :ref nil :items nil :optional t :doc "Embedder-specific parameters. For example if connected to V8 in Chrome these control DOM serialization via `maxNodeDepth: integer` and `includeShadowTree: \"none\" | \"open\" | \"all\"`. Values can be only of type string or integer."))
  :enum nil
  :doc "Represents options for serialization. Overrides `generatePreview` and `returnByValue`." :experimental nil :deprecated nil)

(define-domain-type deep-serialized-value
  :cdp-id "DeepSerializedValue" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "")
        (:name :value :type :any :ref nil :items nil :optional t :doc "")
        (:name :object-id :type :string :ref nil :items nil :optional t :doc "")
        (:name :weak-local-object-reference :type :integer :ref nil :items nil :optional t :doc "Set if value reference met more then once during serialization. In such case, value is provided only to one of the serialized values. Unique per value in the scope of one CDP call."))
  :enum nil
  :doc "Represents deep serialized value." :experimental nil :deprecated nil)

(define-domain-type remote-object-id
  :cdp-id "RemoteObjectId" :type :string
  :properties nil
  :enum nil
  :doc "Unique object identifier." :experimental nil :deprecated nil)

(define-domain-type unserializable-value
  :cdp-id "UnserializableValue" :type :string
  :properties nil
  :enum nil
  :doc "Primitive value which cannot be JSON-stringified. Includes values `-0`, `NaN`, `Infinity`, `-Infinity`, and bigint literals." :experimental nil :deprecated nil)

(define-domain-type remote-object
  :cdp-id "RemoteObject" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Object type.")
        (:name :subtype :type :string :ref nil :items nil :optional t :doc "Object subtype hint. Specified for `object` type values only. NOTE: If you change anything here, make sure to also update `subtype` in `ObjectPreview` and `PropertyPreview` below.")
        (:name :class-name :type :string :ref nil :items nil :optional t :doc "Object class (constructor) name. Specified for `object` type values only.")
        (:name :value :type :any :ref nil :items nil :optional t :doc "Remote object value in case of primitive values or JSON values (if it was requested).")
        (:name :unserializable-value :type :ref :ref "UnserializableValue" :items nil :optional t :doc "Primitive value which can not be JSON-stringified does not have `value`, but gets this property.")
        (:name :description :type :string :ref nil :items nil :optional t :doc "String representation of the object.")
        (:name :deep-serialized-value :type :ref :ref "DeepSerializedValue" :items nil :optional t :doc "Deep serialized value.")
        (:name :object-id :type :ref :ref "RemoteObjectId" :items nil :optional t :doc "Unique object identifier (for non-primitive values).")
        (:name :preview :type :ref :ref "ObjectPreview" :items nil :optional t :doc "Preview containing abbreviated property values. Specified for `object` type values only.")
        (:name :custom-preview :type :ref :ref "CustomPreview" :items nil :optional t :doc ""))
  :enum nil
  :doc "Mirror object referencing original JavaScript object." :experimental nil :deprecated nil)

(define-domain-type custom-preview
  :cdp-id "CustomPreview" :type :object
  :properties (
        (:name :header :type :string :ref nil :items nil :optional nil :doc "The JSON-stringified result of formatter.header(object, config) call. It contains json ML array that represents RemoteObject.")
        (:name :body-getter-id :type :ref :ref "RemoteObjectId" :items nil :optional t :doc "If formatter returns true as a result of formatter.hasBody call then bodyGetterId will contain RemoteObjectId for the function that returns result of formatter.body(object, config) call. The result value is json ML array."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type object-preview
  :cdp-id "ObjectPreview" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Object type.")
        (:name :subtype :type :string :ref nil :items nil :optional t :doc "Object subtype hint. Specified for `object` type values only.")
        (:name :description :type :string :ref nil :items nil :optional t :doc "String representation of the object.")
        (:name :overflow :type :boolean :ref nil :items nil :optional nil :doc "True iff some of the properties or entries of the original object did not fit.")
        (:name :properties :type :array :ref nil :items (:type :ref :ref "PropertyPreview") :optional nil :doc "List of the properties.")
        (:name :entries :type :array :ref nil :items (:type :ref :ref "EntryPreview") :optional t :doc "List of the entries. Specified for `map` and `set` subtype values only."))
  :enum nil
  :doc "Object containing abbreviated remote object value." :experimental t :deprecated nil)

(define-domain-type property-preview
  :cdp-id "PropertyPreview" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Property name.")
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Object type. Accessor means that the property itself is an accessor property.")
        (:name :value :type :string :ref nil :items nil :optional t :doc "User-friendly property value string.")
        (:name :value-preview :type :ref :ref "ObjectPreview" :items nil :optional t :doc "Nested value preview.")
        (:name :subtype :type :string :ref nil :items nil :optional t :doc "Object subtype hint. Specified for `object` type values only."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type entry-preview
  :cdp-id "EntryPreview" :type :object
  :properties (
        (:name :key :type :ref :ref "ObjectPreview" :items nil :optional t :doc "Preview of the key. Specified for map-like collection entries.")
        (:name :value :type :ref :ref "ObjectPreview" :items nil :optional nil :doc "Preview of the value."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type property-descriptor
  :cdp-id "PropertyDescriptor" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Property name or symbol description.")
        (:name :value :type :ref :ref "RemoteObject" :items nil :optional t :doc "The value associated with the property.")
        (:name :writable :type :boolean :ref nil :items nil :optional t :doc "True if the value associated with the property may be changed (data descriptors only).")
        (:name :get :type :ref :ref "RemoteObject" :items nil :optional t :doc "A function which serves as a getter for the property, or `undefined` if there is no getter (accessor descriptors only).")
        (:name :set :type :ref :ref "RemoteObject" :items nil :optional t :doc "A function which serves as a setter for the property, or `undefined` if there is no setter (accessor descriptors only).")
        (:name :configurable :type :boolean :ref nil :items nil :optional nil :doc "True if the type of this property descriptor may be changed and if the property may be deleted from the corresponding object.")
        (:name :enumerable :type :boolean :ref nil :items nil :optional nil :doc "True if this property shows up during enumeration of the properties on the corresponding object.")
        (:name :was-thrown :type :boolean :ref nil :items nil :optional t :doc "True if the result was thrown during the evaluation.")
        (:name :is-own :type :boolean :ref nil :items nil :optional t :doc "True if the property is owned for the object.")
        (:name :symbol :type :ref :ref "RemoteObject" :items nil :optional t :doc "Property symbol object, if the property is of the `symbol` type."))
  :enum nil
  :doc "Object property descriptor." :experimental nil :deprecated nil)

(define-domain-type internal-property-descriptor
  :cdp-id "InternalPropertyDescriptor" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Conventional property name.")
        (:name :value :type :ref :ref "RemoteObject" :items nil :optional t :doc "The value associated with the property."))
  :enum nil
  :doc "Object internal property descriptor. This property isn't normally visible in JavaScript code." :experimental nil :deprecated nil)

(define-domain-type private-property-descriptor
  :cdp-id "PrivatePropertyDescriptor" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Private property name.")
        (:name :value :type :ref :ref "RemoteObject" :items nil :optional t :doc "The value associated with the private property.")
        (:name :get :type :ref :ref "RemoteObject" :items nil :optional t :doc "A function which serves as a getter for the private property, or `undefined` if there is no getter (accessor descriptors only).")
        (:name :set :type :ref :ref "RemoteObject" :items nil :optional t :doc "A function which serves as a setter for the private property, or `undefined` if there is no setter (accessor descriptors only)."))
  :enum nil
  :doc "Object private field descriptor." :experimental t :deprecated nil)

(define-domain-type call-argument
  :cdp-id "CallArgument" :type :object
  :properties (
        (:name :value :type :any :ref nil :items nil :optional t :doc "Primitive value or serializable javascript object.")
        (:name :unserializable-value :type :ref :ref "UnserializableValue" :items nil :optional t :doc "Primitive value which can not be JSON-stringified.")
        (:name :object-id :type :ref :ref "RemoteObjectId" :items nil :optional t :doc "Remote object handle."))
  :enum nil
  :doc "Represents function call argument. Either remote object id `objectId`, primitive `value`, unserializable primitive value or neither of (for undefined) them should be specified." :experimental nil :deprecated nil)

(define-domain-type execution-context-id
  :cdp-id "ExecutionContextId" :type :integer
  :properties nil
  :enum nil
  :doc "Id of an execution context." :experimental nil :deprecated nil)

(define-domain-type execution-context-description
  :cdp-id "ExecutionContextDescription" :type :object
  :properties (
        (:name :id :type :ref :ref "ExecutionContextId" :items nil :optional nil :doc "Unique id of the execution context. It can be used to specify in which execution context script evaluation should be performed.")
        (:name :origin :type :string :ref nil :items nil :optional nil :doc "Execution context origin.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "Human readable name describing given context.")
        (:name :unique-id :type :string :ref nil :items nil :optional nil :doc "A system-unique execution context identifier. Unlike the id, this is unique across multiple processes, so can be reliably used to identify specific context while backend performs a cross-process navigation.")
        (:name :aux-data :type :object :ref nil :items nil :optional t :doc "Embedder-specific auxiliary data likely matching {isDefault: boolean, type: 'default'|'isolated'|'worker', frameId: string}"))
  :enum nil
  :doc "Description of an isolated world." :experimental nil :deprecated nil)

(define-domain-type exception-details
  :cdp-id "ExceptionDetails" :type :object
  :properties (
        (:name :exception-id :type :integer :ref nil :items nil :optional nil :doc "Exception id.")
        (:name :text :type :string :ref nil :items nil :optional nil :doc "Exception text, which should be used together with exception object when available.")
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "Line number of the exception location (0-based).")
        (:name :column-number :type :integer :ref nil :items nil :optional nil :doc "Column number of the exception location (0-based).")
        (:name :script-id :type :ref :ref "ScriptId" :items nil :optional t :doc "Script ID of the exception location.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "URL of the exception location, to be used when the script was not reported.")
        (:name :stack-trace :type :ref :ref "StackTrace" :items nil :optional t :doc "JavaScript stack trace if available.")
        (:name :exception :type :ref :ref "RemoteObject" :items nil :optional t :doc "Exception object if available.")
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional t :doc "Identifier of the context where exception happened.")
        (:name :exception-meta-data :type :object :ref nil :items nil :optional t :doc "Dictionary with entries of meta data that the client associated with this exception, such as information about associated network requests, etc."))
  :enum nil
  :doc "Detailed information about exception (or error) that was thrown during script compilation or execution." :experimental nil :deprecated nil)

(define-domain-type timestamp
  :cdp-id "Timestamp" :type :number
  :properties nil
  :enum nil
  :doc "Number of milliseconds since epoch." :experimental nil :deprecated nil)

(define-domain-type time-delta
  :cdp-id "TimeDelta" :type :number
  :properties nil
  :enum nil
  :doc "Number of milliseconds." :experimental nil :deprecated nil)

(define-domain-type call-frame
  :cdp-id "CallFrame" :type :object
  :properties (
        (:name :function-name :type :string :ref nil :items nil :optional nil :doc "JavaScript function name.")
        (:name :script-id :type :ref :ref "ScriptId" :items nil :optional nil :doc "JavaScript script id.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "JavaScript script name or url.")
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "JavaScript script line number (0-based).")
        (:name :column-number :type :integer :ref nil :items nil :optional nil :doc "JavaScript script column number (0-based)."))
  :enum nil
  :doc "Stack entry for runtime errors and assertions." :experimental nil :deprecated nil)

(define-domain-type stack-trace
  :cdp-id "StackTrace" :type :object
  :properties (
        (:name :description :type :string :ref nil :items nil :optional t :doc "String label of this stack trace. For async traces this may be a name of the function that initiated the async call.")
        (:name :call-frames :type :array :ref nil :items (:type :ref :ref "CallFrame") :optional nil :doc "JavaScript function name.")
        (:name :parent :type :ref :ref "StackTrace" :items nil :optional t :doc "Asynchronous JavaScript stack trace that preceded this stack, if available.")
        (:name :parent-id :type :ref :ref "StackTraceId" :items nil :optional t :doc "Asynchronous JavaScript stack trace that preceded this stack, if available."))
  :enum nil
  :doc "Call frames for assertions or error messages." :experimental nil :deprecated nil)

(define-domain-type unique-debugger-id
  :cdp-id "UniqueDebuggerId" :type :string
  :properties nil
  :enum nil
  :doc "Unique identifier of current debugger." :experimental t :deprecated nil)

(define-domain-type stack-trace-id
  :cdp-id "StackTraceId" :type :object
  :properties (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "")
        (:name :debugger-id :type :ref :ref "UniqueDebuggerId" :items nil :optional t :doc ""))
  :enum nil
  :doc "If `debuggerId` is set stack trace comes from another debugger and can be resolved there. This allows to track cross-debugger calls. See `Runtime.StackTrace` and `Debugger.paused` for usages." :experimental t :deprecated nil)

(define-domain-command await-promise
  :method "Runtime.awaitPromise"
  :params (
        (:name :promise-object-id :type :ref :ref "RemoteObjectId" :items nil :optional nil :doc "Identifier of the promise.")
        (:name :return-by-value :type :boolean :ref nil :items nil :optional t :doc "Whether the result is expected to be a JSON object that should be sent by value.")
        (:name :generate-preview :type :boolean :ref nil :items nil :optional t :doc "Whether preview should be generated for the result."))
  :returns (
        (:name :result :type :ref :ref "RemoteObject" :items nil :optional nil :doc "Promise result. Will contain rejected value if promise was rejected.")
        (:name :exception-details :type :ref :ref "ExceptionDetails" :items nil :optional t :doc "Exception details if stack strace is available."))
  :doc "Add handler to promise with given promise object id." :experimental nil :deprecated nil)

(define-domain-command call-function-on
  :method "Runtime.callFunctionOn"
  :params (
        (:name :function-declaration :type :string :ref nil :items nil :optional nil :doc "Declaration of the function to call.")
        (:name :object-id :type :ref :ref "RemoteObjectId" :items nil :optional t :doc "Identifier of the object to call function on. Either objectId or executionContextId should be specified.")
        (:name :arguments :type :array :ref nil :items (:type :ref :ref "CallArgument") :optional t :doc "Call arguments. All call arguments must belong to the same JavaScript world as the target object.")
        (:name :silent :type :boolean :ref nil :items nil :optional t :doc "In silent mode exceptions thrown during evaluation are not reported and do not pause execution. Overrides `setPauseOnException` state.")
        (:name :return-by-value :type :boolean :ref nil :items nil :optional t :doc "Whether the result is expected to be a JSON object which should be sent by value. Can be overriden by `serializationOptions`.")
        (:name :generate-preview :type :boolean :ref nil :items nil :optional t :doc "Whether preview should be generated for the result.")
        (:name :user-gesture :type :boolean :ref nil :items nil :optional t :doc "Whether execution should be treated as initiated by user in the UI.")
        (:name :await-promise :type :boolean :ref nil :items nil :optional t :doc "Whether execution should `await` for resulting value and return once awaited promise is resolved.")
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional t :doc "Specifies execution context which global object will be used to call function on. Either executionContextId or objectId should be specified.")
        (:name :object-group :type :string :ref nil :items nil :optional t :doc "Symbolic group name that can be used to release multiple objects. If objectGroup is not specified and objectId is, objectGroup will be inherited from object.")
        (:name :throw-on-side-effect :type :boolean :ref nil :items nil :optional t :doc "Whether to throw an exception if side effect cannot be ruled out during evaluation.")
        (:name :unique-context-id :type :string :ref nil :items nil :optional t :doc "An alternative way to specify the execution context to call function on. Compared to contextId that may be reused across processes, this is guaranteed to be system-unique, so it can be used to prevent accidental function call in context different than intended (e.g. as a result of navigation across process boundaries). This is mutually exclusive with `executionContextId`.")
        (:name :serialization-options :type :ref :ref "SerializationOptions" :items nil :optional t :doc "Specifies the result serialization. If provided, overrides `generatePreview` and `returnByValue`."))
  :returns (
        (:name :result :type :ref :ref "RemoteObject" :items nil :optional nil :doc "Call result.")
        (:name :exception-details :type :ref :ref "ExceptionDetails" :items nil :optional t :doc "Exception details."))
  :doc "Calls function with given declaration on the given object. Object group of the result is inherited from the target object." :experimental nil :deprecated nil)

(define-domain-command compile-script
  :method "Runtime.compileScript"
  :params (
        (:name :expression :type :string :ref nil :items nil :optional nil :doc "Expression to compile.")
        (:name :source-url :type :string :ref nil :items nil :optional nil :doc "Source url to be set for the script.")
        (:name :persist-script :type :boolean :ref nil :items nil :optional nil :doc "Specifies whether the compiled script should be persisted.")
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional t :doc "Specifies in which execution context to perform script run. If the parameter is omitted the evaluation will be performed in the context of the inspected page."))
  :returns (
        (:name :script-id :type :ref :ref "ScriptId" :items nil :optional t :doc "Id of the script.")
        (:name :exception-details :type :ref :ref "ExceptionDetails" :items nil :optional t :doc "Exception details."))
  :doc "Compiles expression." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Runtime.disable"
  :params nil
  :returns nil
  :doc "Disables reporting of execution contexts creation." :experimental nil :deprecated nil)

(define-domain-command discard-console-entries
  :method "Runtime.discardConsoleEntries"
  :params nil
  :returns nil
  :doc "Discards collected exceptions and console API calls." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Runtime.enable"
  :params nil
  :returns nil
  :doc "Enables reporting of execution contexts creation by means of `executionContextCreated` event. When the reporting gets enabled the event will be sent immediately for each existing execution context." :experimental nil :deprecated nil)

(define-domain-command evaluate
  :method "Runtime.evaluate"
  :params (
        (:name :expression :type :string :ref nil :items nil :optional nil :doc "Expression to evaluate.")
        (:name :object-group :type :string :ref nil :items nil :optional t :doc "Symbolic group name that can be used to release multiple objects.")
        (:name :include-command-line-api :type :boolean :ref nil :items nil :optional t :doc "Determines whether Command Line API should be available during the evaluation.")
        (:name :silent :type :boolean :ref nil :items nil :optional t :doc "In silent mode exceptions thrown during evaluation are not reported and do not pause execution. Overrides `setPauseOnException` state.")
        (:name :context-id :type :ref :ref "ExecutionContextId" :items nil :optional t :doc "Specifies in which execution context to perform evaluation. If the parameter is omitted the evaluation will be performed in the context of the inspected page. This is mutually exclusive with `uniqueContextId`, which offers an alternative way to identify the execution context that is more reliable in a multi-process environment.")
        (:name :return-by-value :type :boolean :ref nil :items nil :optional t :doc "Whether the result is expected to be a JSON object that should be sent by value.")
        (:name :generate-preview :type :boolean :ref nil :items nil :optional t :doc "Whether preview should be generated for the result.")
        (:name :user-gesture :type :boolean :ref nil :items nil :optional t :doc "Whether execution should be treated as initiated by user in the UI.")
        (:name :await-promise :type :boolean :ref nil :items nil :optional t :doc "Whether execution should `await` for resulting value and return once awaited promise is resolved.")
        (:name :throw-on-side-effect :type :boolean :ref nil :items nil :optional t :doc "Whether to throw an exception if side effect cannot be ruled out during evaluation. This implies `disableBreaks` below.")
        (:name :timeout :type :ref :ref "TimeDelta" :items nil :optional t :doc "Terminate execution after timing out (number of milliseconds).")
        (:name :disable-breaks :type :boolean :ref nil :items nil :optional t :doc "Disable breakpoints during execution.")
        (:name :repl-mode :type :boolean :ref nil :items nil :optional t :doc "Setting this flag to true enables `let` re-declaration and top-level `await`. Note that `let` variables can only be re-declared if they originate from `replMode` themselves.")
        (:name :allow-unsafe-eval-blocked-by-csp :type :boolean :ref nil :items nil :optional t :doc "The Content Security Policy (CSP) for the target might block 'unsafe-eval' which includes eval(), Function(), setTimeout() and setInterval() when called with non-callable arguments. This flag bypasses CSP for this evaluation and allows unsafe-eval. Defaults to true.")
        (:name :unique-context-id :type :string :ref nil :items nil :optional t :doc "An alternative way to specify the execution context to evaluate in. Compared to contextId that may be reused across processes, this is guaranteed to be system-unique, so it can be used to prevent accidental evaluation of the expression in context different than intended (e.g. as a result of navigation across process boundaries). This is mutually exclusive with `contextId`.")
        (:name :serialization-options :type :ref :ref "SerializationOptions" :items nil :optional t :doc "Specifies the result serialization. If provided, overrides `generatePreview` and `returnByValue`."))
  :returns (
        (:name :result :type :ref :ref "RemoteObject" :items nil :optional nil :doc "Evaluation result.")
        (:name :exception-details :type :ref :ref "ExceptionDetails" :items nil :optional t :doc "Exception details."))
  :doc "Evaluates expression on global object." :experimental nil :deprecated nil)

(define-domain-command get-isolate-id
  :method "Runtime.getIsolateId"
  :params nil
  :returns (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "The isolate id."))
  :doc "Returns the isolate id." :experimental t :deprecated nil)

(define-domain-command get-heap-usage
  :method "Runtime.getHeapUsage"
  :params nil
  :returns (
        (:name :used-size :type :number :ref nil :items nil :optional nil :doc "Used JavaScript heap size in bytes.")
        (:name :total-size :type :number :ref nil :items nil :optional nil :doc "Allocated JavaScript heap size in bytes.")
        (:name :embedder-heap-used-size :type :number :ref nil :items nil :optional nil :doc "Used size in bytes in the embedder's garbage-collected heap.")
        (:name :backing-storage-size :type :number :ref nil :items nil :optional nil :doc "Size in bytes of backing storage for array buffers and external strings."))
  :doc "Returns the JavaScript heap usage. It is the total usage of the corresponding isolate not scoped to a particular Runtime." :experimental t :deprecated nil)

(define-domain-command get-properties
  :method "Runtime.getProperties"
  :params (
        (:name :object-id :type :ref :ref "RemoteObjectId" :items nil :optional nil :doc "Identifier of the object to return properties for.")
        (:name :own-properties :type :boolean :ref nil :items nil :optional t :doc "If true, returns properties belonging only to the element itself, not to its prototype chain.")
        (:name :accessor-properties-only :type :boolean :ref nil :items nil :optional t :doc "If true, returns accessor properties (with getter/setter) only; internal properties are not returned either.")
        (:name :generate-preview :type :boolean :ref nil :items nil :optional t :doc "Whether preview should be generated for the results.")
        (:name :non-indexed-properties-only :type :boolean :ref nil :items nil :optional t :doc "If true, returns non-indexed properties only."))
  :returns (
        (:name :result :type :array :ref nil :items (:type :ref :ref "PropertyDescriptor") :optional nil :doc "Object properties.")
        (:name :internal-properties :type :array :ref nil :items (:type :ref :ref "InternalPropertyDescriptor") :optional t :doc "Internal object properties (only of the element itself).")
        (:name :private-properties :type :array :ref nil :items (:type :ref :ref "PrivatePropertyDescriptor") :optional t :doc "Object private properties.")
        (:name :exception-details :type :ref :ref "ExceptionDetails" :items nil :optional t :doc "Exception details."))
  :doc "Returns properties of a given object. Object group of the result is inherited from the target object." :experimental nil :deprecated nil)

(define-domain-command global-lexical-scope-names
  :method "Runtime.globalLexicalScopeNames"
  :params (
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional t :doc "Specifies in which execution context to lookup global scope variables."))
  :returns (
        (:name :names :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc ""))
  :doc "Returns all let, const and class variables from global scope." :experimental nil :deprecated nil)

(define-domain-command query-objects
  :method "Runtime.queryObjects"
  :params (
        (:name :prototype-object-id :type :ref :ref "RemoteObjectId" :items nil :optional nil :doc "Identifier of the prototype to return objects for.")
        (:name :object-group :type :string :ref nil :items nil :optional t :doc "Symbolic group name that can be used to release the results."))
  :returns (
        (:name :objects :type :ref :ref "RemoteObject" :items nil :optional nil :doc "Array with objects."))
  :doc "" :experimental nil :deprecated nil)

(define-domain-command release-object
  :method "Runtime.releaseObject"
  :params (
        (:name :object-id :type :ref :ref "RemoteObjectId" :items nil :optional nil :doc "Identifier of the object to release."))
  :returns nil
  :doc "Releases remote object with given id." :experimental nil :deprecated nil)

(define-domain-command release-object-group
  :method "Runtime.releaseObjectGroup"
  :params (
        (:name :object-group :type :string :ref nil :items nil :optional nil :doc "Symbolic object group name."))
  :returns nil
  :doc "Releases all remote objects that belong to a given group." :experimental nil :deprecated nil)

(define-domain-command run-if-waiting-for-debugger
  :method "Runtime.runIfWaitingForDebugger"
  :params nil
  :returns nil
  :doc "Tells inspected instance to run if it was waiting for debugger to attach." :experimental nil :deprecated nil)

(define-domain-command run-script
  :method "Runtime.runScript"
  :params (
        (:name :script-id :type :ref :ref "ScriptId" :items nil :optional nil :doc "Id of the script to run.")
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional t :doc "Specifies in which execution context to perform script run. If the parameter is omitted the evaluation will be performed in the context of the inspected page.")
        (:name :object-group :type :string :ref nil :items nil :optional t :doc "Symbolic group name that can be used to release multiple objects.")
        (:name :silent :type :boolean :ref nil :items nil :optional t :doc "In silent mode exceptions thrown during evaluation are not reported and do not pause execution. Overrides `setPauseOnException` state.")
        (:name :include-command-line-api :type :boolean :ref nil :items nil :optional t :doc "Determines whether Command Line API should be available during the evaluation.")
        (:name :return-by-value :type :boolean :ref nil :items nil :optional t :doc "Whether the result is expected to be a JSON object which should be sent by value.")
        (:name :generate-preview :type :boolean :ref nil :items nil :optional t :doc "Whether preview should be generated for the result.")
        (:name :await-promise :type :boolean :ref nil :items nil :optional t :doc "Whether execution should `await` for resulting value and return once awaited promise is resolved."))
  :returns (
        (:name :result :type :ref :ref "RemoteObject" :items nil :optional nil :doc "Run result.")
        (:name :exception-details :type :ref :ref "ExceptionDetails" :items nil :optional t :doc "Exception details."))
  :doc "Runs script with given id in a given context." :experimental nil :deprecated nil)

(define-domain-command set-async-call-stack-depth
  :method "Runtime.setAsyncCallStackDepth"
  :params (
        (:name :max-depth :type :integer :ref nil :items nil :optional nil :doc "Maximum depth of async call stacks. Setting to `0` will effectively disable collecting async call stacks (default)."))
  :returns nil
  :doc "Enables or disables async call stacks tracking." :experimental nil :deprecated nil)

(define-domain-command set-custom-object-formatter-enabled
  :method "Runtime.setCustomObjectFormatterEnabled"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command set-max-call-stack-size-to-capture
  :method "Runtime.setMaxCallStackSizeToCapture"
  :params (
        (:name :size :type :integer :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command terminate-execution
  :method "Runtime.terminateExecution"
  :params nil
  :returns nil
  :doc "Terminate current or next JavaScript execution. Will cancel the termination when the outer-most script execution ends." :experimental t :deprecated nil)

(define-domain-command add-binding
  :method "Runtime.addBinding"
  :params (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional t :doc "If specified, the binding would only be exposed to the specified execution context. If omitted and `executionContextName` is not set, the binding is exposed to all execution contexts of the target. This parameter is mutually exclusive with `executionContextName`. Deprecated in favor of `executionContextName` due to an unclear use case and bugs in implementation (crbug.com/1169639). `executionContextId` will be removed in the future.")
        (:name :execution-context-name :type :string :ref nil :items nil :optional t :doc "If specified, the binding is exposed to the executionContext with matching name, even for contexts created after the binding is added. See also `ExecutionContext.name` and `worldName` parameter to `Page.addScriptToEvaluateOnNewDocument`. This parameter is mutually exclusive with `executionContextId`."))
  :returns nil
  :doc "If executionContextId is empty, adds binding with the given name on the global objects of all inspected contexts, including those created later, bindings survive reloads. Binding function takes exactly one argument, this argument should be string, in case of any other input, function throws an exception. Each binding function call produces Runtime.bindingCalled notification." :experimental nil :deprecated nil)

(define-domain-command remove-binding
  :method "Runtime.removeBinding"
  :params (
        (:name :name :type :string :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "This method does not remove binding function from global object but unsubscribes current runtime agent from Runtime.bindingCalled notifications." :experimental nil :deprecated nil)

(define-domain-command get-exception-details
  :method "Runtime.getExceptionDetails"
  :params (
        (:name :error-object-id :type :ref :ref "RemoteObjectId" :items nil :optional nil :doc "The error object for which to resolve the exception details."))
  :returns (
        (:name :exception-details :type :ref :ref "ExceptionDetails" :items nil :optional t :doc ""))
  :doc "This method tries to lookup and populate exception details for a JavaScript Error object. Note that the stackTrace portion of the resulting exceptionDetails will only be populated if the Runtime domain was enabled at the time when the Error was thrown." :experimental t :deprecated nil)

(define-domain-event binding-called
  :method "Runtime.bindingCalled"
  :params (
        (:name :name :type :string :ref nil :items nil :optional nil :doc "")
        (:name :payload :type :string :ref nil :items nil :optional nil :doc "")
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional nil :doc "Identifier of the context where the call was made."))
  :doc "Notification is issued every time when binding is called." :experimental t :deprecated nil)

(define-domain-event console-api-called
  :method "Runtime.consoleAPICalled"
  :params (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of the call.")
        (:name :args :type :array :ref nil :items (:type :ref :ref "RemoteObject") :optional nil :doc "Call arguments.")
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional nil :doc "Identifier of the context where the call was made.")
        (:name :timestamp :type :ref :ref "Timestamp" :items nil :optional nil :doc "Call timestamp.")
        (:name :stack-trace :type :ref :ref "StackTrace" :items nil :optional t :doc "Stack trace captured when the call was made. The async stack chain is automatically reported for the following call types: `assert`, `error`, `trace`, `warning`. For other types the async call chain can be retrieved using `Debugger.getStackTrace` and `stackTrace.parentId` field.")
        (:name :context :type :string :ref nil :items nil :optional t :doc "Console context descriptor for calls on non-default console context (not console.*): 'anonymous#unique-logger-id' for call on unnamed context, 'name#unique-logger-id' for call on named context."))
  :doc "Issued when console API was called." :experimental nil :deprecated nil)

(define-domain-event exception-revoked
  :method "Runtime.exceptionRevoked"
  :params (
        (:name :reason :type :string :ref nil :items nil :optional nil :doc "Reason describing why exception was revoked.")
        (:name :exception-id :type :integer :ref nil :items nil :optional nil :doc "The id of revoked exception, as reported in `exceptionThrown`."))
  :doc "Issued when unhandled exception was revoked." :experimental nil :deprecated nil)

(define-domain-event exception-thrown
  :method "Runtime.exceptionThrown"
  :params (
        (:name :timestamp :type :ref :ref "Timestamp" :items nil :optional nil :doc "Timestamp of the exception.")
        (:name :exception-details :type :ref :ref "ExceptionDetails" :items nil :optional nil :doc ""))
  :doc "Issued when exception was thrown and unhandled." :experimental nil :deprecated nil)

(define-domain-event execution-context-created
  :method "Runtime.executionContextCreated"
  :params (
        (:name :context :type :ref :ref "ExecutionContextDescription" :items nil :optional nil :doc "A newly created execution context."))
  :doc "Issued when new execution context is created." :experimental nil :deprecated nil)

(define-domain-event execution-context-destroyed
  :method "Runtime.executionContextDestroyed"
  :params (
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional nil :doc "Id of the destroyed context")
        (:name :execution-context-unique-id :type :string :ref nil :items nil :optional nil :doc "Unique Id of the destroyed context"))
  :doc "Issued when execution context is destroyed." :experimental nil :deprecated nil)

(define-domain-event execution-contexts-cleared
  :method "Runtime.executionContextsCleared"
  :params nil
  :doc "Issued when all executionContexts were cleared in browser" :experimental nil :deprecated nil)

(define-domain-event inspect-requested
  :method "Runtime.inspectRequested"
  :params (
        (:name :object :type :ref :ref "RemoteObject" :items nil :optional nil :doc "")
        (:name :hints :type :object :ref nil :items nil :optional nil :doc "")
        (:name :execution-context-id :type :ref :ref "ExecutionContextId" :items nil :optional t :doc "Identifier of the context where the call was made."))
  :doc "Issued when object should be inspected (for example, as a result of inspect() command line API call)." :experimental nil :deprecated nil)

