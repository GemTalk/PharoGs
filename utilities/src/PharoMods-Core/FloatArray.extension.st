Extension { #name : 'FloatArray' }

{ #category : 'instance creation' }
FloatArray class >> new: anInteger [

    <PharoGs>
    ^(super new: anInteger)
        atAllPut: 0;
        yourself

]

{ #category : 'comparing' }
FloatArray >> = aFloatArray [
    <PharoGs>

	| length |
	aFloatArray class = self class ifFalse: [^ false].
	length := self size.
	length = aFloatArray size ifFalse: [^ false].
	1 to: self size do: [:i | (self at: i)
			= (aFloatArray at: i) ifFalse: [^ false]].
	^ true

]

{ #category : 'accessing' }
FloatArray >> at: index [

	<PharoGs>
	^Float fromIEEE32Bit: (self basicAt: index)

]

{ #category : 'accessing' }
FloatArray >> at: index put: value [

	<PharoGs>
	value isFloat
		ifTrue:[self basicAt: index put: value asIEEE32BitWord]
		ifFalse:[self at: index put: value asFloat].
	^value

]

{ #category : 'arithmetic' }
FloatArray >> dot: aFloatVector [
	"Primitive. Return the dot product of the receiver and the argument.
	Fail if the argument is not of the same size as the receiver."

	<PharoGs>
    | result |
	self size = aFloatVector size ifFalse:[^self error:'Must be equal size'].
	result := 0.0.
	1 to: self size do:[:i|
		result := result + ((self at: i) * (aFloatVector at: i))].
	^result

]

{ #category : 'comparing' }
FloatArray >> hash [

	<PharoGs>
	| result |
	result := 0.
	1 to: self size do:[:i| result := result + (self basicAt: i) ].
	^result bitAnd: 16r1FFFFFFF

]

{ #category : 'primitives-plugin' }
FloatArray >> primAddArray: floatArray [

	<PharoGs>
	1 to: self size do:[:i| self at: i put: (self at: i) + (floatArray at: i)].

]

{ #category : 'primitives-plugin' }
FloatArray >> primAddScalar: scalarValue [

	<PharoGs>
	1 to: self size do:[:i| self at: i put: (self at: i) + scalarValue].

]

{ #category : 'primitives-plugin' }
FloatArray >> primDivArray: floatArray [

	<PharoGs>
	1 to: self size do:[:i| self at: i put: (self at: i) / (floatArray at: i)].

]

{ #category : 'primitives-plugin' }
FloatArray >> primDivScalar: scalarValue [

	<PharoGs>
	1 to: self size do:[:i| self at: i put: (self at: i) / scalarValue].

]

{ #category : 'primitives-plugin' }
FloatArray >> primMulArray: floatArray [

	<PharoGs>
	1 to: self size do:[:i| self at: i put: (self at: i) * (floatArray at: i)].

]

{ #category : 'primitives-plugin' }
FloatArray >> primMulScalar: scalarValue [

	<PharoGs>
	1 to: self size do:[:i| self at: i put: (self at: i) * scalarValue].

]

{ #category : 'primitives-plugin' }
FloatArray >> primSubArray: floatArray [

	<PharoGs>
	1 to: self size do:[:i| self at: i put: (self at: i) - (floatArray at: i)].

]

{ #category : 'primitives-plugin' }
FloatArray >> primSubScalar: scalarValue [

	<PharoGs>
	1 to: self size do:[:i| self at: i put: (self at: i) - scalarValue].

]

{ #category : 'primitives-plugin' }
FloatArray >> replaceFrom: start to: stop with: replacement startingAt: repStart [
	"Primitive. This destructively replaces elements from start to stop in the receiver starting at index, repStart, in the collection, replacement. Answer the receiver. Range checks are performed in the primitive only. Optional. See Object documentation whatIsAPrimitive."

	<PharoGs>
    self @env0:replaceFrom: start to: stop with: replacement startingAt: repStart

]

{ #category : 'primitives-plugin' }
FloatArray >> sum [

	<PharoGs>
	^ super sum

]
