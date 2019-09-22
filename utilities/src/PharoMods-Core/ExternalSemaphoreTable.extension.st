Extension { #name : 'ExternalSemaphoreTable' }

{ #category : 'accessing' }
ExternalSemaphoreTable class >> clearExternalObjects [
	"Clear the array of objects that have been registered for use in non-Smalltalk code."
	"Only lock additions, removals executing in parallel would have little effect on the resulting array"

	<PharoGs>
	"Ignored"

]

{ #category : 'accessing' }
ExternalSemaphoreTable class >> externalObjects [
	"Not really sure why this is protected, once called you are out of protection of the locks anyways, and any use of the object is dangerous...
	Only additions can potentially change the actual array in use though, so only lock that."

	<PharoGs>
	^#()

]

{ #category : 'initialize' }
ExternalSemaphoreTable class >> initialize [

	<PharoGs>
	"Ignored"

]

{ #category : 'accessing' }
ExternalSemaphoreTable class >> registerExternalObject: anObject [

	<PharoGs>
	"Ignored"

]

{ #category : 'accessing' }
ExternalSemaphoreTable class >> unregisterExternalObject: anObject [

	<PharoGs>
	"Ignored"

]
