Extension { #name : 'UUIDGenerator' }

{ #category : 'accessing' }
UUIDGenerator class >> default [
	"Return the default UUID generator.
	Sharing an instance is more efficient and correct."

	<PharoGs>
	^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'UUIDGenerator_Default'
		ifAbsentPut: [self new].

]
