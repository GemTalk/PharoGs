Extension { #name : 'ExternalLibrary' }

{ #category : 'initialization' }
ExternalLibrary >> forceLoading [
	"Primitive. Force loading the given library.
	The primitive will fail if the library is not available
	or if anything is wrong with the receiver."

	<PharoGsError>
    self _gsError

]
