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
	^ 'file:', (self dirname parent / 'utilities' / 'specs' / self projectname , 'ston' ) pathString
]

{ #category : 'accessing' }
WS_ConvertPharoMods >> projectname [
	^ 'PharoMods'
]

{ #category : 'accessing' }
WS_ConvertPharoMods >> packagename [
	^ self projectname, '-Core'
]

{ #category : 'main' }
WS_ConvertPharoMods >> main [
	(self globalNamed: 'PharoGsReader') 
		readFilesIn: self dirname parent / 'ESUG_2019' / 'PharoMods'
		forProjectSpecUrl: self projectSpecUrl
		inPackageNamed: self packagename.
	^ true
]
