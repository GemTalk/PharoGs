#!/usr/local/bin/smalltalk/gemstone/st_launcher
"
Script to convert .gs files in PharoMods directory into tonel-based packages to
	make it possible for Pharo engineers to analyze and understand the changes 
	made by James to get his Seaside example application running.
"
Class {
	#name : 'WS_ConvertPharoMods',
	#superclass : 'AbstractProgram',
	#instVars : [
	],
	#category : 'PharoGS-Scripts'
}

{ #category : 'accessing' }
WS_ConvertPharoMods >> projectSpecUrl [
	^ 'file:', (self dirName parent / 'utilities' / 'specs' / self projectName , 'ston' ) pathString
]

{ #category : 'accessing' }
WS_ConvertPharoMods >> projectName [
	^ 'PharoMods'
]

{ #category : 'accessing' }
WS_ConvertPharoMods >> packageName [
	^ self projectName, '-Core'
]

{ #category : 'main' }
WS_ConvertPharoMods >> main [
	PharoGsReader 
		readFilesIn: self workingDirectory
		forProjectSpecUrl: self projectSpecUrl
		inPackageNamed: self packageName.
	^ true
]
