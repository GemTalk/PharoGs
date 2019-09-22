Extension { #name : 'FileStream' }

{ #category : 'stdio' }
FileStream class >> stdioHandles [

	<PharoGs>
    ^Array @env0:with: GsFile stdin with: GsFile stdout with: GsFile stderr

]
