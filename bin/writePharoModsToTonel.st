#!/usr/local/bin/smalltalk/gemstone/st_launcher
"
Script to convert .gs files in PharoMods directory into tonel-based packages to
make it possible for Pharo engineers to analyze and understand the changes made
by James to get the Seaside application running.

	--install
		Install the GsFileIn subclass that reads .gs format files and produces a 
			Rowan project.
"
Class {
	#name : 'WS_ConvertPharoMods',
	#superclass : 'AbstractProgram',
	#instVars : [
	],
	#category : 'PharoGS-Scripts'
}

{ #category : 'accessing' }
WS_ConvertPharoMods >> install [
	self commit
]

{ #category : 'main' }
WS_ConvertPharoMods >> main [
	| project |
	self export: project.
	^ true
]

{ #category : 'options' }
WS_ConvertPharoMods >> scriptMethodOptions [
	^ super scriptMethodOptions, 
	{
		#('install' nil #'none' #install).
	}
]

{ #category : 'usage' }
WS_ConvertPharoMods >> usageExamples: scriptName [
	^	scriptName, ' --install
	'
]

{ #category : 'usage' }
WS_ConvertPharoMods >> usageSynopsis: scriptName [
	^	(super usageSynopsis: scriptName), ' [ --install ]'
]
