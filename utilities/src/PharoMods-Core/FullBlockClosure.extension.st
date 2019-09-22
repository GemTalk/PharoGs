Extension { #name : 'FullBlockClosure' }

{ #category : 'scanning' }
FullBlockClosure >> abstractBytecodeMessagesDo: aBlock [

    <PharoGsError>
    self _gsError.

]

{ #category : 'private' }
FullBlockClosure >> asContextWithSender: aContext [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> compiledBlock [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> compiledBlock: aCompiledMethod [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> endPC [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> hasMethodReturn [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> home [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> method [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> numArgs: n [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> numTemps [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> outerContext: ctxt [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> printOn: s [

    <PharoGs>
	[ super printOn: s ] on: Error do: [ :ex | s << '![' << ex messageText << ']!' ]

]

{ #category : 'accessing' }
FullBlockClosure >> receiver [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> receiver: anObject [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> simulateValueWithArguments: anArray caller: aContext [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> sourceNode [

    <PharoGsError>
    self _gsError.

]

{ #category : 'accessing' }
FullBlockClosure >> startpc [

    <PharoGsError>
    self _gsError.

]

{ #category : 'evaluating' }
FullBlockClosure >> value [
	"Activate the receiver, creating a closure activation (MethodContext)
	 whose closure is the receiver and whose caller is the sender of this
	 message. Supply the copied values to the activation as its copied
	 temps. Primitive. Essential."

    <PharoGsError>
    self _gsError.

]

{ #category : 'evaluating' }
FullBlockClosure >> value: firstArg [
	"Activate the receiver, creating a closure activation (MethodContext)
	 whose closure is the receiver and whose caller is the sender of this
	 message. Supply the argument and copied values to the activation
	 as its argument and copied temps. Primitive. Essential."

    <PharoGsError>
    self _gsError.

]

{ #category : 'evaluating' }
FullBlockClosure >> value: firstArg value: secondArg [
	"Activate the receiver, creating a closure activation (MethodContext)
	 whose closure is the receiver and whose caller is the sender of this
	 message. Supply the arguments and copied values to the activation
	 as its arguments and copied temps. Primitive. Essential."

    <PharoGsError>
    self _gsError.

]

{ #category : 'evaluating' }
FullBlockClosure >> value: firstArg value: secondArg value: thirdArg [
	"Activate the receiver, creating a closure activation (MethodContext)
	 whose closure is the receiver and whose caller is the sender of this
	 message. Supply the arguments and copied values to the activation
	 as its arguments and copied temps. Primitive. Essential."

    <PharoGsError>
    self _gsError.

]

{ #category : 'evaluating' }
FullBlockClosure >> value: firstArg value: secondArg value: thirdArg value: fourthArg [
	"Activate the receiver, creating a closure activation (MethodContext)
	 whose closure is the receiver and whose caller is the sender of this
	 message. Supply the arguments and copied values to the activation
	 as its arguments and copied temps. Primitive. Essential."

    <PharoGsError>
    self _gsError.

]

{ #category : 'evaluating' }
FullBlockClosure >> valueNoContextSwitch [
	"An exact copy of BlockClosure>>value except that this version will not preempt
	 the current process on block activation if a higher-priority process is runnable.
	 Primitive. Essential."

    <PharoGsError>
    self _gsError.

]

{ #category : 'evaluating' }
FullBlockClosure >> valueNoContextSwitch: anArg [
	"An exact copy of BlockClosure>>value: except that this version will not preempt
	 the current process on block activation if a higher-priority process is runnable.
	 Primitive. Essential."

    <PharoGsError>
    self _gsError.

]

{ #category : 'evaluating' }
FullBlockClosure >> valueWithArguments: anArray [
	"Activate the receiver, creating a closure activation (MethodContext)
	 whose closure is the receiver and whose caller is the sender of this
	 message. Supply the arguments in an anArray and copied values to
	 the activation as its arguments and copied temps. Primitive. Essential."

    <PharoGsError>
    self _gsError.

]
