Extension { #name : 'WeakRegistry' }

{ #category : 'accessing' }
WeakRegistry class >> default [

    <PharoGs>
    ^(Globals @env0:at: #'SessionTemps') @env0:current
        @env0:at: #'WeakRegistry_Default'
		ifAbsentPut: [self new].

]
