Extension { #name : 'ZdcSecureSocketStream' }

{ #category : 'ssl' }
ZdcSecureSocketStream >> connect [

    <PharoGs>
    socket connectSecureSocket.

]

{ #category : 'testing' }
ZdcSecureSocketStream >> isConnected [

    <PharoGs>
	^super isConnected @env0:and: [socket hasSecureConnection]

]
