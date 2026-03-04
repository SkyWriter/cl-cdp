;;;; WebAudio CDP domain [EXPERIMENTAL]
;;;; Auto-generated — DO NOT EDIT. Re-run codegen/generate.lisp.
;;;; Spec version: 1

(defpackage #:cdp/web-audio
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

(in-package #:cdp/web-audio)

(define-domain-type graph-object-id
  :cdp-id "GraphObjectId" :type :string
  :properties nil
  :enum nil
  :doc "An unique ID for a graph object (AudioContext, AudioNode, AudioParam) in Web Audio API" :experimental nil :deprecated nil)

(define-domain-type context-type
  :cdp-id "ContextType" :type :string
  :properties nil
  :enum '("realtime" "offline")
  :doc "Enum of BaseAudioContext types" :experimental nil :deprecated nil)

(define-domain-type context-state
  :cdp-id "ContextState" :type :string
  :properties nil
  :enum '("suspended" "running" "closed" "interrupted")
  :doc "Enum of AudioContextState from the spec" :experimental nil :deprecated nil)

(define-domain-type node-type
  :cdp-id "NodeType" :type :string
  :properties nil
  :enum nil
  :doc "Enum of AudioNode types" :experimental nil :deprecated nil)

(define-domain-type channel-count-mode
  :cdp-id "ChannelCountMode" :type :string
  :properties nil
  :enum '("clamped-max" "explicit" "max")
  :doc "Enum of AudioNode::ChannelCountMode from the spec" :experimental nil :deprecated nil)

(define-domain-type channel-interpretation
  :cdp-id "ChannelInterpretation" :type :string
  :properties nil
  :enum '("discrete" "speakers")
  :doc "Enum of AudioNode::ChannelInterpretation from the spec" :experimental nil :deprecated nil)

(define-domain-type param-type
  :cdp-id "ParamType" :type :string
  :properties nil
  :enum nil
  :doc "Enum of AudioParam types" :experimental nil :deprecated nil)

(define-domain-type automation-rate
  :cdp-id "AutomationRate" :type :string
  :properties nil
  :enum '("a-rate" "k-rate")
  :doc "Enum of AudioParam::AutomationRate from the spec" :experimental nil :deprecated nil)

(define-domain-type context-realtime-data
  :cdp-id "ContextRealtimeData" :type :object
  :properties (
        (:name :current-time :type :number :ref nil :items nil :optional nil :doc "The current context time in second in BaseAudioContext.")
        (:name :render-capacity :type :number :ref nil :items nil :optional nil :doc "The time spent on rendering graph divided by render quantum duration, and multiplied by 100. 100 means the audio renderer reached the full capacity and glitch may occur.")
        (:name :callback-interval-mean :type :number :ref nil :items nil :optional nil :doc "A running mean of callback interval.")
        (:name :callback-interval-variance :type :number :ref nil :items nil :optional nil :doc "A running variance of callback interval."))
  :enum nil
  :doc "Fields in AudioContext that change in real-time." :experimental nil :deprecated nil)

(define-domain-type base-audio-context
  :cdp-id "BaseAudioContext" :type :object
  :properties (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :context-type :type :ref :ref "ContextType" :items nil :optional nil :doc "")
        (:name :context-state :type :ref :ref "ContextState" :items nil :optional nil :doc "")
        (:name :realtime-data :type :ref :ref "ContextRealtimeData" :items nil :optional t :doc "")
        (:name :callback-buffer-size :type :number :ref nil :items nil :optional nil :doc "Platform-dependent callback buffer size.")
        (:name :max-output-channel-count :type :number :ref nil :items nil :optional nil :doc "Number of output channels supported by audio hardware in use.")
        (:name :sample-rate :type :number :ref nil :items nil :optional nil :doc "Context sample rate."))
  :enum nil
  :doc "Protocol object for BaseAudioContext" :experimental nil :deprecated nil)

(define-domain-type audio-listener
  :cdp-id "AudioListener" :type :object
  :properties (
        (:name :listener-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Protocol object for AudioListener" :experimental nil :deprecated nil)

(define-domain-type audio-node
  :cdp-id "AudioNode" :type :object
  :properties (
        (:name :node-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :node-type :type :ref :ref "NodeType" :items nil :optional nil :doc "")
        (:name :number-of-inputs :type :number :ref nil :items nil :optional nil :doc "")
        (:name :number-of-outputs :type :number :ref nil :items nil :optional nil :doc "")
        (:name :channel-count :type :number :ref nil :items nil :optional nil :doc "")
        (:name :channel-count-mode :type :ref :ref "ChannelCountMode" :items nil :optional nil :doc "")
        (:name :channel-interpretation :type :ref :ref "ChannelInterpretation" :items nil :optional nil :doc ""))
  :enum nil
  :doc "Protocol object for AudioNode" :experimental nil :deprecated nil)

(define-domain-type audio-param
  :cdp-id "AudioParam" :type :object
  :properties (
        (:name :param-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :node-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :param-type :type :ref :ref "ParamType" :items nil :optional nil :doc "")
        (:name :rate :type :ref :ref "AutomationRate" :items nil :optional nil :doc "")
        (:name :default-value :type :number :ref nil :items nil :optional nil :doc "")
        (:name :min-value :type :number :ref nil :items nil :optional nil :doc "")
        (:name :max-value :type :number :ref nil :items nil :optional nil :doc ""))
  :enum nil
  :doc "Protocol object for AudioParam" :experimental nil :deprecated nil)

(define-domain-command enable
  :method "WebAudio.enable"
  :params nil
  :returns nil
  :doc "Enables the WebAudio domain and starts sending context lifetime events." :experimental nil :deprecated nil)

(define-domain-command disable
  :method "WebAudio.disable"
  :params nil
  :returns nil
  :doc "Disables the WebAudio domain." :experimental nil :deprecated nil)

(define-domain-command get-realtime-data
  :method "WebAudio.getRealtimeData"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc ""))
  :returns (
        (:name :realtime-data :type :ref :ref "ContextRealtimeData" :items nil :optional nil :doc ""))
  :doc "Fetch the realtime data from the registered contexts." :experimental nil :deprecated nil)

(define-domain-event context-created
  :method "WebAudio.contextCreated"
  :params (
        (:name :context :type :ref :ref "BaseAudioContext" :items nil :optional nil :doc ""))
  :doc "Notifies that a new BaseAudioContext has been created." :experimental nil :deprecated nil)

(define-domain-event context-will-be-destroyed
  :method "WebAudio.contextWillBeDestroyed"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc ""))
  :doc "Notifies that an existing BaseAudioContext will be destroyed." :experimental nil :deprecated nil)

(define-domain-event context-changed
  :method "WebAudio.contextChanged"
  :params (
        (:name :context :type :ref :ref "BaseAudioContext" :items nil :optional nil :doc ""))
  :doc "Notifies that existing BaseAudioContext has changed some properties (id stays the same).." :experimental nil :deprecated nil)

(define-domain-event audio-listener-created
  :method "WebAudio.audioListenerCreated"
  :params (
        (:name :listener :type :ref :ref "AudioListener" :items nil :optional nil :doc ""))
  :doc "Notifies that the construction of an AudioListener has finished." :experimental nil :deprecated nil)

(define-domain-event audio-listener-will-be-destroyed
  :method "WebAudio.audioListenerWillBeDestroyed"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :listener-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc ""))
  :doc "Notifies that a new AudioListener has been created." :experimental nil :deprecated nil)

(define-domain-event audio-node-created
  :method "WebAudio.audioNodeCreated"
  :params (
        (:name :node :type :ref :ref "AudioNode" :items nil :optional nil :doc ""))
  :doc "Notifies that a new AudioNode has been created." :experimental nil :deprecated nil)

(define-domain-event audio-node-will-be-destroyed
  :method "WebAudio.audioNodeWillBeDestroyed"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :node-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc ""))
  :doc "Notifies that an existing AudioNode has been destroyed." :experimental nil :deprecated nil)

(define-domain-event audio-param-created
  :method "WebAudio.audioParamCreated"
  :params (
        (:name :param :type :ref :ref "AudioParam" :items nil :optional nil :doc ""))
  :doc "Notifies that a new AudioParam has been created." :experimental nil :deprecated nil)

(define-domain-event audio-param-will-be-destroyed
  :method "WebAudio.audioParamWillBeDestroyed"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :node-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :param-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc ""))
  :doc "Notifies that an existing AudioParam has been destroyed." :experimental nil :deprecated nil)

(define-domain-event nodes-connected
  :method "WebAudio.nodesConnected"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :source-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :destination-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :source-output-index :type :number :ref nil :items nil :optional t :doc "")
        (:name :destination-input-index :type :number :ref nil :items nil :optional t :doc ""))
  :doc "Notifies that two AudioNodes are connected." :experimental nil :deprecated nil)

(define-domain-event nodes-disconnected
  :method "WebAudio.nodesDisconnected"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :source-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :destination-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :source-output-index :type :number :ref nil :items nil :optional t :doc "")
        (:name :destination-input-index :type :number :ref nil :items nil :optional t :doc ""))
  :doc "Notifies that AudioNodes are disconnected. The destination can be null, and it means all the outgoing connections from the source are disconnected." :experimental nil :deprecated nil)

(define-domain-event node-param-connected
  :method "WebAudio.nodeParamConnected"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :source-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :destination-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :source-output-index :type :number :ref nil :items nil :optional t :doc ""))
  :doc "Notifies that an AudioNode is connected to an AudioParam." :experimental nil :deprecated nil)

(define-domain-event node-param-disconnected
  :method "WebAudio.nodeParamDisconnected"
  :params (
        (:name :context-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :source-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :destination-id :type :ref :ref "GraphObjectId" :items nil :optional nil :doc "")
        (:name :source-output-index :type :number :ref nil :items nil :optional t :doc ""))
  :doc "Notifies that an AudioNode is disconnected to an AudioParam." :experimental nil :deprecated nil)

