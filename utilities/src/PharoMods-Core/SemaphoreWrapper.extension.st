Extension { #name : 'SemaphoreWrapper' }

{ #category : 'private' }
SemaphoreWrapper >> _semaphore [

	^semaphore ifNil: [semaphore := Semaphore basicNew initSignals].

]

{ #category : 'comparing' }
SemaphoreWrapper >> = anObject [

    "This and #'hash' are not delegated to the real Semaphore since
     we need hash and equality to be stable between sessions."
	^ self == anObject

]

{ #category : 'initialization' }
SemaphoreWrapper >> consumeAllSignals [

	^self _semaphore consumeAllSignals

]

{ #category : 'mutual exclusion' }
SemaphoreWrapper >> critical: mutuallyExcludedBlock [

	^self _semaphore critical: mutuallyExcludedBlock

]

{ #category : 'mutual exclusion' }
SemaphoreWrapper >> critical: mutuallyExcludedBlock ifCurtailed: terminationBlock [

	^self _semaphore critical: mutuallyExcludedBlock ifCurtailed: terminationBlock

]

{ #category : 'mutual exclusion' }
SemaphoreWrapper >> critical: mutuallyExcludedBlock ifError: errorBlock [

	^self _semaphore critical: mutuallyExcludedBlock ifError: errorBlock

]

{ #category : 'mutual exclusion' }
SemaphoreWrapper >> critical: mutuallyExcludedBlock ifLocked: alternativeBlock [

	^self _semaphore critical: mutuallyExcludedBlock ifLocked: alternativeBlock

]

{ #category : 'process termination handling' }
SemaphoreWrapper >> handleProcessTerminationOfWaitingContext: suspendedContext [

	^self _semaphore handleProcessTerminationOfWaitingContext: suspendedContext

]

{ #category : 'comparing' }
SemaphoreWrapper >> hash [

    "This and #'=' are not delegated to the real Semaphore since
     we need hash and equality to be stable between sessions."
	^ self identityHash

]

{ #category : 'initialization' }
SemaphoreWrapper >> initSignals [

	^self _semaphore initSignals

]

{ #category : 'testing' }
SemaphoreWrapper >> isSignaled [

	^self _semaphore isSignaled

]

{ #category : 'initialization' }
SemaphoreWrapper >> resumeProcess: aProcess [

	^self _semaphore resumeProcess: aProcess

]

{ #category : 'communication' }
SemaphoreWrapper >> signal [

	^self _semaphore signal

]

{ #category : 'initialize-release' }
SemaphoreWrapper >> terminateProcess [

	^self _semaphore terminateProcess

]

{ #category : 'communication' }
SemaphoreWrapper >> wait [

	^self _semaphore wait

]

{ #category : 'communication' }
SemaphoreWrapper >> wait: aDuration [

	^self _semaphore wait: aDuration

]

{ #category : 'communication' }
SemaphoreWrapper >> wait: aDuration onCompletion: completionBlock onTimeout: timeoutBlock [

	^self _semaphore wait: aDuration onCompletion: completionBlock onTimeout: timeoutBlock

]

{ #category : 'communication' }
SemaphoreWrapper >> waitTimeoutMSecs: anInteger [

	^self _semaphore waitTimeoutMSecs: anInteger

]

{ #category : 'communication' }
SemaphoreWrapper >> waitTimeoutSeconds: anInteger [

	^self _semaphore waitTimeoutSeconds: anInteger

]

{ #category : 'communication' }
SemaphoreWrapper >> waitTimeoutSeconds: anInteger onCompletion: completionBlock onTimeout: timeoutBlock [

	^self _semaphore waitTimeoutSeconds: anInteger onCompletion: completionBlock onTimeout: timeoutBlock

]
