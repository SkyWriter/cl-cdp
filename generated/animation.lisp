;;;; Animation CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/animation
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

(in-package #:cdp/animation)

(define-domain-type animation
  :cdp-id "Animation" :type :object
  :properties (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "`Animation`'s id.")
        (:name :name :type :string :ref nil :items nil :optional nil :doc "`Animation`'s name.")
        (:name :paused-state :type :boolean :ref nil :items nil :optional nil :doc "`Animation`'s internal paused state.")
        (:name :play-state :type :string :ref nil :items nil :optional nil :doc "`Animation`'s play state.")
        (:name :playback-rate :type :number :ref nil :items nil :optional nil :doc "`Animation`'s playback rate.")
        (:name :start-time :type :number :ref nil :items nil :optional nil :doc "`Animation`'s start time. Milliseconds for time based animations and percentage [0 - 100] for scroll driven animations (i.e. when viewOrScrollTimeline exists).")
        (:name :current-time :type :number :ref nil :items nil :optional nil :doc "`Animation`'s current time.")
        (:name :type :type :string :ref nil :items nil :optional nil :doc "Animation type of `Animation`.")
        (:name :source :type :ref :ref "AnimationEffect" :items nil :optional t :doc "`Animation`'s source animation node.")
        (:name :css-id :type :string :ref nil :items nil :optional t :doc "A unique ID for `Animation` representing the sources that triggered this CSS animation/transition.")
        (:name :view-or-scroll-timeline :type :ref :ref "ViewOrScrollTimeline" :items nil :optional t :doc "View or scroll timeline"))
  :enum nil
  :doc "Animation instance." :experimental nil :deprecated nil)

(define-domain-type view-or-scroll-timeline
  :cdp-id "ViewOrScrollTimeline" :type :object
  :properties (
        (:name :source-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "Scroll container node")
        (:name :start-offset :type :number :ref nil :items nil :optional t :doc "Represents the starting scroll position of the timeline as a length offset in pixels from scroll origin.")
        (:name :end-offset :type :number :ref nil :items nil :optional t :doc "Represents the ending scroll position of the timeline as a length offset in pixels from scroll origin.")
        (:name :subject-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "The element whose principal box's visibility in the scrollport defined the progress of the timeline. Does not exist for animations with ScrollTimeline")
        (:name :axis :type :ref :ref "DOM.ScrollOrientation" :items nil :optional nil :doc "Orientation of the scroll"))
  :enum nil
  :doc "Timeline instance" :experimental nil :deprecated nil)

(define-domain-type animation-effect
  :cdp-id "AnimationEffect" :type :object
  :properties (
        (:name :delay :type :number :ref nil :items nil :optional nil :doc "`AnimationEffect`'s delay.")
        (:name :end-delay :type :number :ref nil :items nil :optional nil :doc "`AnimationEffect`'s end delay.")
        (:name :iteration-start :type :number :ref nil :items nil :optional nil :doc "`AnimationEffect`'s iteration start.")
        (:name :iterations :type :number :ref nil :items nil :optional t :doc "`AnimationEffect`'s iterations. Omitted if the value is infinite.")
        (:name :duration :type :number :ref nil :items nil :optional nil :doc "`AnimationEffect`'s iteration duration. Milliseconds for time based animations and percentage [0 - 100] for scroll driven animations (i.e. when viewOrScrollTimeline exists).")
        (:name :direction :type :string :ref nil :items nil :optional nil :doc "`AnimationEffect`'s playback direction.")
        (:name :fill :type :string :ref nil :items nil :optional nil :doc "`AnimationEffect`'s fill mode.")
        (:name :backend-node-id :type :ref :ref "DOM.BackendNodeId" :items nil :optional t :doc "`AnimationEffect`'s target node.")
        (:name :keyframes-rule :type :ref :ref "KeyframesRule" :items nil :optional t :doc "`AnimationEffect`'s keyframes.")
        (:name :easing :type :string :ref nil :items nil :optional nil :doc "`AnimationEffect`'s timing function."))
  :enum nil
  :doc "AnimationEffect instance" :experimental nil :deprecated nil)

(define-domain-type keyframes-rule
  :cdp-id "KeyframesRule" :type :object
  :properties (
        (:name :name :type :string :ref nil :items nil :optional t :doc "CSS keyframed animation's name.")
        (:name :keyframes :type :array :ref nil :items (:type :ref :ref "KeyframeStyle") :optional nil :doc "List of animation keyframes."))
  :enum nil
  :doc "Keyframes Rule" :experimental nil :deprecated nil)

(define-domain-type keyframe-style
  :cdp-id "KeyframeStyle" :type :object
  :properties (
        (:name :offset :type :string :ref nil :items nil :optional nil :doc "Keyframe's time offset.")
        (:name :easing :type :string :ref nil :items nil :optional nil :doc "`AnimationEffect`'s timing function."))
  :enum nil
  :doc "Keyframe Style" :experimental nil :deprecated nil)

(define-domain-command disable
  :method "Animation.disable"
  :params nil
  :returns nil
  :doc "Disables animation domain notifications." :experimental nil :deprecated nil)

(define-domain-command enable
  :method "Animation.enable"
  :params nil
  :returns nil
  :doc "Enables animation domain notifications." :experimental nil :deprecated nil)

(define-domain-command get-current-time
  :method "Animation.getCurrentTime"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "Id of animation."))
  :returns (
        (:name :current-time :type :number :ref nil :items nil :optional nil :doc "Current time of the page."))
  :doc "Returns the current time of the an animation." :experimental nil :deprecated nil)

(define-domain-command get-playback-rate
  :method "Animation.getPlaybackRate"
  :params nil
  :returns (
        (:name :playback-rate :type :number :ref nil :items nil :optional nil :doc "Playback rate for animations on page."))
  :doc "Gets the playback rate of the document timeline." :experimental nil :deprecated nil)

(define-domain-command release-animations
  :method "Animation.releaseAnimations"
  :params (
        (:name :animations :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "List of animation ids to seek."))
  :returns nil
  :doc "Releases a set of animations to no longer be manipulated." :experimental nil :deprecated nil)

(define-domain-command resolve-animation
  :method "Animation.resolveAnimation"
  :params (
        (:name :animation-id :type :string :ref nil :items nil :optional nil :doc "Animation id."))
  :returns (
        (:name :remote-object :type :ref :ref "Runtime.RemoteObject" :items nil :optional nil :doc "Corresponding remote object."))
  :doc "Gets the remote object of the Animation." :experimental nil :deprecated nil)

(define-domain-command seek-animations
  :method "Animation.seekAnimations"
  :params (
        (:name :animations :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "List of animation ids to seek.")
        (:name :current-time :type :number :ref nil :items nil :optional nil :doc "Set the current time of each animation."))
  :returns nil
  :doc "Seek a set of animations to a particular time within each animation." :experimental nil :deprecated nil)

(define-domain-command set-paused
  :method "Animation.setPaused"
  :params (
        (:name :animations :type :array :ref nil :items (:type :string :ref nil) :optional nil :doc "Animations to set the pause state of.")
        (:name :paused :type :boolean :ref nil :items nil :optional nil :doc "Paused state to set to."))
  :returns nil
  :doc "Sets the paused state of a set of animations." :experimental nil :deprecated nil)

(define-domain-command set-playback-rate
  :method "Animation.setPlaybackRate"
  :params (
        (:name :playback-rate :type :number :ref nil :items nil :optional nil :doc "Playback rate for animations on page"))
  :returns nil
  :doc "Sets the playback rate of the document timeline." :experimental nil :deprecated nil)

(define-domain-command set-timing
  :method "Animation.setTiming"
  :params (
        (:name :animation-id :type :string :ref nil :items nil :optional nil :doc "Animation id.")
        (:name :duration :type :number :ref nil :items nil :optional nil :doc "Duration of the animation.")
        (:name :delay :type :number :ref nil :items nil :optional nil :doc "Delay of the animation."))
  :returns nil
  :doc "Sets the timing of an animation node." :experimental nil :deprecated nil)

(define-domain-event animation-canceled
  :method "Animation.animationCanceled"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "Id of the animation that was cancelled."))
  :doc "Event for when an animation has been cancelled." :experimental nil :deprecated nil)

(define-domain-event animation-created
  :method "Animation.animationCreated"
  :params (
        (:name :id :type :string :ref nil :items nil :optional nil :doc "Id of the animation that was created."))
  :doc "Event for each animation that has been created." :experimental nil :deprecated nil)

(define-domain-event animation-started
  :method "Animation.animationStarted"
  :params (
        (:name :animation :type :ref :ref "Animation" :items nil :optional nil :doc "Animation that was started."))
  :doc "Event for animation that has been started." :experimental nil :deprecated nil)

(define-domain-event animation-updated
  :method "Animation.animationUpdated"
  :params (
        (:name :animation :type :ref :ref "Animation" :items nil :optional nil :doc "Animation that was updated."))
  :doc "Event for animation that has been updated." :experimental nil :deprecated nil)

