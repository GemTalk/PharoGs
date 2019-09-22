Extension { #name : 'ExceptionSet' }

{ #category : 'exceptionselector' }
ExceptionSet >> , anExceptionOrExceptionSet [
	"Return an exception set that contains the receiver and the argument exception. This is commonly used to specify a set of exception selectors for an exception handler."

	<PharoGs>
	^self @env0:, anExceptionOrExceptionSet

]

{ #category : 'private' }
ExceptionSet >> add: anExceptionOrExceptionSet [

	<PharoGs>
    self @env0:, anExceptionOrExceptionSet.
    ^anExceptionOrExceptionSet

]

{ #category : 'exceptionselector' }
ExceptionSet >> handles: anException [

	<PharoGs>
    ^self @env0:handles: anException

]

{ #category : 'initialization' }
ExceptionSet >> initialize [

	<PharoGs>
    ^self @env0:initialize

]
