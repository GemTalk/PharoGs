Extension { #name : '**' }

{ #category : 'forward to Pharo' }
** >> _asFixedPoint [

	<PharoGs>
	| fixedPoint |
	fixedPoint := self @env0:asFraction.
	^FixedPoint
		@env0:numerator: fixedPoint @env0:numerator
		denominator: fixedPoint @env0:denominator
		scale: scale.

]

{ #category : 'forward to Pharo' }
** >> - aNumber [
	<PharoGs>
    ^self _asFixedPoint - aNumber

]

{ #category : 'forward to Pharo' }
** >> * aNumber [
	<PharoGs>
    ^self _asFixedPoint * aNumber

]

{ #category : 'forward to Pharo' }
** >> / aNumber [
	<PharoGs>
    ^self _asFixedPoint / aNumber

]

{ #category : 'forward to Pharo' }
** >> + aNumber [
	<PharoGs>
    ^self _asFixedPoint + aNumber

]

{ #category : 'forward to Pharo' }
** >> < aNumber [
	<PharoGs>
    ^self _asFixedPoint < aNumber

]

{ #category : 'forward to Pharo' }
** >> <= aNumber [
	<PharoGs>
    ^self _asFixedPoint <= aNumber

]

{ #category : 'forward to Pharo' }
** >> = aNumber [
	<PharoGs>
    ^self _asFixedPoint = aNumber

]

{ #category : 'forward to Pharo' }
** >> => aNumber [
	<PharoGs>
    ^self _asFixedPoint => aNumber

]

{ #category : 'forward to Pharo' }
** >> >= aNumber [
	<PharoGs>
    ^self _asFixedPoint >= aNumber

]

{ #category : 'forward to Pharo' }
** >> adaptToFraction: rcvr andSend: selector [
	<PharoGs>
    ^self _asFixedPoint adaptToFraction: rcvr andSend: selector

]

{ #category : 'forward to Pharo' }
** >> adaptToInteger: rcvr andSend: selector [
	<PharoGs>
    ^self _asFixedPoint adaptToInteger: rcvr andSend: selector

]

{ #category : 'forward to Pharo' }
** >> asFraction [
	<PharoGs>
    ^self _asFixedPoint asFraction

]

{ #category : 'forward to Pharo' }
** >> class [
	<PharoGs>
    ^Pharo @env0:at: #'ScaledDecimal'

]

{ #category : 'forward to Pharo' }
** >> coerce: aNumber [
	<PharoGs>
    ^self _asFixedPoint coerce: aNumber

]

{ #category : 'forward to Pharo' }
** >> doesNotUnderstand: aMessage [

	<PharoGs>
	^self _asFixedPoint
		perform: aMessage selector
		withArguments: aMessage arguments

]

{ #category : 'forward to Pharo' }
** >> isFraction [
	<PharoGs>
    ^false

]

{ #category : 'forward to Pharo' }
** >> isLiteral [
	<PharoGs>
    ^self _asFixedPoint isLiteral

]

{ #category : 'forward to Pharo' }
** >> isSelfEvaluating [
	<PharoGs>
    ^self _asFixedPoint isSelfEvaluating

]

{ #category : 'forward to Pharo' }
** >> literalEqual: other [
	<PharoGs>
    ^self _asFixedPoint literalEqual: other

]

{ #category : 'forward to Pharo' }
** >> negated [
	<PharoGs>
    ^self _asFixedPoint negated

]

{ #category : 'forward to Pharo' }
** >> nthRoot: anInteger [
	<PharoGs>
    ^self _asFixedPoint nthRoot: anInteger

]

{ #category : 'forward to Pharo' }
** >> perform: aSymbol with: anObject [
	<PharoGs>
    ^self _asFixedPoint perform: aSymbol with: anObject

]

{ #category : 'forward to Pharo' }
** >> printOn: aStream [
	<PharoGs>
    ^self _asFixedPoint printOn: aStream

]

{ #category : 'forward to Pharo' }
** >> printOn: aStream base: base [
	<PharoGs>
    ^self _asFixedPoint printOn: aStream base: base

]

{ #category : 'forward to Pharo' }
** >> raisedTo: aNumber [
	<PharoGs>
    ^self _asFixedPoint raisedTo: aNumber

]

{ #category : 'forward to Pharo' }
** >> raisedToFraction: aFraction [
	<PharoGs>
    ^self _asFixedPoint raisedToFraction: aFraction

]

{ #category : 'forward to Pharo' }
** >> raisedToInteger: aNumber [
	<PharoGs>
    ^self _asFixedPoint raisedToInteger: aNumber

]

{ #category : 'forward to Pharo' }
** >> reciprocal [
 	<PharoGs>
   ^self _asFixedPoint reciprocal

]

{ #category : 'forward to Pharo' }
** >> round: numberOfWishedDecimal [
 	<PharoGs>
   ^self _asFixedPoint round: numberOfWishedDecimal

]

{ #category : 'forward to Pharo' }
** >> scale [
	<PharoGs>
    ^self _asFixedPoint scale

]

{ #category : 'forward to Pharo' }
** >> setNumerator: n denominator: d scale: s [
	<PharoGs>
    ^self _asFixedPoint setNumerator: n denominator: d scale: s

]

{ #category : 'forward to Pharo' }
** >> sqrt [
	<PharoGs>
    ^self _asFixedPoint sqrt

]

{ #category : 'forward to Pharo' }
** >> squared [
	<PharoGs>
    ^self _asFixedPoint squared

]

{ #category : 'forward to Pharo' }
** >> storeOn: aStream [
	<PharoGs>
    ^self _asFixedPoint storeOn: aStream

]
