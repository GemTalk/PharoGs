Extension { #name : 'SmalltalkImage' }

{ #category : 'memory space' }
SmalltalkImage >> bytesLeft: aBool [
	"Return the amount of available space.
    If aBool is true, include possibly available swap space.
    If aBool is false, include possibly available physical memory.
    For a report on the largest free block currently availabe within
    Pharo memory but not counting extra memory use #primBytesLeft."

    <PharoGsError>
    self _gsError.

]

{ #category : 'snapshot and quit' }
SmalltalkImage >> exit: exitStatus [
	"Primitive. Exit to another operating system on the host machine, if one
	exists. All state changes in the object space since the last snapshot are lost.
	Essential. See Object documentation whatIsAPrimitive.

	Possible values for exitStatus:
	0:   success
	> 1: error"

    <PharoGsError>
    self _gsError.

]

{ #category : 'miscellaneous' }
SmalltalkImage >> exitToDebugger [
	"Primitive. Enter the machine language debugger, if one exists. Essential.
	See Object documentation whatIsAPrimitive."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> forceTenure [
	"Primitive. Tell the GC logic to force a tenure on the next increment GC."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> garbageCollectMost [
	"Primitive. Reclaims recently created garbage (which is usually most of it)
    fairly quickly and answers the number of bytes of available space."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> growMemoryByAtLeast: numBytes [
	"Grow memory by at least the requested number of bytes.
	 Primitive.  Essential. Fail if no memory is available."

    <PharoGsError>
    self _gsError.

]

{ #category : 'image' }
SmalltalkImage >> imageFormatVersion [
	"Answer an integer identifying the type of image. The image version number may
	identify the format of the image (e.g. 32 or 64-bit word size) or specific requirements
	of the image (e.g. block closure support required). This invokes an optional primitive
	that may not be available on all virtual machines."
	"Smalltalk image imageFormatVersion"

    <PharoGsError>
    self _gsError.

]

{ #category : 'testing' }
SmalltalkImage >> isHeadless [

    <PharoGs>
    ^true

]

{ #category : 'testing' }
SmalltalkImage >> isInteractive [

    <PharoGs>
    ^false

]

{ #category : 'memory space' }
SmalltalkImage >> isRoot: oop [
	"Primitive. Answer whether the object is currently a root for youngSpace."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> isYoung: oop [
	"Primitive. Answer whether the object currently resides in youngSpace."

    <PharoGsError>
    self _gsError.

]

{ #category : 'system attributes' }
SmalltalkImage >> maxIdentityHash [
	"Answer the maximum identityHash value supported by the VM."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> primBytesLeft [
	"Primitive. Answer the number of free bytes available in old space.
	 Not accurate unless preceded by
		Smalltalk garbageCollectMost (for reasonable accuracy), or
		Smalltalk garbageCollect (for real accuracy).
	 See Object documentation whatIsAPrimitive."

    <PharoGsError>
    self _gsError.

]

{ #category : 'primitives' }
SmalltalkImage >> primImagePath [
	"Answer the full path name for the current image."
	"Smalltalk imageName"

    <PharoGs>
    ^GsFile @env0:serverCurrentDirectory

]

{ #category : 'primitives' }
SmalltalkImage >> primImagePath: newName [
	"Set the the full path name for the current image.  All further snapshots will use this."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> primitiveGarbageCollect [
	"Primitive. Reclaims all garbage and answers the size of the largest free chunk in old space.."

    <PharoGs>
    System @env0:_generationScavenge_vmMarkSweep.
    ^System @env0:_tempObjSpaceMax - System @env0:_tempObjSpaceUsed

]

{ #category : 'special objects' }
SmalltalkImage >> primitiveGetSpecialObjectsArray [

    <PharoGs>
    ^Array @env0:new: 100

]

{ #category : 'memory space' }
SmalltalkImage >> primLowSpaceSemaphore: aSemaphore [
	"Primitive. Register the given Semaphore to be signalled when the
	number of free bytes drops below some threshold. Disable low-space
	interrupts if the argument is nil."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> primSignalAtBytesLeft: numBytes [
	"Tell the interpreter the low-space threshold in bytes. When the free
	space falls below this threshold, the interpreter will signal the low-space
	semaphore, if one has been registered.  Disable low-space interrupts if the
	argument is zero.  Fail if numBytes is not an Integer."

    <PharoGsError>
    self _gsError.

]

{ #category : 'snapshot and quit' }
SmalltalkImage >> quitPrimitive [
	"Primitive. Exit to another operating system on the host machine, if one
	exists. All state changes in the object space since the last snapshot are lost.
	Essential. See Object documentation whatIsAPrimitive."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> rootTable [
	"Primitive. Answer a snapshot of the VMs root table.
	Keep in mind that the primitive may itself cause GC."

    <PharoGsError>
    self _gsError.

]

{ #category : 'memory space' }
SmalltalkImage >> rootTableAt: index [
	"Primitive. Answer the nth element of the VMs root table"

    <PharoGsError>
    self _gsError.

]

{ #category : 'snapshot and quit' }
SmalltalkImage >> snapshotPrimitive [
	"Primitive. Write the current state of the object memory on a file in the
	same format as the Smalltalk-80 release. The file can later be resumed,
	returning you to this exact state. Return normally after writing the file.
	Essential. See Object documentation whatIsAPrimitive."

    <PharoGsError>
    self _gsError.

]

{ #category : 'specialObjects' }
SmalltalkImage >> specialObjectsArray [

    <PharoGs>
	^specialObjectsArray ifNil: [ specialObjectsArray := self primitiveGetSpecialObjectsArray ].

]

{ #category : 'specialObjects' }
SmalltalkImage >> specialObjectsArray: anArray [
    "Avoid attempt to make Sempahore instances persistent (commit failure).
     If we actually need the Semaphore then we could put it in SessionTemps."

    <PharoGs>
	specialObjectsArray := anArray collect: [:each |
        (each isKindOf: Semaphore) ifTrue: [nil] ifFalse: [each].
    ].

]

{ #category : 'external' }
SmalltalkImage >> unbindExternalPrimitives [
	"Primitive. Force all external primitives to be looked up again afterwards.
    Since external primitives that have not found are bound for fast failure
    this method will force the lookup of all primitives again so that after
    adding some plugin the primitives may be found."

    <PharoGsError>
    self _gsError.

]
