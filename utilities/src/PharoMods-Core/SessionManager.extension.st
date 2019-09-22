Extension { #name : 'SessionManager' }

{ #category : 'accessing' }
SessionManager class >> default [

	<PharoGs>
	^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'SessionManager_Default'
		ifAbsentPut: [self new installNewSession; yourself].

]

{ #category : 'accessing' }
SessionManager class >> default: aSessionManager [

	<PharoGs>
	^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'SessionManager_Default'
		put: aSessionManager

]
