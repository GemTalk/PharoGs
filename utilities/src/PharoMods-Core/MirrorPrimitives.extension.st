Extension { #name : 'MirrorPrimitives' }

{ #category : 'comparison' }
MirrorPrimitives class >> check: anObject identicalTo: anotherObject [
	"Answer whether the first and second arguments are the same object (have the
	 same object pointer) without sending a message to the first argument.  This
	 mimics the action of the VM when it compares two object pointers.  Used to
	 simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

    <PharoGs>
    ^anObject == anotherObject  "optimized in GemStone, so no message send"

]

{ #category : 'class relationship' }
MirrorPrimitives class >> classOf: anObject [
	"Primitive. Answer the object which is the receiver's class"

    <PharoGs>
    ^Reflection @env0:classOf: anObject

]

{ #category : 'fields accessing' }
MirrorPrimitives class >> fixedFieldOf: anObject at: anIndex [
	"Primitive. Answer a fixed variable in an object. The numbering of the
	 variables corresponds to the named instance variables. Fail if the index
	 is not an Integer or is not the index of a fixed variable"

    <PharoGs>
    ^Reflection @env0:fetchFrom: anObject at: anIndex

]

{ #category : 'fields accessing' }
MirrorPrimitives class >> fixedFieldOf: anObject at: anIndex put: newValue [
	"Primitive. Store a value into a fixed variable in the argument anObject.
	 The numbering of the variables corresponds to the named instance
	 variables.  Fail if the index is not an Integer or is not the index of a
	 fixed variable.  Answer the value stored as the result"

    <PharoGs>
    ^Reflection @env0:storeTo: anObject at: anIndex put: newValue

]

{ #category : 'hashes' }
MirrorPrimitives class >> identityHashOf: anObject [
	"Answer a SmallInteger whose value is related to the receiver's identity.
	This method must not be overridden, except by SmallInteger.
	Primitive. Fails if the receiver is a SmallInteger"

    <PharoGsError>
    ^self _gsError

]

{ #category : 'fields accessing' }
MirrorPrimitives class >> indexableFieldOf: anObject at: anIndex [
	"Primitive. Assumes receiver is indexable. Answer the value of an
	indexable element in the receiver. Fail if the argument index is not an
	Integer or is out of bounds. Essential. See Object documentation
	whatIsAPrimitive. Read the class comment for a discussion about that the fact
	that the index can be a float."

    <PharoGs>
    ^Reflection
        @env0:fetchFrom: anObject
        at: anIndex + (Reflection @env0:namedSizeOf: anObject)

]

{ #category : 'fields accessing' }
MirrorPrimitives class >> indexableFieldOf: anObject at: anIndex put: newValue [
	"Primitive. Assumes receiver is indexable. Store the argument value in
	the indexable element of the receiver indicated by index. Fail if the
	index is not an Integer or is out of bounds. Or fail if the value is not of
	the right type for this kind of collection. Answer the value that was
	stored"

    <PharoGs>
    ^Reflection
        @env0:storeTo: anObject
        at: anIndex + (Reflection @env0:namedSizeOf: anObject)
        put: newValue

]

{ #category : 'fields accessing' }
MirrorPrimitives class >> indexableSizeOf: anObject [
	"Answer the number of indexable variables in the argument anObject without sending
	 it a message. This mimics the action of the VM when it fetches an object's variable size"

    <PharoGs>
    ^(Reflection @env0:sizeOf: anObject) - (Reflection @env0:namedSizeOf: anObject)

]

{ #category : 'write barrier' }
MirrorPrimitives class >> isObjectReadOnly: anObject [

    <PharoGsError>
    ^self _gsError

]

{ #category : 'write barrier' }
MirrorPrimitives class >> makeObject: anObject readOnly: aBoolean [

    <PharoGsError>
    ^self _gsError

]

{ #category : 'class relationship' }
MirrorPrimitives class >> setClass: classObject to: anObject [
	"Change the class of anObject to classObject"

    <PharoGsError>
    ^self _gsError

]

{ #category : 'message performing' }
MirrorPrimitives class >> withReceiver: receiver andArguments: argArray execute: compiledMethod [
	"Execute compiledMethod against the receiver and the arguments in argArray"

    <PharoGsError>
    ^self _gsError

]

{ #category : 'message performing' }
MirrorPrimitives class >> withReceiver: anObject perform: selector withArguments: argArray [
	"Send the selector, aSymbol, to the receiver with arguments in argArray.
	Fail if the number of arguments expected by the selector
	does not match the size of argArray.
	Primitive. Optional. See Object documentation whatIsAPrimitive."

    <PharoGsError>
    ^self _gsError

]

{ #category : 'message performing' }
MirrorPrimitives class >> withReceiver: receiver perform: selector withArguments: argArray inSuperclass: lookupClass [
	"NOTE:  This is just like perform:withArguments:, except that
	the message lookup process begins, not with the receivers's class,
	but with the supplied superclass instead.  It will fail if lookupClass
	cannot be found among the receiver's superclasses"

    <PharoGsError>
    ^self _gsError

]

{ #category : 'message performing' }
MirrorPrimitives class >> withReceiver: receiver tryPrimitive: number withArguments: args [
	"This method is a template that the Smalltalk simulator uses to
	execute primitives"

    <PharoGsError>
    ^self _gsError

]
