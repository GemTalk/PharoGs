Extension { #name : 'MutexWrapper' }

{ #category : 'private' }
MutexWrapper >> _semaphore [

	^semaphore ifNil: [semaphore := super _semaphore signal].

]
