Extension { #name : 'MethodDictionary' }

{ #category : 'initialization' }
MethodDictionary class >> compactAllInstances [

    <PharoGsError>
    self @env0:error: 'Not implemented in GemStone'

]

{ #category : 'instance creation' }
MethodDictionary class >> new [

    <PharoGs>
    ^self @env0:new

]

{ #category : 'instance creation' }
MethodDictionary class >> new: numberOfElements [

    <PharoGs>
    ^self @env0:new: numberOfElements

]

{ #category : 'instance creation' }
MethodDictionary class >> newForCapacity: capacity [

    <PharoGs>
    ^self @env0:new: capacity

]

{ #category : 'sizing' }
MethodDictionary class >> sizeFor: numberOfElements [

    <PharoGsError>
    self @env0:error: 'Not implemented in GemStone'

]

{ #category : 'accessing' }
MethodDictionary >> add: anAssociation [

    <PharoGs>
    ^self @env0:at: anAssociation key put: anAssociation value

]

{ #category : 'accessing' }
MethodDictionary >> associationAt: key ifAbsent: aBlock [

    <PharoGsError>
    self @env0:error: 'Not implemented in GemStone'

]

{ #category : 'enumeration' }
MethodDictionary >> associationsDo: aBlock [

    <PharoGs>
    ^self @env0:associationsAsArray do: aBlock

]

{ #category : 'accessing' }
MethodDictionary >> at: key [

    <PharoGs>
    ^self @env0:at: key

]

{ #category : 'accessing' }
MethodDictionary >> at: key ifAbsent: aBlock [

    <PharoGs>
    ^self @env0:at: key ifAbsent: [aBlock @env2:value]

]

{ #category : 'accessing' }
MethodDictionary >> at: key ifPresent: aBlock [

    <PharoGs>
    ^aBlock cull: (self @env0:at: key ifAbsent: [^nil])

]

{ #category : 'accessing' }
MethodDictionary >> at: key put: value [

    <PharoGs>
    ^self @env0:at: key put: value

]

{ #category : 'private' }
MethodDictionary >> compact [

    <PharoGs>
    ^self @env0:_rebuild

]

{ #category : 'private' }
MethodDictionary >> compactWithoutBecome [

    <PharoGs>
    ^self @env0:_rebuild

]

{ #category : 'private' }
MethodDictionary >> fixCollisionsFrom: start [

    <PharoGsError>
    self @env0:error: 'Not implemented in GemStone'

]

{ #category : 'private' }
MethodDictionary >> grow [

    <PharoGs>
    ^self @env0:rebuildIfNeeded

]

{ #category : 'testing' }
MethodDictionary >> includesKey: key [

    <PharoGs>
    ^self @env0:includesKey: key

]

{ #category : 'testing' }
MethodDictionary >> isHealthy [

    <PharoGs>
    ^true

]

{ #category : 'accessing' }
MethodDictionary >> keyAtIdentityValue: value ifAbsent: exceptionBlock [

    <PharoGs>
    ^self @env0:keyAtValue: value ifAbsent: [exceptionBlock @env2:value]

]

{ #category : 'accessing' }
MethodDictionary >> keyAtValue: value ifAbsent: exceptionBlock [

    <PharoGs>
    ^self @env0:keyAtValue: value ifAbsent: [exceptionBlock @env2:value]

]

{ #category : 'accessing' }
MethodDictionary >> keys [

    <PharoGs>
    ^IdentitySet withAll: self @env0:keys @env0:asArray

]

{ #category : 'enumeration' }
MethodDictionary >> keysAndValuesDo: aBlock [

    <PharoGs>
    ^self @env0:keysAndValuesDo: [:eachKey :eachValue |
        aBlock @env2:value: eachKey value: eachValue.
    ]

]

{ #category : 'enumeration' }
MethodDictionary >> keysDo: aBlock [

    <PharoGs>
    ^self @env0:keysDo: [:each |
        aBlock @env2:value: each
    ]

]

{ #category : '*Reflectivity' }
MethodDictionary >> metaLinkOptions [

	<PharoGs>
	^{
	#scanFor: -> #(  #+ optionCompileOnLinkInstallation).
	#at:put: -> #(  #+ optionCompileOnLinkInstallation).
	#metaLinkOptions -> #(  #+ optionCompileOnLinkInstallation)
	}

]

{ #category : 'copying' }
MethodDictionary >> postCopy [

    <PharoGs>
    ^self @env0:postCopy

]

{ #category : 'private' }
MethodDictionary >> rehash [

    <PharoGs>
    ^self @env0:_rebuild

]

{ #category : 'removing' }
MethodDictionary >> removeAll [

    <PharoGs>
    ^self @env0:removeAll

]

{ #category : 'private' }
MethodDictionary >> removeDangerouslyKey: key ifAbsent: aBlock [

    <PharoGs>
    ^self @env0:removeKey: key ifAbsent: [aBlock @env2:value]

]

{ #category : 'removing' }
MethodDictionary >> removeKey: key ifAbsent: errorBlock [

    <PharoGs>
    ^self @env0:removeKey: key ifAbsent: [errorBlock @env2:value]

]

{ #category : 'private' }
MethodDictionary >> scanFor: anObject [

    <PharoGsError>
    self @env0:error: 'Not implemented in GemStone'

]

{ #category : 'private' }
MethodDictionary >> swap: oneIndex with: otherIndex [

    <PharoGsError>
    self @env0:error: 'Not implemented in GemStone'

]

{ #category : 'enumeration' }
MethodDictionary >> valuesDo: aBlock [

    <PharoGs>
    ^self @env0:valuesDo: [:each | aBlock @env2:value: each]

]
