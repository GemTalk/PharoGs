Extension { #name : 'ZipWriteStream' }

{ #category : 'deflating' }
ZipWriteStream >> deflateBlock: lastIndex chainLength: chainLength goodMatch: goodMatch [
	"^DeflatePlugin doPrimitive:#primitiveDeflateBlock"

    <PharoGs>
	^super deflateBlock: lastIndex chainLength: chainLength goodMatch: goodMatch

]
