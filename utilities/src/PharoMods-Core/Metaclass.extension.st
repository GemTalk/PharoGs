Extension { #name : 'Metaclass' }

{ #category : 'initialize-release' }
Metaclass >> adoptInstance: oldInstance from: oldMetaClass [
	"Recreate any existing instances of the argument, oldClass, as instances of
	the receiver, which is a newly changed class. Permute variables as
	necessary."

	<PharoGsError>
	self _gsError

]

{ #category : 'accessing' }
Metaclass >> environment [

	<PharoGs>
    ^destClass environment

]

{ #category : '*CodeExport' }
Metaclass >> fileOutOn: aFileStream initializing: aBool [
	<PharoGs>

	super fileOutOn: aFileStream.
	(aBool and:[ self includesSelector: #initialize ]) ifTrue: [
		aFileStream cr.
		aFileStream cr.
		aFileStream nextChunkPut: destClass name , ' initialize'.
		aFileStream cr ]

]

{ #category : 'accessing' }
Metaclass >> name [
	<PharoGs>

	"Answer a String that is the name of the receiver, either 'Metaclass' or
	the name of the receiver's class followed by ' class'. '"
	^ destClass isNil
		ifTrue: [ 'a Metaclass' ]
		ifFalse: [ destClass name asString, ' class' ]

]

{ #category : 'instance creation' }
Metaclass >> new [
	<PharoGsError>

	self _gsError

]

{ #category : 'copying' }
Metaclass >> postCopy [
	<PharoGsError>

	self _gsError

]

{ #category : 'accessing' }
Metaclass >> soleInstance [
	<PharoGs>

	"The receiver has only one instance. Answer it."
	^destClass

]
