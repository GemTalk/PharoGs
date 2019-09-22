Extension { #name : 'SystemAnnouncer' }

{ #category : 'class initialization' }
SystemAnnouncer class >> announcer: anAnnouncer [

    <PharoGs>
	(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: (self @env0:name @env0:, '_announcer') @env0:asSymbol
        put: anAnnouncer

]

{ #category : 'class initialization' }
SystemAnnouncer class >> uniqueInstance [

    <PharoGs>
	^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: (self @env0:name @env0:, '_announcer') @env0:asSymbol
        ifAbsentPut: [self new]

]
