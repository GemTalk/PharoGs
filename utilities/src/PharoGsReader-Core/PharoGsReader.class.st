"
I read .gs files and convert the methods into Rowan class extension methods ... I don't expect to see any class definitions and all extension methods are put into a single package.
"
Class {
	#name : 'PharoGsReader',
	#superclass : 'GsFileIn',
	#category : 'PharoGsReader-Core'
}

{ #category : 'instance creation' }
PharoGsReader class >> readFilesIn: aDirectoryPath [

	"read all of the .gs files in aDirectory and accumulate the extension methods in each .gs file into one Rowan package"

	^self new 
		directory: aDirectoryPath;
		setSession: nil;
		yourself
]

{ #category : 'processing' }
PharoGsReader >> abortTransaction [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> classMethod [

	currentClass isNil ifTrue: [self error: 'current class not defined'].
	"self compileMethodIn: currentClass , ' class'."
self halt.
]

{ #category : 'processing' }
PharoGsReader >> commitTransaction [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> compileEnvironment: arg [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> currentClass: aClassName [
	"skipped"
]

{ #category : 'initialization' }
PharoGsReader >> directory: aDirectoryPath [
	aDirectoryPath asFileReference allFiles
		do: [ :fileReference | 
			fileReference extension = 'gs'
				ifTrue: [ 
					fileReference
						readStreamDo: [ :aFileStream | 
							| stream |
							stream := ZnBufferedReadStream on: fileStream	"hack for now"
							self fileStream: aFileStream.
							self doFilein] ] ]
]

{ #category : 'processing' }
PharoGsReader >> doit [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> execute: aString [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> method [

	currentClass isNil ifTrue: [self error: 'current class not defined'].
	"self compileMethodIn: currentClass."
self halt
]

{ #category : 'processing' }
PharoGsReader >> removeAllClassMethods [
	"skipped"
]

{ #category : 'processing' }
PharoGsReader >> removeAllMethods [
	"skipped"
]
