Extension { #name : 'Symbol' }

{ #category : 'instance creation' }
Symbol class >> lookup: aStringOrSymbol [

    <PharoGs>
    ^self @env0:_existingWithAll: aStringOrSymbol

]

{ #category : 'system primitives' }
Symbol >> flushCache [
	"Tell the virtual machine to remove all entries with this symbol as a selector
    from its method lookup caches, if it has any.
    This must be done whenever a method is added, redefined or removed,
    so that message lookups reflect the revised organization.  c.f.
    Behavior>>flushCache & CompiledMethod>>flushCache.
    Essential. See MethodDictionary class comment."
    <PharoGs>

    "GemStone handles this automatically"

]
