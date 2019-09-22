Extension { #name : 'DiskStore' }

{ #category : 'private' }
DiskStore >> directoryAt: aPath nodesDo: aBlock [

	<PharoGs>
    | dirPath entries |
    dirPath := File encodePathString: (self stringFromPath: aPath).
	(self isDirectory: aPath) ifFalse:
		[ ^self signalDirectoryDoesNotExist: aPath ].
    entries := GsFile @env0:contentsOfDirectory: dirPath onClient: false.
    (entries copyFrom: 3 to: entries size) do: [:each |
        | array |
        array := File primFileAttributes: each @env0:asByteArray mask: 2r001.
        aBlock value: (Array with: each with: array).
    ].

]
