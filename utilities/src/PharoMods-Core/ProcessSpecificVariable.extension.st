Extension { #name : 'ProcessSpecificVariable' }

{ #category : 'class initialization' }
ProcessSpecificVariable class >> resetSoleInstance [

    <PharoGs>
	(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:removeKey: (self @env0:name @env0:, '_soleInstance') @env0:asSymbol

]

{ #category : 'class initialization' }
ProcessSpecificVariable class >> soleInstance [

    <PharoGs>
	^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: (self @env0:name @env0:, '_soleInstance') @env0:asSymbol
        ifAbsentPut: [self new]

]
