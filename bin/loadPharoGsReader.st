#!/usr/local/bin/smalltalk/gemstone/st_launcher
"
Load the PharoGsReader project into the image.

	--adopt
		adopt the AnalyzeFilein class that has been previously loaded via topaz 
			filein
"
Class {
	#name : 'WS_LoadPharoGsReader',
	#superclass : 'AbstractProgram',
	#instVars : [
		'adopt'
	],
	#category : 'PharoGS-Scripts'
}

{ #category : 'accessing' }
WS_LoadPharoGsReader >> specUrl [
	^ 'file:$ROWAN_PROJECTS_HOME/PharoGs/utilities/specs/PharoGsReader.ston'
]

{ #category : 'accessing' }
WS_LoadPharoGsReader >> adopt [
	adopt := true
]

{ #category : 'main' }
WS_LoadPharoGsReader >> main [
	(RwComponentProjectDefinition newForUrl: self specUrl)
		projectHome: '$ROWAN_PROJECTS_HOME';
		load.
	adopt == true
		ifTrue: [ 
			Rowan packageTools adopt
				adoptClassNamed: 'AnalyzeFilein'  intoPackageNamed:  'PharoGsReader-Core'.
			(Rowan globalNamed: 'AnalyzeFilein') category: 'PharoGsReader-Core' ].
	^ self commit
]

{ #category : 'options' }
WS_LoadPharoGsReader >> scriptMethodOptions [
	^ super scriptMethodOptions, 
	{
		#('adopt' nil #'none' #adopt).
	}
]

{ #category : 'usage' }
WS_LoadPharoGsReader >> usageExamples: scriptName [
	^	scriptName, '
	', scriptName, ' --adopt
	'
]

{ #category : 'usage' }
WS_LoadPharoGsReader >> usageSynopsis: scriptName [
	^	(super usageSynopsis: scriptName), ' [ --adopt ]'
]
