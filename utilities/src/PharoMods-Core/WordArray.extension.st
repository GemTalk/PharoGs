Extension { #name : 'WordArray' }

{ #category : 'instance creation' }
WordArray class >> new: anInteger [

    <PharoGs>
    ^(super new: anInteger)
        atAllPut: 0;
        yourself

]

{ #category : 'accessing' }
WordArray >> atAllPut: value [
	"Fill the receiver with the given value"

	<PharoGs>
	super atAllPut: value

]

{ #category : 'array arithmetic primitives' }
WordArray >> primAddArray: rcvr and: other into: result [

	<PharoGs>
	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) + (other at: i)
	].
	^ result.

]

{ #category : 'array arithmetic primitives' }
WordArray >> primAddScalar: rcvr and: other into: result [

	<PharoGs>
	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) + other.
	].
	^ result.

]

{ #category : 'array arithmetic primitives' }
WordArray >> primDivArray: rcvr and: other into: result [

	<PharoGs>
	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) / (other at: i)
	].
	^ result.

]

{ #category : 'array arithmetic primitives' }
WordArray >> primDivScalar: rcvr and: other into: result [

	<PharoGs>
	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) / other.
	].
	^ result.

]

{ #category : 'array arithmetic primitives' }
WordArray >> primMulArray: rcvr and: other into: result [

	<PharoGs>
	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) * (other at: i)
	].
	^ result.

]

{ #category : 'array arithmetic primitives' }
WordArray >> primMulScalar: rcvr and: other into: result [

	<PharoGs>
	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) * other.
	].
	^ result.

]

{ #category : 'array arithmetic primitives' }
WordArray >> primSubArray: rcvr and: other into: result [

	<PharoGs>
	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) - (other at: i)
	].
	^ result.

]

{ #category : 'array arithmetic primitives' }
WordArray >> primSubScalar: rcvr and: other into: result [

	<PharoGs>
	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) - other.
	].
	^ result.

]

{ #category : 'accessing' }
WordArray >> replaceFrom: start to: stop with: replacement startingAt: repStart [

	<PharoGs>
	^super replaceFrom: start to: stop with: replacement startingAt: repStart

]
