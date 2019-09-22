Extension { #name : 'VariableNotDeclared' }

{ #category : 'xx' }
VariableNotDeclared >> smartDescription [
	<PharoGs>

	self message ifNil: [^self description].
	^self classSymbol printString
		, ' is missing, and does not understand ', self message selector printString

]
