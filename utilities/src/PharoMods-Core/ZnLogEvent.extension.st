Extension { #name : 'ZnLogEvent' }

{ #category : 'accessing' }
ZnLogEvent class >> announcer [

    <PharoGs>
    ^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'ZnLogEvent_LogEventAnnouncer'
		ifAbsentPut: [Announcer new].

]
