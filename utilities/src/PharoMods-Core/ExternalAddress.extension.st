Extension { #name : 'ExternalAddress' }

{ #category : 'instance creation' }
ExternalAddress class >> allocate: byteSize [
	"Primitive. Allocate an object on the external heap."

	<PharoGsError>
    self _gsError

]

{ #category : 'instance creation' }
ExternalAddress class >> loadSymbol: moduleSymbol module: module [

	<PharoGsError>
    self _gsError

]

{ #category : 'copying' }
ExternalAddress >> clone [
	<PharoGsError>
    self _gsError

]

{ #category : 'initialization' }
ExternalAddress >> free [
	"Primitive. Free the object pointed to on the external heap.
	Dangerous - may break your system if the receiver hasn't been
	allocated by ExternalAddress class>>allocate:. No checks are done."

	<PharoGsError>
    self _gsError

]
