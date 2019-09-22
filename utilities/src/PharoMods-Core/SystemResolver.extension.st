Extension { #name : 'SystemResolver' }

{ #category : 'origins' }
SystemResolver >> imageDirectory [

	<PharoGs>
	^self localDirectory

]

{ #category : 'origins' }
SystemResolver >> localDirectory [

	<PharoGs>
	^FileReference / GsFile @env0:serverCurrentDirectory

]
