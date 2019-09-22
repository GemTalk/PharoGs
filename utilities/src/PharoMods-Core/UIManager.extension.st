Extension { #name : 'UIManager' }

{ #category : 'initialization' }
UIManager class >> default [

	<PharoGs>
	^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'UIManager_Default'
		ifAbsentPut: [NonInteractiveUIManager new].

]
