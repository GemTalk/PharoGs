Extension { #name : 'ClassOrganization' }

{ #category : 'initialization' }
ClassOrganization >> initializeClass: aClass [

    <PharoGs>
	self initialize.
	organizedClass := aClass.
	organizedClass selectors do: [ :each |
		self
            classify: each
            under: ((aClass @env0:categoryOfSelector: each environmentId: 2)
                ifNil: [Protocol unclassified])
    ].

]
