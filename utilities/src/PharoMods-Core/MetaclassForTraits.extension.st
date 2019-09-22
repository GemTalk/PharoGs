Extension { #name : 'MetaclassForTraits' }

{ #category : 'accessing' }
MetaclassForTraits >> name [

    <PharoGs>
	^ self thisClass isNil
		ifTrue: [ 'a MetaclassForTraits' ]
		ifFalse: [ self thisClass name asString, ' classTrait' ]

]
