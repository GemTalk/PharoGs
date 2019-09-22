Extension { #name : 'DoubleByteArray' }

{ #category : 'instance creation' }
DoubleByteArray class >> new: anInteger [

    <PharoGs>
    ^(super new: anInteger)
        atAllPut: 0;
        yourself

]

{ #category : 'private' }
DoubleByteArray >> atAllPut: value [
	"Fill the receiver with the given value"

	<PharoGs>
    1 to: self size do: [ :index | self at: index put: value].

]

{ #category : 'private' }
DoubleByteArray >> replaceFrom: start to: stop with: replacement startingAt: repStart [
	"Primitive. This destructively replaces elements from start to stop in
    the receiver starting at index, repStart, in the collection, replacement.
    Answer the receiver. Range checks are performed in the primitive only.
    Optional. See Object documentation whatIsAPrimitive."

	<PharoGs>
    self @env0:replaceFrom: start to: stop with: replacement startingAt: repStart

]
