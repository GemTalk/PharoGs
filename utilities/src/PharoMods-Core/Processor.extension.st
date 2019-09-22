Extension { #name : 'Processor' }

{ #category : 'accessing' }
Processor class >> activePriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:activePriority

]

{ #category : 'accessing' }
Processor class >> activeProcess [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:activeProcess

]

{ #category : 'private' }
Processor class >> anyProcessesAbove: highestPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:anyProcessesAbove: highestPriority

]

{ #category : 'accessing' }
Processor class >> backgroundProcess [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:backgroundProcess

]

{ #category : 'CPU usage tally' }
Processor class >> fonextReadyProcesso [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:nextReadyProcess

]

{ #category : 'XX' }
Processor class >> foo [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:foo

]

{ #category : 'accessing' }
Processor class >> highestPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:highestPriority

]

{ #category : 'accessing' }
Processor class >> highestPriority: newHighestPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:highestPriority: newHighestPriority

]

{ #category : 'priority names' }
Processor class >> highIOPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:highIOPriority

]

{ #category : 'self evaluating' }
Processor class >> isSelfEvaluating [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:isSelfEvaluating

]

{ #category : 'priority names' }
Processor class >> lowestPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:lowestPriority

]

{ #category : 'priority names' }
Processor class >> lowIOPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:lowIOPriority

]

{ #category : 'accessing' }
Processor class >> preemptedProcess [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:preemptedProcess

]

{ #category : 'printing' }
Processor class >> printOn: aStream [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:printOn: aStream

]

{ #category : 'removing' }
Processor class >> remove: aProcess ifAbsent: aBlock [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:remove: aProcess ifAbsent: aBlock

]

{ #category : '*Reflectivity' }
Processor class >> rfactiveProcess [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:rfactiveProcess

]

{ #category : 'accessing' }
Processor class >> scanSchedule: aBlock startingAt: topPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:scanSchedule: aBlock startingAt: topPriority

]

{ #category : 'process state change' }
Processor class >> suspendFirstAt: aPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:suspendFirstAt: aPriority

]

{ #category : 'process state change' }
Processor class >> suspendFirstAt: aPriority ifNone: noneBlock [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:suspendFirstAt: aPriority ifNone: noneBlock

]

{ #category : 'priority names' }
Processor class >> systemBackgroundPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:systemBackgroundPriority

]

{ #category : 'CPU usage tally' }
Processor class >> tallyCPUUsageFor: seconds [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:tallyCPUUsageFor: seconds

]

{ #category : 'CPU usage tally' }
Processor class >> tallyCPUUsageFor: seconds every: msec [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:tallyCPUUsageFor: seconds every: msec

]

{ #category : 'process state change' }
Processor class >> terminateActive [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:terminateActive

]

{ #category : 'priority names' }
Processor class >> timingPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:timingPriority

]

{ #category : 'priority names' }
Processor class >> userBackgroundPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:userBackgroundPriority

]

{ #category : 'priority names' }
Processor class >> userInterruptPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:userInterruptPriority

]

{ #category : 'priority names' }
Processor class >> userSchedulingPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:userSchedulingPriority

]

{ #category : 'accessing' }
Processor class >> waitingProcessesAt: aPriority [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:waitingProcessesAt: aPriority

]

{ #category : 'process state change' }
Processor class >> yield [

	<PharoGs>
    ^ProcessorScheduler @env0:scheduler @env2:yield

]
