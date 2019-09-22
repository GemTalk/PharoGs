Extension { #name : 'TestCase' }

{ #category : 'accessing' }
TestCase class >> historyAnnouncer [

	<PharoGs>
	^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'TestCase_HistoryAnnouncer'
		ifAbsentPut: [Announcer new].

]
