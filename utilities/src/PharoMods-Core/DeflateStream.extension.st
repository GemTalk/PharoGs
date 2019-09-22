Extension { #name : 'DeflateStream' }

{ #category : 'private' }
DeflateStream >> updateHashTable: table delta: delta [
    <PharoGs>

	| pos |
	1 to: table size do:[:i|
		"Discard entries that are out of range"
		(pos := table at: i) >= delta
			ifTrue:[table at: i put: pos - delta]
			ifFalse:[table at: i put: 0]].

]
