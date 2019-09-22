"
I read .gs files and convert the methods into Rowan class extension methods ... I don't expect to see any class definitions and all extension methods are put into a single package.
"
Class {
	#name : 'PharoGsReader',
	#superclass : 'GsFileIn',
	#instVars : [
		'project',
		'currentPackage',
		'currentFileReference'
	],
	#category : 'PharoGsReader-Core'
}

{ #category : 'instance creation' }
PharoGsReader class >> readFilesIn: aDirectoryPath forProjectSpecUrl: projectSpecUrl inPackageNamed: packageName [
	"read all of the .gs files in aDirectory and accumulate the extension methods in each .gs file into one Rowan package"

	^ self new
		directory: aDirectoryPath
			forProjectSpecUrl: projectSpecUrl
			inPackageNamed: packageName;
		yourself
]

{ #category : 'processing' }
PharoGsReader >> abortTransaction [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> classMethod [
	| classExtension |
	currentClass isNil
		ifTrue: [ self error: 'current class not defined' ].
	classExtension := self currentPackage
		classExtensionDefinitionNamed: self currentClass
		ifAbsent: [ self currentPackage addClassExtensionNamed: self currentClass ].
	classExtension addClassMethod: self nextChunk protocol: category
]

{ #category : 'processing' }
PharoGsReader >> commitTransaction [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> compileEnvironment: arg [
	"skipped"
]

{ #category : 'accessing' }
PharoGsReader >> currentPackage [
	^ currentPackage
]

{ #category : 'initialization' }
PharoGsReader >> directory: aDirectoryPath forProjectSpecUrl: projectSpecUrl inPackageNamed: packageName [
	project := RwComponentProjectDefinition newForUrl: projectSpecUrl.
	currentPackage := project
		addPackageNamed: packageName
		toComponentNamed: project name
		withConditions: {'gemstone'}
		andGroupName: 'core'
		gemstoneDefaultSymbolDictionaryForUser: 'SystemUser' -> 'UserGlobals'.
	aDirectoryPath asFileReference allFiles
		do: [ :fileReference | 
			fileReference extension = 'gs'
				ifTrue: [ 
					currentFileReference := fileReference.
					fileReference
						readStreamDo: [ :aFileStream | 
							| stream |
							stream := ZnBufferedReadStream on: aFileStream.	"hack for now"
							self fileStream: stream.
							self doFileIn ] ] ].
	project export
]

{ #category : 'processing' }
PharoGsReader >> doit [
	self error: 'unexpected doit .... only methods expected'
]

{ #category : 'processing' }
PharoGsReader >> execute: aString [
	self error: 'unexpected execute: .... only methods expected'
]

{ #category : 'processing' }
PharoGsReader >> method [
	| classExtension |
	currentClass isNil
		ifTrue: [ self error: 'current class not defined' ].
	classExtension := self currentPackage
		classExtensionDefinitionNamed: self currentClass
		ifAbsent: [ self currentPackage addClassExtensionNamed: self currentClass ].
	classExtension addInstanceMethod: self nextChunk protocol: category
]

{ #category : 'accessing' }
PharoGsReader >> project [
	^ project
]

{ #category : 'processing' }
PharoGsReader >> removeAllClassMethods [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> removeAllMethods [
	"skipped"
]
