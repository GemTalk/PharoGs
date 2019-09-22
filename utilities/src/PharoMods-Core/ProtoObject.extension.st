Extension { #name : 'ProtoObject' }

{ #category : 'gemstone' }
ProtoObject >> _gsError [
	<PharoGsError>

	self @env0:error: 'Not supported in GemStone'

]

{ #category : 'comparing' }
ProtoObject >> _gsReservedSelector_equal_equal_: anObject [
	"Primitive. Answer whether the receiver and the argument are the same
	object (have the same object pointer). Do not redefine the message == in
	any other class! Essential. No Lookup. Do not override in any subclass.
	See Object documentation whatIsAPrimitive."
	"The above Pharo code attempts to compile a reserved selector so we place it here for reference"

	<PharoGs>
	^self == anObject

]

{ #category : 'comparing' }
ProtoObject >> _gsReservedSelector_tilde_tilde_: anObject [
	"Primitive. Answer whether the receiver and the argument are different objects
	(do not have the same object pointer). Do not redefine the message ~~ in
	any other class! Optional (Assuming == is essential). No Lookup. Do not override in any subclass.
	See Object documentation whatIsAPrimitive."
	"The above Pharo code attempts to compile a reserved selector so we place it here for reference"

	<PharoGs>
	^self ~~ anObject

]

{ #category : 'comparing' }
ProtoObject >> == anObject [
	"Primitive. Answer whether the receiver and the argument are the same
	object (have the same object pointer). Do not redefine the message == in
	any other class! Essential. No Lookup. Do not override in any subclass.
	See Object documentation whatIsAPrimitive."
	<PharoGs>
	^self @env0:== anObject

]

{ #category : 'comparing' }
ProtoObject >> ~~ anObject [
	"Primitive. Answer whether the receiver and the argument are different objects
	(do not have the same object pointer). Do not redefine the message ~~ in
	any other class! Optional (Assuming == is essential). No Lookup. Do not override in any subclass.
	See Object documentation whatIsAPrimitive."

	<PharoGs>
	^self @env0:~~ anObject

]

{ #category : 'reflective operations' }
ProtoObject >> basicIdentityHash [
	"Answer a 22 bits unsigned SmallInteger whose value is related to the receiver's identity.  '

	Primitive. Fails if the receiver is an immediate. Essential.
	See Object documentation whatIsAPrimitive.

	Do not override, use #identityHash instead"

	<primitive: 321>
	<PharoGs>
	nil @env0:_primitiveFailed: #basicIdentityHash .
	nil @env0:_uncontinuableError

]

{ #category : 'reflective operations' }
ProtoObject >> become: otherObject [
	"Primitive. Swap the object pointers of the receiver and the argument.
	All variables in the entire system that used to point to the
	receiver now point to the argument, and vice-versa.
	Fails if either object is a SmallInteger"

	<PharoGs>
	^self @env0:become: otherObject

]

{ #category : 'class membership' }
ProtoObject >> class [
	"Primitive. Answer the object which is the receiver's class. Essential. See  '
	Object documentation whatIsAPrimitive."

	<primitive: 610>
	<PharoGs>
	^self @env0:class

]

{ #category : 'introspection' }
ProtoObject >> instVarsInclude: anObject [
"Answers true if anObject is among my named or indexed instance variables, and false otherwise"

	<PharoGs>
	1 to: self class instSize do:
		[:i | (self instVarAt: i) == anObject ifTrue: [^ true]].
	1 to: self basicSize do:
		[:i | (self basicAt: i) == anObject ifTrue: [^ true]].
	^ false

]

{ #category : 'memory scanning' }
ProtoObject >> nextInstance [
	"Primitive. Answer the next instance after the receiver in the
	enumeration of all instances of this class. Fails if all instances have been
	enumerated. Essential. See Object documentation whatIsAPrimitive."

	<PharoGsError>
	self _gsError

]

{ #category : 'memory scanning' }
ProtoObject >> nextObject [
	"Primitive. Answer the next object after the receiver in the
	enumeration of all objects. Return 0 when all objects have been
	enumerated."

	<PharoGsError>
	self _gsError

]

{ #category : 'comparing' }
ProtoObject >> rfIsEqual: anObject [
	"Primitive. Answer whether the receiver and the argument are the same
	object (have the same object pointer). Do not redefine the message == in
	any other class! Essential. No Lookup. Do not override in any subclass.
	See Object documentation whatIsAPrimitive."
	<metaLinkOptions: #( #+ optionDisabledLink)>
	<PharoGs>

	^(Reflection oopOf: self) == (Reflection oopOf: anObject)

]

{ #category : '*Reflectivity' }
ProtoObject >> rFwithArgs: argArray executeMethod: compiledMethod [
	"Execute compiledMethod against the receiver and args in argArray"
	"This method is used by reflectivity internally. All meta-links are ignored"
	<disableReflectivity>
	<PharoGsError>

	self _gsError

]

{ #category : 'apply primitives' }
ProtoObject >> tryPrimitive: primIndex withArgs: argumentArray [
	"This method is a template that the Smalltalk simulator uses to
	execute primitives. See Object documentation whatIsAPrimitive."
	<PharoGsError>

	self _gsError

]

{ #category : 'executing' }
ProtoObject >> withArgs: argArray executeMethod: compiledMethod [
	"Execute compiledMethod against the receiver and args in argArray"
	<PharoGsError>

	self _gsError

]
