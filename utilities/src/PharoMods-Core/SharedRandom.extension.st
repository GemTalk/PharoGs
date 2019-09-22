Extension { #name : 'SharedRandom' }

{ #category : 'instance creation' }
SharedRandom class >> globalGenerator [

	<PharoGs>
	^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'SharedRandom_global'
		ifAbsentPut: [self new].

]
