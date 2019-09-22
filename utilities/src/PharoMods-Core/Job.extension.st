Extension { #name : 'Job' }

{ #category : 'accessing' }
Job class >> jobAnnouncer [
	"Answers the announcer for job announcements"

    <PharoGs>
    ^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'Job_jobAnnouncer'
		ifAbsentPut: [Announcer new].

]
