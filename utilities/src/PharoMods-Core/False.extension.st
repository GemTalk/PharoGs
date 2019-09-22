Extension { #name : 'False' }

{ #category : 'instance creation' }
False class >> new [

	<PharoGs>
	self error: 'You may not create any more Booleans - this is two-valued logic'

]
