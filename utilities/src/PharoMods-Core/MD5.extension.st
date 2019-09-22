Extension { #name : 'MD5' }

{ #category : 'testing' }
MD5 class >> isPluginAvailable [

    <PharoGs>
    ^false

]

{ #category : 'private-buffers' }
MD5 >> primProcessBuffer: aByteArray withState: s [

    <PharoGsError>
    self _gsError

]
