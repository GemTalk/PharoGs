Extension { #name : 'OSPlatform' }

{ #category : 'accessing' }
OSPlatform class >> current [

    <PharoGs>
    ^Current ifNil: [self initialize. Current]

]

{ #category : 'accessing' }
OSPlatform >> currentWorkingDirectoryPath [

    <PharoGs>
    ^GsFile @env0:serverCurrentDirectory

]

{ #category : 'accessing' }
OSPlatform >> currentWorkingDirectoryPathWithBuffer: aByteString [

    <PharoGsError>
    self _gsError

]
