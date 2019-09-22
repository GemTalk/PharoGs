Extension { #name : 'LargeNegativeInteger' }

{ #category : 'arithmetic' }
LargeNegativeInteger >> normalize [
	"Check for leading zeroes and return shortened copy if so"

	<PharoGs>
    ^self + 0

]
