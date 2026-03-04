;;;; Input CDP domain
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/input
  (:use #:cl)
  (:import-from #:cdp #:*connection*)
  (:import-from #:cdp/impl
    #:define-domain-command
    #:define-domain-event
    #:define-domain-type))

(in-package #:cdp/input)

(define-domain-type touch-point
  :cdp-id "TouchPoint" :type :object
  :properties (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "X coordinate of the event relative to the main frame's viewport in CSS pixels.")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Y coordinate of the event relative to the main frame's viewport in CSS pixels. 0 refers to the top of the viewport and Y increases as it proceeds towards the bottom of the viewport.")
        (:name :radius-x :type :number :ref nil :items nil :optional t :doc "X radius of the touch area (default: 1.0).")
        (:name :radius-y :type :number :ref nil :items nil :optional t :doc "Y radius of the touch area (default: 1.0).")
        (:name :rotation-angle :type :number :ref nil :items nil :optional t :doc "Rotation angle (default: 0.0).")
        (:name :force :type :number :ref nil :items nil :optional t :doc "Force (default: 1.0).")
        (:name :tangential-pressure :type :number :ref nil :items nil :optional t :doc "The normalized tangential pressure, which has a range of [-1,1] (default: 0).")
        (:name :tilt-x :type :number :ref nil :items nil :optional t :doc "The plane angle between the Y-Z plane and the plane containing both the stylus axis and the Y axis, in degrees of the range [-90,90], a positive tiltX is to the right (default: 0)")
        (:name :tilt-y :type :number :ref nil :items nil :optional t :doc "The plane angle between the X-Z plane and the plane containing both the stylus axis and the X axis, in degrees of the range [-90,90], a positive tiltY is towards the user (default: 0).")
        (:name :twist :type :integer :ref nil :items nil :optional t :doc "The clockwise rotation of a pen stylus around its own major axis, in degrees in the range [0,359] (default: 0).")
        (:name :id :type :number :ref nil :items nil :optional t :doc "Identifier used to track touch sources between events, must be unique within an event."))
  :enum nil
  :doc "" :experimental nil :deprecated nil)

(define-domain-type gesture-source-type
  :cdp-id "GestureSourceType" :type :string
  :properties nil
  :enum '("default" "touch" "mouse")
  :doc "" :experimental t :deprecated nil)

(define-domain-type mouse-button
  :cdp-id "MouseButton" :type :string
  :properties nil
  :enum '("none" "left" "middle" "right" "back" "forward")
  :doc "" :experimental nil :deprecated nil)

(define-domain-type time-since-epoch
  :cdp-id "TimeSinceEpoch" :type :number
  :properties nil
  :enum nil
  :doc "UTC time in seconds, counted from January 1, 1970." :experimental nil :deprecated nil)

(define-domain-type drag-data-item
  :cdp-id "DragDataItem" :type :object
  :properties (
        (:name :mime-type :type :string :ref nil :items nil :optional nil :doc "Mime type of the dragged data.")
        (:name :data :type :string :ref nil :items nil :optional nil :doc "Depending of the value of `mimeType`, it contains the dragged link, text, HTML markup or any other data.")
        (:name :title :type :string :ref nil :items nil :optional t :doc "Title associated with a link. Only valid when `mimeType` == \"text/uri-list\".")
        (:name :base-url :type :string :ref nil :items nil :optional t :doc "Stores the base URL for the contained markup. Only valid when `mimeType` == \"text/html\"."))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-type drag-data
  :cdp-id "DragData" :type :object
  :properties (
        (:name :items :type :array :ref nil :items (:type :ref :ref "DragDataItem") :optional nil :doc "")
        (:name :files :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "List of filenames that should be included when dropping")
        (:name :drag-operations-mask :type :integer :ref nil :items nil :optional nil :doc "Bit field representing allowed drag operations. Copy = 1, Link = 2, Move = 16"))
  :enum nil
  :doc "" :experimental t :deprecated nil)

(define-domain-command dispatch-drag-event
  :method "Input.dispatchDragEvent"
  :params (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of the drag event.")
        (:name :x :type :number :ref nil :items nil :optional nil :doc "X coordinate of the event relative to the main frame's viewport in CSS pixels.")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Y coordinate of the event relative to the main frame's viewport in CSS pixels. 0 refers to the top of the viewport and Y increases as it proceeds towards the bottom of the viewport.")
        (:name :data :type :ref :ref "DragData" :items nil :optional nil :doc "")
        (:name :modifiers :type :integer :ref nil :items nil :optional t :doc "Bit field representing pressed modifier keys. Alt=1, Ctrl=2, Meta/Command=4, Shift=8 (default: 0)."))
  :returns nil
  :doc "Dispatches a drag event into the page." :experimental t :deprecated nil)

(define-domain-command dispatch-key-event
  :method "Input.dispatchKeyEvent"
  :params (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of the key event.")
        (:name :modifiers :type :integer :ref nil :items nil :optional t :doc "Bit field representing pressed modifier keys. Alt=1, Ctrl=2, Meta/Command=4, Shift=8 (default: 0).")
        (:name :timestamp :type :ref :ref "TimeSinceEpoch" :items nil :optional t :doc "Time at which the event occurred.")
        (:name :text :type :string :ref nil :items nil :optional t :doc "Text as generated by processing a virtual key code with a keyboard layout. Not needed for for `keyUp` and `rawKeyDown` events (default: \"\")")
        (:name :unmodified-text :type :string :ref nil :items nil :optional t :doc "Text that would have been generated by the keyboard if no modifiers were pressed (except for shift). Useful for shortcut (accelerator) key handling (default: \"\").")
        (:name :key-identifier :type :string :ref nil :items nil :optional t :doc "Unique key identifier (e.g., 'U+0041') (default: \"\").")
        (:name :code :type :string :ref nil :items nil :optional t :doc "Unique DOM defined string value for each physical key (e.g., 'KeyA') (default: \"\").")
        (:name :key :type :string :ref nil :items nil :optional t :doc "Unique DOM defined string value describing the meaning of the key in the context of active modifiers, keyboard layout, etc (e.g., 'AltGr') (default: \"\").")
        (:name :windows-virtual-key-code :type :integer :ref nil :items nil :optional t :doc "Windows virtual key code (default: 0).")
        (:name :native-virtual-key-code :type :integer :ref nil :items nil :optional t :doc "Native virtual key code (default: 0).")
        (:name :auto-repeat :type :boolean :ref nil :items nil :optional t :doc "Whether the event was generated from auto repeat (default: false).")
        (:name :is-keypad :type :boolean :ref nil :items nil :optional t :doc "Whether the event was generated from the keypad (default: false).")
        (:name :is-system-key :type :boolean :ref nil :items nil :optional t :doc "Whether the event was a system key event (default: false).")
        (:name :location :type :integer :ref nil :items nil :optional t :doc "Whether the event was from the left or right side of the keyboard. 1=Left, 2=Right (default: 0).")
        (:name :commands :type :array :ref nil :items (:type :string :ref nil) :optional t :doc "Editing commands to send with the key event (e.g., 'selectAll') (default: []). These are related to but not equal the command names used in `document.execCommand` and NSStandardKeyBindingResponding. See https://source.chromium.org/chromium/chromium/src/+/main:third_party/blink/renderer/core/editing/commands/editor_command_names.h for valid command names."))
  :returns nil
  :doc "Dispatches a key event to the page." :experimental nil :deprecated nil)

(define-domain-command insert-text
  :method "Input.insertText"
  :params (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "The text to insert."))
  :returns nil
  :doc "This method emulates inserting text that doesn't come from a key press, for example an emoji keyboard or an IME." :experimental t :deprecated nil)

(define-domain-command ime-set-composition
  :method "Input.imeSetComposition"
  :params (
        (:name :text :type :string :ref nil :items nil :optional nil :doc "The text to insert")
        (:name :selection-start :type :integer :ref nil :items nil :optional nil :doc "selection start")
        (:name :selection-end :type :integer :ref nil :items nil :optional nil :doc "selection end")
        (:name :replacement-start :type :integer :ref nil :items nil :optional t :doc "replacement start")
        (:name :replacement-end :type :integer :ref nil :items nil :optional t :doc "replacement end"))
  :returns nil
  :doc "This method sets the current candidate text for IME. Use imeCommitComposition to commit the final text. Use imeSetComposition with empty string as text to cancel composition." :experimental t :deprecated nil)

(define-domain-command dispatch-mouse-event
  :method "Input.dispatchMouseEvent"
  :params (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of the mouse event.")
        (:name :x :type :number :ref nil :items nil :optional nil :doc "X coordinate of the event relative to the main frame's viewport in CSS pixels.")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Y coordinate of the event relative to the main frame's viewport in CSS pixels. 0 refers to the top of the viewport and Y increases as it proceeds towards the bottom of the viewport.")
        (:name :modifiers :type :integer :ref nil :items nil :optional t :doc "Bit field representing pressed modifier keys. Alt=1, Ctrl=2, Meta/Command=4, Shift=8 (default: 0).")
        (:name :timestamp :type :ref :ref "TimeSinceEpoch" :items nil :optional t :doc "Time at which the event occurred.")
        (:name :button :type :ref :ref "MouseButton" :items nil :optional t :doc "Mouse button (default: \"none\").")
        (:name :buttons :type :integer :ref nil :items nil :optional t :doc "A number indicating which buttons are pressed on the mouse when a mouse event is triggered. Left=1, Right=2, Middle=4, Back=8, Forward=16, None=0.")
        (:name :click-count :type :integer :ref nil :items nil :optional t :doc "Number of times the mouse button was clicked (default: 0).")
        (:name :force :type :number :ref nil :items nil :optional t :doc "The normalized pressure, which has a range of [0,1] (default: 0).")
        (:name :tangential-pressure :type :number :ref nil :items nil :optional t :doc "The normalized tangential pressure, which has a range of [-1,1] (default: 0).")
        (:name :tilt-x :type :number :ref nil :items nil :optional t :doc "The plane angle between the Y-Z plane and the plane containing both the stylus axis and the Y axis, in degrees of the range [-90,90], a positive tiltX is to the right (default: 0).")
        (:name :tilt-y :type :number :ref nil :items nil :optional t :doc "The plane angle between the X-Z plane and the plane containing both the stylus axis and the X axis, in degrees of the range [-90,90], a positive tiltY is towards the user (default: 0).")
        (:name :twist :type :integer :ref nil :items nil :optional t :doc "The clockwise rotation of a pen stylus around its own major axis, in degrees in the range [0,359] (default: 0).")
        (:name :delta-x :type :number :ref nil :items nil :optional t :doc "X delta in CSS pixels for mouse wheel event (default: 0).")
        (:name :delta-y :type :number :ref nil :items nil :optional t :doc "Y delta in CSS pixels for mouse wheel event (default: 0).")
        (:name :pointer-type :type :string :ref nil :items nil :optional t :doc "Pointer type (default: \"mouse\")."))
  :returns nil
  :doc "Dispatches a mouse event to the page." :experimental nil :deprecated nil)

(define-domain-command dispatch-touch-event
  :method "Input.dispatchTouchEvent"
  :params (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of the touch event. TouchEnd and TouchCancel must not contain any touch points, while TouchStart and TouchMove must contains at least one.")
        (:name :touch-points :type :array :ref nil :items (:type :ref :ref "TouchPoint") :optional nil :doc "Active touch points on the touch device. One event per any changed point (compared to previous touch event in a sequence) is generated, emulating pressing/moving/releasing points one by one.")
        (:name :modifiers :type :integer :ref nil :items nil :optional t :doc "Bit field representing pressed modifier keys. Alt=1, Ctrl=2, Meta/Command=4, Shift=8 (default: 0).")
        (:name :timestamp :type :ref :ref "TimeSinceEpoch" :items nil :optional t :doc "Time at which the event occurred."))
  :returns nil
  :doc "Dispatches a touch event to the page." :experimental nil :deprecated nil)

(define-domain-command cancel-dragging
  :method "Input.cancelDragging"
  :params nil
  :returns nil
  :doc "Cancels any active dragging in the page." :experimental nil :deprecated nil)

(define-domain-command emulate-touch-from-mouse-event
  :method "Input.emulateTouchFromMouseEvent"
  :params (
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Type of the mouse event.")
        (:name :x :type :integer :ref nil :items nil :optional nil :doc "X coordinate of the mouse pointer in DIP.")
        (:name :y :type :integer :ref nil :items nil :optional nil :doc "Y coordinate of the mouse pointer in DIP.")
        (:name :button :type :ref :ref "MouseButton" :items nil :optional nil :doc "Mouse button. Only \"none\", \"left\", \"right\" are supported.")
        (:name :timestamp :type :ref :ref "TimeSinceEpoch" :items nil :optional t :doc "Time at which the event occurred (default: current time).")
        (:name :delta-x :type :number :ref nil :items nil :optional t :doc "X delta in DIP for mouse wheel event (default: 0).")
        (:name :delta-y :type :number :ref nil :items nil :optional t :doc "Y delta in DIP for mouse wheel event (default: 0).")
        (:name :modifiers :type :integer :ref nil :items nil :optional t :doc "Bit field representing pressed modifier keys. Alt=1, Ctrl=2, Meta/Command=4, Shift=8 (default: 0).")
        (:name :click-count :type :integer :ref nil :items nil :optional t :doc "Number of times the mouse button was clicked (default: 0)."))
  :returns nil
  :doc "Emulates touch event from the mouse event parameters." :experimental t :deprecated nil)

(define-domain-command set-ignore-input-events
  :method "Input.setIgnoreInputEvents"
  :params (
        (:name :ignore :type :boolean :ref nil :items nil :optional nil :doc "Ignores input events processing when set to true."))
  :returns nil
  :doc "Ignores input events (useful while auditing page)." :experimental nil :deprecated nil)

(define-domain-command set-intercept-drags
  :method "Input.setInterceptDrags"
  :params (
        (:name :enabled :type :boolean :ref nil :items nil :optional nil :doc ""))
  :returns nil
  :doc "Prevents default drag and drop behavior and instead emits `Input.dragIntercepted` events. Drag and drop behavior can be directly controlled via `Input.dispatchDragEvent`." :experimental t :deprecated nil)

(define-domain-command synthesize-pinch-gesture
  :method "Input.synthesizePinchGesture"
  :params (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "X coordinate of the start of the gesture in CSS pixels.")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Y coordinate of the start of the gesture in CSS pixels.")
        (:name :scale-factor :type :number :ref nil :items nil :optional nil :doc "Relative scale factor after zooming (>1.0 zooms in, <1.0 zooms out).")
        (:name :relative-speed :type :integer :ref nil :items nil :optional t :doc "Relative pointer speed in pixels per second (default: 800).")
        (:name :gesture-source-type :type :ref :ref "GestureSourceType" :items nil :optional t :doc "Which type of input events to be generated (default: 'default', which queries the platform for the preferred input type)."))
  :returns nil
  :doc "Synthesizes a pinch gesture over a time period by issuing appropriate touch events." :experimental t :deprecated nil)

(define-domain-command synthesize-scroll-gesture
  :method "Input.synthesizeScrollGesture"
  :params (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "X coordinate of the start of the gesture in CSS pixels.")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Y coordinate of the start of the gesture in CSS pixels.")
        (:name :x-distance :type :number :ref nil :items nil :optional t :doc "The distance to scroll along the X axis (positive to scroll left).")
        (:name :y-distance :type :number :ref nil :items nil :optional t :doc "The distance to scroll along the Y axis (positive to scroll up).")
        (:name :x-overscroll :type :number :ref nil :items nil :optional t :doc "The number of additional pixels to scroll back along the X axis, in addition to the given distance.")
        (:name :y-overscroll :type :number :ref nil :items nil :optional t :doc "The number of additional pixels to scroll back along the Y axis, in addition to the given distance.")
        (:name :prevent-fling :type :boolean :ref nil :items nil :optional t :doc "Prevent fling (default: true).")
        (:name :speed :type :integer :ref nil :items nil :optional t :doc "Swipe speed in pixels per second (default: 800).")
        (:name :gesture-source-type :type :ref :ref "GestureSourceType" :items nil :optional t :doc "Which type of input events to be generated (default: 'default', which queries the platform for the preferred input type).")
        (:name :repeat-count :type :integer :ref nil :items nil :optional t :doc "The number of times to repeat the gesture (default: 0).")
        (:name :repeat-delay-ms :type :integer :ref nil :items nil :optional t :doc "The number of milliseconds delay between each repeat. (default: 250).")
        (:name :interaction-marker-name :type :string :ref nil :items nil :optional t :doc "The name of the interaction markers to generate, if not empty (default: \"\")."))
  :returns nil
  :doc "Synthesizes a scroll gesture over a time period by issuing appropriate touch events." :experimental t :deprecated nil)

(define-domain-command synthesize-tap-gesture
  :method "Input.synthesizeTapGesture"
  :params (
        (:name :x :type :number :ref nil :items nil :optional nil :doc "X coordinate of the start of the gesture in CSS pixels.")
        (:name :y :type :number :ref nil :items nil :optional nil :doc "Y coordinate of the start of the gesture in CSS pixels.")
        (:name :duration :type :integer :ref nil :items nil :optional t :doc "Duration between touchdown and touchup events in ms (default: 50).")
        (:name :tap-count :type :integer :ref nil :items nil :optional t :doc "Number of times to perform the tap (e.g. 2 for double tap, default: 1).")
        (:name :gesture-source-type :type :ref :ref "GestureSourceType" :items nil :optional t :doc "Which type of input events to be generated (default: 'default', which queries the platform for the preferred input type)."))
  :returns nil
  :doc "Synthesizes a tap gesture over a time period by issuing appropriate touch events." :experimental t :deprecated nil)

(define-domain-event drag-intercepted
  :method "Input.dragIntercepted"
  :params (
        (:name :data :type :ref :ref "DragData" :items nil :optional nil :doc ""))
  :doc "Emitted only when `Input.setInterceptDrags` is enabled. Use this data with `Input.dispatchDragEvent` to restore normal drag and drop behavior." :experimental t :deprecated nil)

