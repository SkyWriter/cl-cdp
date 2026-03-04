;;;; Debugger CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/debugger
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

(in-package #:cdp/debugger)

(define-domain-type breakpoint-id
  :cdp-id "BreakpointId" :type :string
  :properties nil
  :enum nil
  :doc "Breakpoint identifier." :experimental nil :deprecated nil)

(define-domain-type call-frame-id
  :cdp-id "CallFrameId" :type :string
  :properties nil
  :enum nil
  :doc "Call frame identifier." :experimental nil :deprecated nil)

(define-domain-type location
  :cdp-id "Location" :type :object
  :properties (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Script identifier as reported in the `Debugger.scriptParsed`.")
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "Line number in the script (0-based).")
        (:name :column-number :type :integer :ref nil :items nil :optional t :doc "Column number in the script (0-based)."))
  :enum nil
  :doc "Location in the source code." :experimental nil :deprecated nil)

(define-domain-type script-position
  :cdp-id "ScriptPosition" :type :object
  :properties (
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "")
        (:name :column-number :type :integer :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Location in the source code." :experimental t :deprecated nil)

(define-domain-type location-range
  :cdp-id "LocationRange" :type :object
  :properties (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "")
        (:name :start :type :ref :ref "ScriptPosition" :items nil :optional nil :doc "")
        (:name :end :type :ref :ref "ScriptPosition" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Location range within one script." :experimental t :deprecated nil)

(define-domain-type call-frame
  :cdp-id "CallFrame" :type :object
  :properties (
        (:name :call-frame-id :type :ref :ref "CallFrameId" :items nil :optional nil :doc "Call frame identifier. This identifier is only valid while the virtual machine is paused.")
        (:name :function-name :type :string :ref nil :items nil :optional nil :doc "Name of the JavaScript function called on this call frame.")
        (:name :function-location :type :ref :ref "Location" :items nil :optional t :doc "Location in the source code.")
        (:name :location :type :ref :ref "Location" :items nil :optional nil :doc "Location in the source code.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "JavaScript script name or url. Deprecated in favor of using the `location.scriptId` to resolve the URL via a previously sent `Debugger.scriptParsed` event.")
        (:name :scope-chain :type :array :ref nil :items (:type :ref :ref "Scope") :optional nil :doc "Scope chain for this call frame.")
        (:name :this :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "`this` object for this call frame.")
        (:name :return-value :type :ref :ref "Runtime.RemoteObject" :items nil :optional t :doc "The value being returned, if the function is at return point.")
        (:name :can-be-restarted :type :boolean :ref nil :items nil :optional t :doc "Valid only while the VM is paused and indicates whether this frame can be restarted or not. Note that a `true` value here does not guarantee that Debugger#restartFrame with this CallFrameId will be successful, but it is very likely."))
  :enum nil
  :doc "JavaScript call frame. Array of call frames form the call stack." :experimental nil :deprecated nil)

(define-domain-type scope
  :cdp-id "Scope" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Scope type.")
        (:name :object :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "Object representing the scope. For `global` and `with` scopes it represents the actual object; for the rest of the scopes, it is artificial transient object enumerating scope variables as its properties.")
        (:name :name :type :string :ref nil :items nil :optional t :doc "")
        (:name :start-location :type :ref :ref "Location" :items nil :optional t :doc "Location in the source code where scope starts")
        (:name :end-location :type :ref :ref "Location" :items nil :optional t :doc "Location in the source code where scope ends"))
  :enum nil
  :doc "Scope description." :experimental nil :deprecated nil)

(define-domain-type search-match
  :cdp-id "SearchMatch" :type :object
  :properties (
        (:name :line-number :type :number :ref nil :items nil :optional nil :doc "Line number in resource content.")
        (:name :line-content :type :string :ref nil :items nil :optional nil :doc "Line with match content."))
  :enum nil
  :doc "Search match for resource." :experimental nil :deprecated nil)

(define-domain-type break-location
  :cdp-id "BreakLocation" :type :object
  :properties (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Script identifier as reported in the `Debugger.scriptParsed`.")
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "Line number in the script (0-based).")
        (:name :column-number :type :integer :ref nil :items nil :optional t :doc "Column number in the script (0-based).")
        (:name :type :type :string :ref nil :items nil :optional t :doc ""))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type wasm-disassembly-chunk
  :cdp-id "WasmDisassemblyChunk" :type :object
  :properties (
        (:name :lines :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "The next chunk of disassembled lines.")
        (:name :bytecode-offsets :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "The bytecode offsets describing the start of each line."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type script-language
  :cdp-id "ScriptLanguage" :type :string
  :properties nil
  :enum '("JavaScript" "WebAssembly")
  :doc "Enum of possible script languages." :experimental nil :deprecated nil)

(define-domain-type debug-symbols
  :cdp-id "DebugSymbols" :type :object
  :properties (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of the debug symbols.")
        (:name :external-url :type :string :ref nil :items nil :optional t :doc "URL of the external symbol source."))
  :enum nil
  :doc "Debug symbols available for a wasm script." :experimental nil :deprecated nil)

(define-domain-type resolved-breakpoint
  :cdp-id "ResolvedBreakpoint" :type :object
  :properties (
        (:name :breakpoint-id :type :ref :ref "BreakpointId" :items nil :optional nil :doc "Breakpoint unique identifier.")
        (:name :location :type :ref :ref "Location" :items nil :optional nil :doc "Actual breakpoint location."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-command continue-to-location
  :method "Debugger.continueToLocation"
  :params (
        (:name :location :type :ref :ref "Location" :items nil :optional nil :doc "Location to continue to.")
        (:name :target-call-frames :type :string :ref nil :items nil :optional t :doc ""))
  :returns nil
  :doc "Continues execution until specific location is reached." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Debugger.disable"
  :params nil
  :returns nil
  :doc "Disables debugger for given page." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Debugger.enable"
  :params (
        (:name :max-scripts-cache-size :type :number :ref nil :items nil :optional t :doc "The maximum size in bytes of collected scripts (not referenced by other heap objects) the debugger can hold. Puts no limit if parameter is omitted."))
  :returns (
        (:name :debugger-id :type :ref :ref "Runtime.UniqueDebuggerId" :items nil :optional nil :doc "Unique identifier of the debugger."))
  :doc "Enables debugger for the given page. Clients should not assume that the debugging has been enabled until the result for this command is received." :experimental nil :deprecated nil)

(define-domain-command evaluate-on-call-frame
  :method "Debugger.evaluateOnCallFrame"
  :params (
        (:name :call-frame-id :type :ref :ref "CallFrameId" :items nil :optional nil :doc "Call frame identifier to evaluate on.")
        (:name :expression :type :string :ref nil :items nil :optional nil :doc "Expression to evaluate.")
        (:name :object-group :type :string :ref nil :items nil :optional t :doc "String object group name to put result into (allows rapid releasing resulting object handles using `releaseObjectGroup`).")
        (:name :include-command-line-api :type :boolean :ref nil :items nil :optional t :doc "Specifies whether command line API should be available to the evaluated expression, defaults to false.")
        (:name :silent :type :boolean :ref nil :items nil :optional t :doc "In silent mode exceptions thrown during evaluation are not reported and do not pause execution. Overrides `setPauseOnException` state.")
        (:name :return-by-value :type :boolean :ref nil :items nil :optional t :doc "Whether the result is expected to be a JSON object that should be sent by value.")
        (:name :generate-preview :type :boolean :ref nil :items nil :optional t :doc "Whether preview should be generated for the result.")
        (:name :throw-on-side-effect :type :boolean :ref nil :items nil :optional t :doc "Whether to throw an exception if side effect cannot be ruled out during evaluation.")
        (:name :timeout :type :ref :ref "Runtime.TimeDelta" :items nil :optional t :doc "Terminate execution after timing out (number of milliseconds)."))
  :returns (
        (:name :result :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "Object wrapper for the evaluation result.")
        (:name :exception-details :type :ref :ref "Runtime.ExceptionDetails" :items nil :optional t :doc "Exception details."))
  :doc "Evaluates expression on a given call frame." :experimental nil :deprecated nil)

(define-domain-command get-possible-breakpoints
  :method "Debugger.getPossibleBreakpoints"
  :params (
        (:name :start :type :ref :ref "Location" :items nil :optional nil :doc "Start of range to search possible breakpoint locations in.")
        (:name :end :type :ref :ref "Location" :items nil :optional t :doc "End of range to search possible breakpoint locations in (excluding). When not specified, end of scripts is used as end of range.")
        (:name :restrict-to-function :type :boolean :ref nil :items nil :optional t :doc "Only consider locations which are in the same (non-nested) function as start."))
  :returns (
        (:name :locations :type :array :ref nil :items (:type :ref :ref "BreakLocation") :optional nil :doc "List of the possible breakpoint locations."))
  :doc "Returns possible locations for breakpoint. scriptId in start and end range locations should be the same." :experimental nil :deprecated nil)

(define-domain-command get-script-source
  :method "Debugger.getScriptSource"
  :params (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Id of the script to get source for."))
  :returns (
        (:name :script-source :type :string :ref nil :items nil :optional nil :doc "Script source (empty in case of Wasm bytecode).")
        (:name :bytecode :type :string :ref nil :items nil :optional t :doc "Wasm bytecode. (Encoded as a base64 string when passed over JSON)"))
  :doc "Returns source for the script with given id." :experimental nil :deprecated nil)

(define-domain-command disassemble-wasm-module
  :method "Debugger.disassembleWasmModule"
  :params (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Id of the script to disassemble"))
  :returns (
        (:name :stream-id :type :string :ref nil :items nil :optional t :doc "For large modules, return a stream from which additional chunks of disassembly can be read successively.")
        (:name :total-number-of-lines :type :integer :ref nil :items nil :optional nil :doc "The total number of lines in the disassembly text.")
        (:name :function-body-offsets :type :array :ref nil :items (:type :integer :ref nil) :optional nil :doc "The offsets of all function bodies, in the format [start1, end1, start2, end2, ...] where all ends are exclusive.")
        (:name :chunk :type :ref :ref "WasmDisassemblyChunk" :items nil :optional nil :doc "The first chunk of disassembly."))
  :doc "" :experimental t :deprecated nil)

(define-domain-command next-wasm-disassembly-chunk
  :method "Debugger.nextWasmDisassemblyChunk"
  :params (
        (:name :stream-id :type :string :ref nil :items nil :optional nil :doc ""))
  :returns (
        (:name :chunk :type :ref :ref "WasmDisassemblyChunk" :items nil :optional nil :doc "The next chunk of disassembly."))
  :doc "Disassemble the next chunk of lines for the module corresponding to the stream. If disassembly is complete, this API will invalidate the streamId and return an empty chunk. Any subsequent calls for the now invalid stream will return errors." :experimental t :deprecated nil)

(define-domain-command get-wasm-bytecode
  :method "Debugger.getWasmBytecode"
  :params (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Id of the Wasm script to get source for."))
  :returns (
        (:name :bytecode :type :string :ref nil :items nil :optional nil :doc "Script source. (Encoded as a base64 string when passed over JSON)"))
  :doc "This command is deprecated. Use getScriptSource instead." :experimental nil :deprecated t)

(define-domain-command get-stack-trace
  :method "Debugger.getStackTrace"
  :params (
        (:name :stack-trace-id :type :ref :ref "Runtime.StackTraceId" :items nil :optional nil :doc ""))
  :returns (
        (:name :stack-trace :type :ref :ref "Runtime.StackTrace" :items nil :optional nil :doc ""))
  :doc "Returns stack trace with given `stackTraceId`." :experimental t :deprecated nil)

(define-domain-command pause
  :method "Debugger.pause"
  :params nil
  :returns nil
  :doc "Stops on the next JavaScript statement." :experimental nil :deprecated nil)

(define-domain-command pause-on-async-call
  :method "Debugger.pauseOnAsyncCall"
  :params (
        (:name :parent-stack-trace-id :type :ref :ref "Runtime.StackTraceId" :items nil :optional nil :doc "Debugger will pause when async call with given stack trace is started."))
  :returns nil
  :doc "" :experimental t :deprecated t)

(define-domain-command remove-breakpoint
  :method "Debugger.removeBreakpoint"
  :params (
        (:name :breakpoint-id :type :ref :ref "BreakpointId" :items nil :optional nil :doc ""))
  :returns nil
  :doc "Removes JavaScript breakpoint." :experimental nil :deprecated nil)

(define-domain-command restart-frame
  :method "Debugger.restartFrame"
  :params (
        (:name :call-frame-id :type :ref :ref "CallFrameId" :items nil :optional nil :doc "Call frame identifier to evaluate on.")
        (:name :mode :type :string :ref nil :items nil :optional t :doc "The `mode` parameter must be present and set to 'StepInto', otherwise `restartFrame` will error out."))
  :returns (
        (:name :call-frames :type :array :ref nil :items (:type :ref :ref "CallFrame") :optional nil :doc "New stack trace.")
        (:name :async-stack-trace :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "Async stack trace, if any.")
        (:name :async-stack-trace-id :type :ref :ref "Runtime.StackTraceId" :items nil :optional t :doc "Async stack trace, if any."))
  :doc "Restarts particular call frame from the beginning. The old, deprecated behavior of `restartFrame` is to stay paused and allow further CDP commands after a restart was scheduled. This can cause problems with restarting, so we now continue execution immediatly after it has been scheduled until we reach the beginning of the restarted frame.  To stay back-wards compatible, `restartFrame` now expects a `mode` parameter to be present. If the `mode` parameter is missing, `restartFrame` errors out.  The various return values are deprecated and `callFrames` is always empty. Use the call frames from the `Debugger#paused` events instead, that fires once V8 pauses at the beginning of the restarted function." :experimental nil :deprecated nil)

(define-domain-command resume
  :method "Debugger.resume"
  :params (
        (:name :terminate-on-resume :type :boolean :ref nil :items nil :optional t :doc "Set to true to terminate execution upon resuming execution. In contrast to Runtime.terminateExecution, this will allows to execute further JavaScript (i.e. via evaluation) until execution of the paused code is actually resumed, at which point termination is triggered. If execution is currently not paused, this parameter has no effect."))
  :returns nil
  :doc "Resumes JavaScript execution." :experimental nil :deprecated nil)

(define-domain-command search-in-content
  :method "Debugger.searchInContent"
  :params (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Id of the script to search in.")
        (:name :query :type :string :ref nil :items nil :optional nil :doc "String to search for.")
        (:name :case-sensitive :type :boolean :ref nil :items nil :optional t :doc "If true, search is case sensitive.")
        (:name :is-regex :type :boolean :ref nil :items nil :optional t :doc "If true, treats string parameter as regex."))
  :returns (
        (:name :result :type :array :ref nil :items (:type :ref :ref "SearchMatch") :optional nil :doc "List of search matches."))
  :doc "Searches for given string in script content." :experimental nil :deprecated nil)

(define-domain-command set-async-call-stack-depth
  :method "Debugger.setAsyncCallStackDepth"
  :params (
        (:name :max-depth :type :integer :ref nil :items nil :optional nil :doc "Maximum depth of async call stacks. Setting to `0` will effectively disable collecting async call stacks (default)."))
  :returns nil
  :doc "Enables or disables async call stacks tracking." :experimental nil :deprecated nil)

(define-domain-command set-blackbox-execution-contexts
  :method "Debugger.setBlackboxExecutionContexts"
  :params (
        (:name :unique-ids :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Array of execution context unique ids for the debugger to ignore."))
  :returns nil
  :doc "Replace previous blackbox execution contexts with passed ones. Forces backend to skip stepping/pausing in scripts in these execution contexts. VM will try to leave blackboxed script by performing 'step in' several times, finally resorting to 'step out' if unsuccessful." :experimental t :deprecated nil)

(define-domain-command set-blackbox-patterns
  :method "Debugger.setBlackboxPatterns"
  :params (
        (:name :patterns :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Array of regexps that will be used to check script url for blackbox state.")
        (:name :skip-anonymous :type :boolean :ref nil :items nil :optional t :doc "If true, also ignore scripts with no source url."))
  :returns nil
  :doc "Replace previous blackbox patterns with passed ones. Forces backend to skip stepping/pausing in scripts with url matching one of the patterns. VM will try to leave blackboxed script by performing 'step in' several times, finally resorting to 'step out' if unsuccessful." :experimental t :deprecated nil)

(define-domain-command set-blackboxed-ranges
  :method "Debugger.setBlackboxedRanges"
  :params (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Id of the script.")
        (:name :positions :type :array :ref nil :items (:type :ref :ref "ScriptPosition") :optional nil :doc ""))
  :returns nil
  :doc "Makes backend skip steps in the script in blackboxed ranges. VM will try leave blacklisted scripts by performing 'step in' several times, finally resorting to 'step out' if unsuccessful. Positions array contains positions where blackbox state is changed. First interval isn't blackboxed. Array should be sorted." :experimental t :deprecated nil)

(define-domain-command set-breakpoint
  :method "Debugger.setBreakpoint"
  :params (
        (:name :location :type :ref :ref "Location" :items nil :optional nil :doc "Location to set breakpoint in.")
        (:name :condition :type :string :ref nil :items nil :optional t :doc "Expression to use as a breakpoint condition. When specified, debugger will only stop on the breakpoint if this expression evaluates to true."))
  :returns (
        (:name :breakpoint-id :type :ref :ref "BreakpointId" :items nil :optional nil :doc "Id of the created breakpoint for further reference.")
        (:name :actual-location :type :ref :ref "Location" :items nil :optional nil :doc "Location this breakpoint resolved into."))
  :doc "Sets JavaScript breakpoint at a given location." :experimental nil :deprecated nil)

(define-domain-command set-instrumentation-breakpoint
  :method "Debugger.setInstrumentationBreakpoint"
  :params (
        (:name :instrumentation :type :string :ref nil :items nil :optional nil :doc "Instrumentation name."))
  :returns (
        (:name :breakpoint-id :type :ref :ref "BreakpointId" :items nil :optional nil :doc "Id of the created breakpoint for further reference."))
  :doc "Sets instrumentation breakpoint." :experimental nil :deprecated nil)

(define-domain-command set-breakpoint-by-url
  :method "Debugger.setBreakpointByUrl"
  :params (
        (:name :line-number :type :integer :ref nil :items nil :optional nil :doc "Line number to set breakpoint at.")
        (:name :url :type :string :ref nil :items nil :optional t :doc "URL of the resources to set breakpoint on.")
        (:name :url-regex :type :string :ref nil :items nil :optional t :doc "Regex pattern for the URLs of the resources to set breakpoints on. Either `url` or `urlRegex` must be specified.")
        (:name :script-hash :type :string :ref nil :items nil :optional t :doc "Script hash of the resources to set breakpoint on.")
        (:name :column-number :type :integer :ref nil :items nil :optional t :doc "Offset in the line to set breakpoint at.")
        (:name :condition :type :string :ref nil :items nil :optional t :doc "Expression to use as a breakpoint condition. When specified, debugger will only stop on the breakpoint if this expression evaluates to true."))
  :returns (
        (:name :breakpoint-id :type :ref :ref "BreakpointId" :items nil :optional nil :doc "Id of the created breakpoint for further reference.")
        (:name :locations :type :array :ref nil :items (:type :ref :ref "Location") :optional nil :doc "List of the locations this breakpoint resolved into upon addition."))
  :doc "Sets JavaScript breakpoint at given location specified either by URL or URL regex. Once this command is issued, all existing parsed scripts will have breakpoints resolved and returned in `locations` property. Further matching script parsing will result in subsequent `breakpointResolved` events issued. This logical breakpoint will survive page reloads." :experimental nil :deprecated nil)

(define-domain-command set-breakpoint-on-function-call
  :method "Debugger.setBreakpointOnFunctionCall"
  :params (
        (:name :object-id :type :ref :ref "Runtime.RemoteObjectId" :items nil :optional nil :doc "Function object id.")
        (:name :condition :type :string :ref nil :items nil :optional t :doc "Expression to use as a breakpoint condition. When specified, debugger will stop on the breakpoint if this expression evaluates to true."))
  :returns (
        (:name :breakpoint-id :type :ref :ref "BreakpointId" :items nil :optional nil :doc "Id of the created breakpoint for further reference."))
  :doc "Sets JavaScript breakpoint before each call to the given function. If another function was created from the same source as a given one, calling it will also trigger the breakpoint." :experimental t :deprecated nil)

(define-domain-command set-breakpoints-active
  :method "Debugger.setBreakpointsActive"
  :params (
        (:name :active :type :boolean :ref nil :items nil :optional nil :doc "New value for breakpoints active state."))
  :returns nil
  :doc "Activates / deactivates all breakpoints on the page." :experimental nil :deprecated nil)

(define-domain-command set-pause-on-exceptions
  :method "Debugger.setPauseOnExceptions"
  :params (
        (:name :state :type :string :ref nil :items nil :optional nil :doc "Pause on exceptions mode."))
  :returns nil
  :doc "Defines pause on exceptions state. Can be set to stop on all exceptions, uncaught exceptions, or caught exceptions, no exceptions. Initial pause on exceptions state is `none`." :experimental nil :deprecated nil)

(define-domain-command set-return-value
  :method "Debugger.setReturnValue"
  :params (
        (:name :new-value :type :ref :ref "Runtime.CallArgument" :items nil :optional nil :doc "New return value."))
  :returns nil
  :doc "Changes return value in top frame. Available only at return break position." :experimental t :deprecated nil)

(define-domain-command set-script-source
  :method "Debugger.setScriptSource"
  :params (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Id of the script to edit.")
        (:name :script-source :type :string :ref nil :items nil :optional nil :doc "New content of the script.")
        (:name :dry-run :type :boolean :ref nil :items nil :optional t :doc "If true the change will not actually be applied. Dry run may be used to get result description without actually modifying the code.")
        (:name :allow-top-frame-editing :type :boolean :ref nil :items nil :optional t :doc "If true, then `scriptSource` is allowed to change the function on top of the stack as long as the top-most stack frame is the only activation of that function."))
  :returns (
        (:name :call-frames :type :array :ref nil :items (:type :ref :ref "CallFrame") :optional t :doc "New stack trace in case editing has happened while VM was stopped.")
        (:name :stack-changed :type :boolean :ref nil :items nil :optional t :doc "Whether current call stack  was modified after applying the changes.")
        (:name :async-stack-trace :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "Async stack trace, if any.")
        (:name :async-stack-trace-id :type :ref :ref "Runtime.StackTraceId" :items nil :optional t :doc "Async stack trace, if any.")
        (:name :status :type :string :ref nil :items nil :optional nil :doc "Whether the operation was successful or not. Only `Ok` denotes a successful live edit while the other enum variants denote why the live edit failed.")
        (:name :exception-details :type :ref :ref "Runtime.ExceptionDetails" :items nil :optional t :doc "Exception details if any. Only present when `status` is `CompileError`."))
  :doc "Edits JavaScript source live.  In general, functions that are currently on the stack can not be edited with a single exception: If the edited function is the top-most stack frame and that is the only activation of that function on the stack. In this case the live edit will be successful and a `Debugger.restartFrame` for the top-most function is automatically triggered." :experimental nil :deprecated nil)

(define-domain-command set-skip-all-pauses
  :method "Debugger.setSkipAllPauses"
  :params (
        (:name :skip :type :boolean :ref nil :items nil :optional nil :doc "New value for skip pauses state."))
  :returns nil
  :doc "Makes page not interrupt on any pauses (breakpoint, exception, dom exception etc)." :experimental nil :deprecated nil)

(define-domain-command set-variable-value
  :method "Debugger.setVariableValue"
  :params (
        (:name :scope-number :type :integer :ref nil :items nil :optional nil :doc "0-based number of scope as was listed in scope chain. Only 'local', 'closure' and 'catch' scope types are allowed. Other scopes could be manipulated manually.")
        (:name :variable-name :type :string :ref nil :items nil :optional nil :doc "Variable name.")
        (:name :new-value :type :ref :ref "Runtime.CallArgument" :items nil :optional nil :doc "New variable value.")
        (:name :call-frame-id :type :ref :ref "CallFrameId" :items nil :optional nil :doc "Id of callframe that holds variable."))
  :returns nil
  :doc "Changes value of variable in a callframe. Object-based scopes are not supported and must be mutated manually." :experimental nil :deprecated nil)

(define-domain-command step-into
  :method "Debugger.stepInto"
  :params (
        (:name :break-on-async-call :type :boolean :ref nil :items nil :optional t :doc "Debugger will pause on the execution of the first async task which was scheduled before next pause.")
        (:name :skip-list :type :array :ref nil :items (:type :ref :ref "LocationRange") :optional t :doc "The skipList specifies location ranges that should be skipped on step into."))
  :returns nil
  :doc "Steps into the function call." :experimental nil :deprecated nil)

(define-domain-command step-out
  :method "Debugger.stepOut"
  :params nil
  :returns nil
  :doc "Steps out of the function call." :experimental nil :deprecated nil)

(define-domain-command step-over
  :method "Debugger.stepOver"
  :params (
        (:name :skip-list :type :array :ref nil :items (:type :ref :ref "LocationRange") :optional t :doc "The skipList specifies location ranges that should be skipped on step over."))
  :returns nil
  :doc "Steps over the statement." :experimental nil :deprecated nil)

(define-domain-event breakpoint-resolved
  :method "Debugger.breakpointResolved"
  :params (
        (:name :breakpoint-id :type :ref :ref "BreakpointId" :items nil :optional nil :doc "Breakpoint unique identifier.")
        (:name :location :type :ref :ref "Location" :items nil :optional nil :doc "Actual breakpoint location."))
  :doc "Fired when breakpoint is resolved to an actual script and location. Deprecated in favor of `resolvedBreakpoints` in the `scriptParsed` event." :experimental nil :deprecated t)

(define-domain-event paused
  :method "Debugger.paused"
  :params (
        (:name :call-frames :type :array :ref nil :items (:type :ref :ref "CallFrame") :optional nil :doc "Call stack the virtual machine stopped on.")
        (:name :reason :type :string :ref nil :items nil :optional nil :doc "Pause reason.")
        (:name :data :type :object :ref nil :items nil :optional t :doc "Object containing break-specific auxiliary properties.")
        (:name :hit-breakpoints :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Hit breakpoints IDs")
        (:name :async-stack-trace :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "Async stack trace, if any.")
        (:name :async-stack-trace-id :type :ref :ref "Runtime.StackTraceId" :items nil :optional t :doc "Async stack trace, if any.")
        (:name :async-call-stack-trace-id :type :ref :ref "Runtime.StackTraceId" :items nil :optional t :doc "Never present, will be removed."))
  :doc "Fired when the virtual machine stopped on breakpoint or exception or any other stop criteria." :experimental nil :deprecated nil)

(define-domain-event resumed
  :method "Debugger.resumed"
  :params nil
  :doc "Fired when the virtual machine resumed execution." :experimental nil :deprecated nil)

(define-domain-event script-failed-to-parse
  :method "Debugger.scriptFailedToParse"
  :params (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Identifier of the script parsed.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL or name of the script parsed (if any).")
        (:name :start-line :type :integer :ref nil :items nil :optional nil :doc "Line offset of the script within the resource with given URL (for script tags).")
        (:name :start-column :type :integer :ref nil :items nil :optional nil :doc "Column offset of the script within the resource with given URL.")
        (:name :end-line :type :integer :ref nil :items nil :optional nil :doc "Last line of the script.")
        (:name :end-column :type :integer :ref nil :items nil :optional nil :doc "Length of the last line of the script.")
        (:name :execution-context-id :type :ref :ref "Runtime.ExecutionContextId" :items nil :optional nil :doc "Specifies script creation context.")
        (:name :hash :type :string :ref nil :items nil :optional nil :doc "Content hash of the script, SHA-256.")
        (:name :build-id :type :string :ref nil :items nil :optional nil :doc "For Wasm modules, the content of the `build_id` custom section. For JavaScript the `debugId` magic comment.")
        (:name :execution-context-aux-data :type :object :ref nil :items nil :optional t :doc "Embedder-specific auxiliary data likely matching {isDefault: boolean, type: 'default'|'isolated'|'worker', frameId: string}")
        (:name :source-map-url :type :string :ref nil :items nil :optional t :doc "URL of source map associated with script (if any).")
        (:name :has-source-url :type :boolean :ref nil :items nil :optional t :doc "True, if this script has sourceURL.")
        (:name :is-module :type :boolean :ref nil :items nil :optional t :doc "True, if this script is ES6 module.")
        (:name :length :type :integer :ref nil :items nil :optional t :doc "This script length.")
        (:name :stack-trace :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "JavaScript top stack frame of where the script parsed event was triggered if available.")
        (:name :code-offset :type :integer :ref nil :items nil :optional t :doc "If the scriptLanguage is WebAssembly, the code section offset in the module.")
        (:name :script-language :type :ref :ref "Debugger.ScriptLanguage" :items nil :optional t :doc "The language of the script.")
        (:name :embedder-name :type :string :ref nil :items nil :optional t :doc "The name the embedder supplied for this script."))
  :doc "Fired when virtual machine fails to parse the script." :experimental nil :deprecated nil)

(define-domain-event script-parsed
  :method "Debugger.scriptParsed"
  :params (
        (:name :script-id :type :ref :ref "Runtime.ScriptId" :items nil :optional nil :doc "Identifier of the script parsed.")
        (:name :url :type :string :ref nil :items nil :optional nil :doc "URL or name of the script parsed (if any).")
        (:name :start-line :type :integer :ref nil :items nil :optional nil :doc "Line offset of the script within the resource with given URL (for script tags).")
        (:name :start-column :type :integer :ref nil :items nil :optional nil :doc "Column offset of the script within the resource with given URL.")
        (:name :end-line :type :integer :ref nil :items nil :optional nil :doc "Last line of the script.")
        (:name :end-column :type :integer :ref nil :items nil :optional nil :doc "Length of the last line of the script.")
        (:name :execution-context-id :type :ref :ref "Runtime.ExecutionContextId" :items nil :optional nil :doc "Specifies script creation context.")
        (:name :hash :type :string :ref nil :items nil :optional nil :doc "Content hash of the script, SHA-256.")
        (:name :build-id :type :string :ref nil :items nil :optional nil :doc "For Wasm modules, the content of the `build_id` custom section. For JavaScript the `debugId` magic comment.")
        (:name :execution-context-aux-data :type :object :ref nil :items nil :optional t :doc "Embedder-specific auxiliary data likely matching {isDefault: boolean, type: 'default'|'isolated'|'worker', frameId: string}")
        (:name :is-live-edit :type :boolean :ref nil :items nil :optional t :doc "True, if this script is generated as a result of the live edit operation.")
        (:name :source-map-url :type :string :ref nil :items nil :optional t :doc "URL of source map associated with script (if any).")
        (:name :has-source-url :type :boolean :ref nil :items nil :optional t :doc "True, if this script has sourceURL.")
        (:name :is-module :type :boolean :ref nil :items nil :optional t :doc "True, if this script is ES6 module.")
        (:name :length :type :integer :ref nil :items nil :optional t :doc "This script length.")
        (:name :stack-trace :type :ref :ref "Runtime.StackTrace" :items nil :optional t :doc "JavaScript top stack frame of where the script parsed event was triggered if available.")
        (:name :code-offset :type :integer :ref nil :items nil :optional t :doc "If the scriptLanguage is WebAssembly, the code section offset in the module.")
        (:name :script-language :type :ref :ref "Debugger.ScriptLanguage" :items nil :optional t :doc "The language of the script.")
        (:name :debug-symbols :type :array :ref nil :items (:type :ref :ref "Debugger.DebugSymbols") :optional t :doc "If the scriptLanguage is WebAssembly, the source of debug symbols for the module.")
        (:name :embedder-name :type :string :ref nil :items nil :optional t :doc "The name the embedder supplied for this script.")
        (:name :resolved-breakpoints :type :array :ref nil :items (:type :ref :ref "ResolvedBreakpoint") :optional t :doc "The list of set breakpoints in this script if calls to `setBreakpointByUrl` matches this script's URL or hash. Clients that use this list can ignore the `breakpointResolved` event. They are equivalent."))
  :doc "Fired when virtual machine parses script. This event is also fired for all known and uncollected scripts upon enabling debugger." :experimental nil :deprecated nil)

