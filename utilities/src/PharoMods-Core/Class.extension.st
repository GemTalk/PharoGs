Extension { #name : 'Class' }

{ #category : 'accessing' }
Class >> basicCategory [

	<PharoGs>
	^classCategory

]

{ #category : 'accessing' }
Class >> basicCategory: aSymbol [

	<PharoGs>
	classCategory := aSymbol.

]

{ #category : 'accessing' }
Class >> classPool [

	<PharoGs>
	| dict |
	dict := Dictionary new.
	classVars @env0:keysAndValuesDo: [:eachKey :eachValue |
		dict add: (ClassVariable key: eachKey value: eachValue).
	].
	^dict

]

{ #category : 'accessing' }
Class >> classPool: aDictionary [

	<PharoGs>
	classVars := aDictionary.

]

{ #category : 'copying' }
Class >> copyForAnnouncement [

	<PharoGsError>
	self _gsError

]

{ #category : 'organization' }
Class >> environment [

	<PharoGs>
	^Smalltalk globals

]

{ #category : 'organization' }
Class >> environment: anEnvironment [

	<PharoGsError>
	self _gsError

]

{ #category : 'instance creation' }
Class >> new [
	"Answer a new initialized instance of the receiver (which is a class) with no indexable variables. Fail if the class is indexable."

	<PharoGs>
	^ self basicNew initialize

]

{ #category : 'instance creation' }
Class >> new: sizeRequested [
	"Answer an initialized instance of this class with the number of indexable
	variables specified by the argument, sizeRequested."

	<PharoGs>
	^ (self basicNew: sizeRequested) initialize

]

{ #category : 'initialization' }
Class >> obsolete [
	"In GemStone, we do nothing for now"

	<PharoGs>

]

{ #category : 'pool variables' }
Class >> sharedPools [
	"Answer an orderedCollection of the shared pools declared in the receiver."

	<PharoGs>
	^OrderedCollection withAll: (poolDictionaries ifNil: [#()])

]

{ #category : 'pool variables' }
Class >> sharedPools: aCollection [

	<PharoGs>
	poolDictionaries := aCollection

]

{ #category : 'subclass creation - deprecated' }
Class >> subclass: t instanceVariableNames: f classVariableNames: d poolDictionaries: s category: cat [

	<PharoGs>
	s @env0:notEmpty @env0:ifTrue: [self _gsError].
	^(self
		@env0:subclass: t
		instVarNames: ((f @env0:subStrings: Character @env0:space) @env0:reject: [:each | each @env0:isEmpty])
		classVars: ((d @env0:subStrings: Character @env0:space) @env0:reject: [:each | each @env0:isEmpty])
		classInstVars: #()
		poolDictionaries: #()
		inDictionary: Pharo)
		category: cat;
		yourself

]

{ #category : 'accessing' }
Class >> subclasses [

	<PharoGs>
	^self @env0:subclasses @env0:asArray

]
