Extension { #name : 'Number' }

{ #category : 'private' }
Number >> _nonZeroGte: aNumber [

	<PharoGs>
	^self @env0:_nonZeroGte: aNumber

]

{ #category : 'arithmetic' }
Number >> @ y [
	"Primitive. Answer a Point whose x value is the receiver and whose y
	value is the argument. Optional. No Lookup. See Object documentation
	whatIsAPrimitive."

	<PharoGs>
    ^Point x: self y: y

]
