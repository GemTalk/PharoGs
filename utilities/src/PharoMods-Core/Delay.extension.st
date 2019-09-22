Extension { #name : 'Delay' }

{ #category : 'testing' }
Delay class >> anyActive [
	<PharoGsError>
	self _gsError "
	""Return true if there is any delay currently active""
		^self scheduler anyActive
"

]

{ #category : 'settings' }
Delay class >> delaySchedulerClass [
	<PharoGsError>
	self _gsError "
	^self scheduler class"

]

{ #category : 'settings' }
Delay class >> delaySchedulerClass: aSchedulerClass [
	<PharoGsError>
	self _gsError "
	| newScheduler oldScheduler |
	self delaySchedulerClass = aSchedulerClass ifTrue:[ ^self ].
	newScheduler := aSchedulerClass new.
	(newScheduler respondsTo: #startTimerEventLoop)
		ifFalse: [ self error: 'New delay scheduler must respond to #startTimerEventLoop' ].
	newScheduler startTimerEventLoop.
	""To avoid lockup if a higher priority process preempts this method to schedule a delay,
	the newScheduler needs to be in place before oldScheduler is stopped""
	oldScheduler := self scheduler.
	self scheduler: newScheduler.
	oldScheduler stopTimerEventLoop.
	self inform: 'Delay scheduler set to ' , aSchedulerClass printString.
	"

]

{ #category : 'instance creation' }
Delay class >> forDuration: aDuration [
 	"Return a new Delay for the given duration."

	<PharoGs>
	^ self forMilliseconds: aDuration asMilliSeconds

]

{ #category : 'instance creation' }
Delay class >> forMilliseconds: aNumber [
	<PharoGs>
	^self @env0:forMilliseconds: aNumber

]

{ #category : 'instance creation' }
Delay class >> forSeconds: aNumber [
	<PharoGs>
	^self @env0:forSeconds: aNumber

]

{ #category : 'initialize-release' }
Delay class >> initialize [
	<PharoGsError>
	self _gsError "
	""Delay initialize""
	self scheduler ifNotNil: [ self scheduler stopTimerEventLoop ].
	self scheduler: DelaySemaphoreScheduler new.
	self scheduler startTimerEventLoop.
	SessionManager default
		registerSystemClassNamed: self name
		atPriority: 20.
"

]

{ #category : 'testing' }
Delay class >> nextWakeUpTime [
	<PharoGsError>
	self _gsError "
	^ self scheduler nextWakeUpTime.
"

]

{ #category : 'timer process' }
Delay class >> restartTimerEventLoop [
	<PharoGsError>
	self _gsError "
	self stopTimerEventLoop.
	self startTimerEventLoop."

]

{ #category : 'scheduler' }
Delay class >> scheduler [
	<PharoGsError>
	self _gsError "
	^ Scheduler.
"

]

{ #category : 'scheduler' }
Delay class >> scheduler: anObject [
	<PharoGsError>
	self _gsError "
	Scheduler := anObject.
"

]

{ #category : 'timer process' }
Delay class >> schedulingProcess [
	<PharoGsError>
	self _gsError "
	^ self scheduler schedulingProcess.
"

]

{ #category : 'snapshotting' }
Delay class >> shutDown [
	<PharoGsError>
	self _gsError "
	self scheduler shutDown.
"

]

{ #category : 'timer process' }
Delay class >> startTimerEventLoop [
	<PharoGsError>
	self _gsError "
	self scheduler startTimerEventLoop.
"

]

{ #category : 'snapshotting' }
Delay class >> startUp [
	<PharoGsError>
	self _gsError "
	""Restart active delay, if any, when resuming a snapshot.""
	self scheduler startUp.
"

]

{ #category : 'timer process' }
Delay class >> stopTimerEventLoop [
	<PharoGsError>
	self _gsError "
	^ self scheduler stopTimerEventLoop.
"

]

{ #category : 'settings' }
Delay class >> systemSettingOn: aBuilder [
	<PharoGsError>
	self _gsError "
	<systemsettings>

	(aBuilder pickOne: #delaySchedulerClass)
		parent: #pharoSystem ;
		target: self;
		label: 'Delay Scheduler' ;
		domainValues: DelayNullScheduler allSubclasses ;
		description: 'Choose the class to use for Delay scheduling.' ,
			String crlf, 'You can observe which is running from Tools > Process Browser.'
	"

]

{ #category : 'instance creation' }
Delay class >> timeoutSemaphore: aSemaphore afterMSecs: anInteger [
	<PharoGsError>
	self _gsError "
	""Create and schedule a Delay to signal the given semaphore when the given number of milliseconds has elapsed. Return the scheduled Delay. The timeout can be cancelled by sending 'unschedule' to this Delay.""
	""Details: This mechanism is used to provide a timeout when waiting for an external event, such as arrival of data over a network connection, to signal a semaphore. The timeout ensures that the semaphore will be signalled within a reasonable period of time even if the event fails to occur. Typically, the waiting process cancels the timeout request when awoken, then determines if the awaited event has actually occurred.""
	^ (self new setDelay: anInteger forSemaphore: aSemaphore) schedule; yourself
"

]

{ #category : 'public' }
Delay >> beingWaitedOn [
	<PharoGsError>
	self _gsError "
	""Answer whether this delay is currently scheduled, e.g., being waited on""
	^beingWaitedOn"

]

{ #category : 'public' }
Delay >> delaySemaphore [
	"GemStone does not have a separate semaphore; you can send signal to the Delay instance"

	<PharoGs>
	^self

]

{ #category : 'delaying' }
Delay >> isExpired [
	<PharoGsError>
	self _gsError "
	^delaySemaphore isSignaled.
"

]

{ #category : 'public' }
Delay >> millisecondDelayDuration [
	<PharoGsError>
	self _gsError "
	^millisecondDelayDuration"

]

{ #category : 'public' }
Delay >> millisecondsToGo [
	<PharoGsError>
	self _gsError "
	^ ticker millisecondsUntilTick: resumptionTick"

]

{ #category : 'printing' }
Delay >> printOn: aStream [
	<PharoGs>
	self @env0:printOn: aStream

]

{ #category : 'public' }
Delay >> resumptionTick [
	<PharoGsError>
	self _gsError "
	""The tick semantics (e.g. millisecond/microsecond) depends on the ticker its derived from.""

	^resumptionTick
"

]

{ #category : 'public' }
Delay >> resumptionTickAdjustFrom: oldBaseTick to: newBaseTick [
	<PharoGsError>
	self _gsError "
	resumptionTick := resumptionTick - oldBaseTick + newBaseTick.
"

]

{ #category : 'private' }
Delay >> schedule [
	<PharoGsError>
	self _gsError "
	""Schedule this delay.""

	self class scheduler schedule: self.
"

]

{ #category : 'private' }
Delay >> setDelay: milliseconds [
	<PharoGsError>
	self _gsError "
	""Private! Initialize this delay to signal the given semaphore after the given number of milliseconds.""
	millisecondDelayDuration := milliseconds asInteger"

]

{ #category : 'private' }
Delay >> setDelay: milliseconds forSemaphore: aSemaphore [
	<PharoGsError>
	self _gsError "
	""Private! Initialize this delay to signal the given semaphore after the given number of milliseconds.""
	millisecondDelayDuration := milliseconds asInteger.
	millisecondDelayDuration < 0 ifTrue: [self error: 'delay times cannot be negative'].
	delaySemaphore := aSemaphore.
	beingWaitedOn := false."

]

{ #category : 'GemStone' }
Delay >> signal [
	"GemStone does not have a separate semaphore; you can send signal to the Delay instance"

	<PharoGs>
	self @env0:signal

]

{ #category : 'private - timing priority process' }
Delay >> timingPriorityScheduleTicker: aDelayTicker [
	<PharoGsError>
	self _gsError "
	beingWaitedOn ifTrue: [ ^false ]. ""Already scheduled""
	beingWaitedOn := true.
	ticker := aDelayTicker. ""To help Delay >> printOn: interpret resumptionTick""
	resumptionTick := ticker tickAfterMilliseconds: millisecondDelayDuration.
	^true"

]

{ #category : 'private - timing priority process' }
Delay >> timingPrioritySignalExpired [
	<PharoGsError>
	self _gsError "
	""The delay time has elapsed; signal the waiting process.""
	beingWaitedOn := false.
	delaySemaphore signal.
	""Important! Must only be called from the single timing priority process e.g...
		DelayScheduler>>handleEventTimer."""

]

{ #category : 'private - timing priority process' }
Delay >> timingPriorityUnschedule [
	<PharoGsError>
	self _gsError "
	""""
	beingWaitedOn := false.
	""Important! Must only be called from the single timing priority process e.g...
		DelayScheduler>>handleEventTimer."""

]

{ #category : 'private' }
Delay >> unschedule [
	<PharoGsError>
	self _gsError "
	self class scheduler unschedule: self.
"

]

{ #category : 'delaying' }
Delay >> wait [
	<PharoGs>
	self @env0:wait

]
