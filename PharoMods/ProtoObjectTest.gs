set compile_env: 2

category: 'tests - testing'
method: ProtoObjectTest
testFlag
	<PharoGsError>
	self _gsError "
	ProtoObject new flag: #hallo"
%

category: 'tests - testing'
method: ProtoObjectTest
testIfNil
	<PharoGsError>
	self _gsError "
	| object block reachabilityTest|
	reachabilityTest := false.
	object := ProtoObject new.
	object ifNil: [reachabilityTest := true ].
	self assert: (object ifNil: [ nil ]) == object.
	self assert: reachabilityTest equals: false.
	""Now the same test without inlining.""
	reachabilityTest := false.
	block := [ reachabilityTest := true].
	object ifNil: block.
	block := [ nil ].
	self assert: (object ifNil: block) == object.
	self assert: reachabilityTest equals: false."
%

category: 'tests - testing'
method: ProtoObjectTest
testIfNilIfNotNil
	<PharoGsError>
	self _gsError "
	| object returnValue block notReached1 reached1 notReached2 reached2 reached3 notReached3 reached4 notReached4 |
	notReached1 := false. reached1 := false. notReached2 := false. reached2 := false.
	notReached3 := false. reached3 := false. notReached4 := false. reached4 := false.
	object := ProtoObject new.
	returnValue := Object new.
	object ifNil: [ notReached1 := true ] ifNotNil: [ reached1 := true ].
	self assert: notReached1 equals: false.
	self assert: reached1 equals: true.
	object ifNil: [ notReached2 := true ] ifNotNil: [ :o | reached2 := true ].
	self assert: notReached2 equals: false.
	self assert: reached2 equals: true.
	self assert: (object ifNil: [ false ] ifNotNil: [ :o | o == object ]).
	self assert: (object ifNil: [ nil ] ifNotNil: [ returnValue ]) == returnValue.
	self assert: (object ifNil: [ nil ] ifNotNil: [ :o | returnValue ]) == returnValue.
	
	""Now the same without inlining.""
	block := [ reached3 := true ].
	object ifNil: [ notReached3 := true ] ifNotNil: block.
	self assert: notReached3 equals: false.
	self assert: reached3 equals: true.
	block := [ :o | reached4 := true ].
	object ifNil: [ notReached4 := true ] ifNotNil: block.
	self assert: notReached4 equals: false.
	self assert: reached4 equals: true.
	
	block := [ :o | o == object ].
	self assert: (object ifNil: [ false ] ifNotNil: block).
	block := [ returnValue ].
	self assert: (object ifNil: [ nil ] ifNotNil: block) = returnValue.
	block := [ :o | returnValue ].
	self assert: (object ifNil: [ nil ] ifNotNil: block) = returnValue"
%

category: 'tests - testing'
method: ProtoObjectTest
testIfNotNil
	<PharoGsError>
	self _gsError "
	| object returnValue block reached|
	object := ProtoObject new.
	returnValue := Object new.
	reached := false.
	object ifNotNil: [ reached := true ].
	self assert: reached equals: true.
	reached := false.
	object ifNotNil: [ :o | reached := true ].
	self assert: reached equals: true.
	self assert: (object ifNotNil: [ :o | o == object ]).
	self assert: (object ifNotNil: [ returnValue ]) == returnValue.
	self assert: (object ifNotNil: [ :o | returnValue ]) == returnValue.	
	""Now the same without inlining.""
	block := [ reached := true ].
	object ifNotNil: block.
	self assert: reached equals: true.
	reached := false.
	block := [ :o | reached := true ].
	object ifNotNil: block.
	self assert: reached equals: true.
	block := [ :o | o == object ].
	self assert: (object ifNotNil: block).
	block := [ returnValue ].
	self assert: (object ifNotNil: block) = returnValue.
	block := [ :o | returnValue ].
	self assert: (object ifNotNil: block) = returnValue"
%

category: 'tests - testing'
method: ProtoObjectTest
testIfNotNilIfNil
	<PharoGsError>
	self _gsError "
	| object returnValue block reached notReached|
	object := ProtoObject new.
	returnValue := Object new.
	
	reached := false. notReached := false.
	object ifNotNil: [ reached := true ] ifNil: [ notReached := true ].
	self assert: reached equals: true.
	self assert: notReached equals: false.
	
	reached := false. notReached := false.
	object ifNotNil: [ :o | reached := true ] ifNil: [ notReached := true ].
	self assert: reached equals: true.
	self assert: notReached equals: false.
	
	reached := false.
	notReached := false.
	self assert: (object ifNotNil: [ :o | o == object ] ifNil: [ false ]).
	self assert: (object ifNotNil: [ returnValue ] ifNil: [ false ]) == returnValue.
	self assert: (object ifNotNil: [ :o | returnValue ] ifNil: [ false ]) == returnValue.
	""Now the same without inlining.""
	reached := false.	notReached := false.
	block := [ reached := true ].
	object ifNotNil: block ifNil: [ notReached := true ].
	self assert: reached equals: true.
	self assert: notReached equals: false.
	
	reached := false. notReached := false.	
	block := [ :o | reached := true ].
	object ifNotNil: block ifNil: [ notReached := true ].
	self assert: reached equals: true.
	self assert: notReached equals: false.
	
	block := [ :o | o == object ].
	self assert: (object ifNotNil: block ifNil: [ false ]).
	block := [ returnValue ].
	self assert: (object ifNotNil: block ifNil: [ false ]) == returnValue.
	block := [ :o | returnValue ].
	self assert: (object ifNotNil: block ifNil: [ false ]) == returnValue"
%

category: 'tests - testing'
method: ProtoObjectTest
testIsNil
	<PharoGsError>
	self _gsError "
	self deny: ProtoObject new isNil"
%

category: 'tests - testing'
method: ProtoObjectTest
testNotTheSame
	<PharoGsError>
	self _gsError "
	| object1 object2 |
	object1 := ProtoObject new.
	object2 := ProtoObject new.
	self assert: object1 ~~ object2.
	self deny: object1 ~~ object1."
%

category: 'tests - testing'
method: ProtoObjectTest
testPointersTo
	<PharoGsError>
	self _gsError "
	| myObject myArray |
	myObject := Object new.
	self assertEmpty: myObject pointersTo.
	myArray := {myObject . myObject}.
	self assert: myObject pointersTo asArray equals: {myArray}"
%

set compile_env: 0
