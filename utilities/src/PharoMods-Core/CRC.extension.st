Extension { #name : 'CRC' }

{ #category : 'primitives' }
CRC class >> update: oldCrc from: start to: stop in: aCollection [
    <PharoGs>

	| newCrc |
	newCrc := oldCrc.
	start to: stop do: [ :i |
		newCrc := (self crc32Table at: ((newCrc bitXor: (aCollection byteAt: i))
				bitAnd: 255) + 1) bitXor: (newCrc bitShift: -8) ].
	^newCrc

]
