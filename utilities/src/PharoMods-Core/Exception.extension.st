Extension { #name : 'Exception' }

{ #category : 'signaling' }
Exception >> _executeEnsuresBelow: kind [

	<PharoGsError>
    | ensBlks |
    ensBlks := self @env0:_getEnsuresBelow: kind.
    1 @env0:to: ensBlks size by: 2 do: [:j |
        self @env0:_removeEnsureAtFP: (ensBlks @env0:at: j).
        (ensBlks @env0:at: j @env0:+ 1) value.
    ].

]

{ #category : 'private' }
Exception >> _signalWith: inCextensionArg [

    <primitive: 2022>
	<PharoGs>
    | res |
    inCextensionArg @env0:ifNotNil: [
        "primitive found a C extension which wants to handle receiver."
        self _executeEnsuresBelow: 1.  "execute ensures from TOS to C extension"
        self @env0:_handleInCextension.  "trims stack and returns to C extension"
    ].
    res := self defaultAction.

    1 @env0:timesRepeat: [self @env0:class]. "loop to detect/handle termination interrupt"
    self isResumable ifTrue: [^res].
    self @env0:_signalGciError.
    self @env0:_uncontinuableError. "should never reach here"

]

{ #category : 'handling' }
Exception >> freezeUpTo:  aContext [

	<PharoGsError>
    self _gsError

]

{ #category : 'testing' }
Exception >> initialize [

    <PharoGs>
    ^self @env0:initialize

]

{ #category : 'testing' }
Exception >> isNested [
    "Determine whether the current exception handler is within the scope of another handler for the same exception."

	<PharoGs>
    ^self @env0:isNested

]

{ #category : 'handling' }
Exception >> outer [

	<PharoGs>
    self @env0:outer

]

{ #category : 'handling' }
Exception >> pass [
    "Yield control to the enclosing exception action for the receiver."

	<PharoGs>
    self @env0:pass

]

{ #category : 'private' }
Exception >> privHandlerContext [

	<PharoGsError>
    self _gsError

]

{ #category : 'private' }
Exception >> privHandlerContext: aContextTag [

	<PharoGsError>
    self _gsError

]

{ #category : 'accessing' }
Exception >> receiver [

	<PharoGs>
    ^'<Exception>>receiver>'

]

{ #category : 'handling' }
Exception >> resignalAs: replacementException [

	<PharoGs>
    self @env0:resignalAs: replacementException

]

{ #category : 'handling' }
Exception >> resumeUnchecked: resumptionValue [

	<PharoGs>
    self @env0:resume: resumptionValue

]

{ #category : '*Debugging-Core' }
Exception >> retry [
    "Abort an exception handler and re-evaluate its protected block."

	<PharoGs>
    self @env0:retry

]

{ #category : 'handling' }
Exception >> retryUsing: alternativeBlock [
    "Abort an exception handler and evaluate a new block in place of the handler's protected block '"

	<PharoGs>
    self @env0:retryUsing: alternativeBlock

]

{ #category : 'handling' }
Exception >> return: returnValue [
	"Return the argument as the value of the block protected by the active exception handler."

	<PharoGs>
    self @env0:return: returnValue

]

{ #category : 'handling' }
Exception >> searchFrom: aContext [

	<PharoGsError>
    self _gsError

]

{ #category : 'signaling' }
Exception >> signal [
    "Ask ContextHandlers in the sender chain to handle this signal.
    The default is to execute and return my defaultAction."

	<PharoGs>
    ^self _signalWith: nil

]

{ #category : 'accessing' }
Exception >> signaler [

	<PharoGs>
    ^'<Exception>>signaler>'

]

{ #category : 'accessing' }
Exception >> signaler: anObject [

	<PharoGsError>
    self _gsError

]

{ #category : 'accessing' }
Exception >> signalerContext [
    "Find the first sender of signal(:), the first context which is neither for an instance method
    nor for a class side method of Exception (or subclass).
	This will make sure that the same context is found for both, `Error signal` and
    `Error new signal`"

	<PharoGs>
    ^'<Exception>>signalerContext>'

]

{ #category : 'signaling' }
Exception >> signalIn: context [
    "Ask ContextHandlers in the sender chain starting at the given context to handle this signal.
	The default is to execute and return my defaultAction."

	<PharoGsError>
    self _gsError

]
