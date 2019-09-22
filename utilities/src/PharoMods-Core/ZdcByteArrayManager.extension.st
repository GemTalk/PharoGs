Extension { #name : 'ZdcByteArrayManager' }

{ #category : 'accessing' }
ZdcByteArrayManager class >> current [

    <PharoGs>
    ^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'ZdcByteArrayManager_Current'
		ifAbsentPut: [self new].

]
