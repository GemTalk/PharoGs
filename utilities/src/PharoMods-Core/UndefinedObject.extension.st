Extension { #name : 'UndefinedObject' }

{ #category : 'exception handling' }
UndefinedObject >> doesNotUnderstand: aMessage [

    <PharoGs>
	<debuggerCompleteToSender>
	"Handle the fact that there was an attempt to send the given message to an Undeclared variable (nil), hence the receiver does not understand this message (typically #new)."
	"Testing: (3 activeProcess)"
	| exception resumeValue node |

	(thisContext isNil or: [(node := self findUndeclaredVariableIn: thisContext sender sourceNodeExecuted) isNil]) ifTrue: [
		 ^super doesNotUnderstand: aMessage ].

	(exception := VariableNotDeclared new)
			message: aMessage;
			variableNode: node;
			receiver: self.

	resumeValue := exception signal.
	^ exception reachedDefaultHandler
			ifTrue: [ aMessage sentTo: self ]
			ifFalse: [ resumeValue ] .



]
