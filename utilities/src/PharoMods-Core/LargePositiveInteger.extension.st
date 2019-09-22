Extension { #name : 'LargePositiveInteger' }

{ #category : 'bit manipulation' }
LargePositiveInteger >> hashMultiply [
	"This is a multiplication of hashes by 1664525 mod 2^28 written to avoid
	overflowing into large integers.
	 The primitive is able to perform the operation with modulo arihmetic.

	Example of usage:
	  hash
	    ^ (super hash + variableName hash) hashMultiply
	"
	<PharoGsError>

	self _gsError

]

{ #category : 'arithmetic' }
LargePositiveInteger >> normalize [
	"Check for leading zeroes and return shortened copy if so"

	<PharoGs>
    ^self + 0

]
