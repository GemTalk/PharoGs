set compile_env: 2

category: 'lookups'
classmethod: NetNameResolver
addressForName: hostName timeout: secs
	"Look up the given host name and return its address. Return nil if the address is not found in the given number of seconds."
	"NetNameResolver addressForName: 'create.ucsb.edu' timeout: 30"
	"NetNameResolver addressForName: '100000jobs.de' timeout: 30"
	"NetNameResolver addressForName: '1.7.6.4' timeout: 30"
	"NetNameResolver addressForName: '' timeout: 30"

	<PharoGs>
	| address delayProc lookupProc semaphore |
	semaphore := Semaphore new.
	lookupProc := [
		| bytes string |
		string := GsSocket @env0:getHostAddressByName: hostName.
		bytes := (Globals @env0:at: #'ByteArray') 
			@env0:withAll: ((string @env0:subStrings: $.) 
				@env0:collect: [:each | each @env0:asNumber]).
		address := bytes asSocketAddress.
		semaphore signal.
	] fork.
	delayProc := [
		(Delay forSeconds: secs) wait.
		semaphore signal.
	] fork.
	semaphore wait.
	lookupProc terminate.
	delayProc terminate.
	^address
%

category: 'network initialization'
classmethod: NetNameResolver
initializeNetwork
	"Things are already set up in GemStone"

	<PharoGs>
%

category: 'testing'
classmethod: NetNameResolver
isConnected
	"Things are already set up in GemStone"

	<PharoGs>
	^true
%

category: 'lookups'
classmethod: NetNameResolver
localHostName

	<PharoGs>
	^GsSocket @env0:getLocalHostName
%

category: 'primitives'
classmethod: NetNameResolver
primAbortLookup 
	"Abort the current lookup operation, freeing the name resolver for the next query." 

	<PharoGs> 
%

category: 'primitives'
classmethod: NetNameResolver
primAddressLookupResult 
	"Return the host name found by the last host address lookup. Returns nil if the last lookup was unsuccessful." 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetAddressInfoFamily 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetAddressInfoHost: hostName service: servName flags: flags family: family type: type protocol: protocol 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetAddressInfoNext 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetAddressInfoProtocol 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetAddressInfoResult: socketAddress 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetAddressInfoSize 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetAddressInfoType 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetNameInfoHostResult: aString 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetNameInfoHostSize 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetNameInfoServiceResult: aString 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primGetNameInfoServiceSize 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primHostNameResult: aString 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primHostNameSize 

	<PharoGsError> 
    ^self _gsError
%

category: 'network initialization'
classmethod: NetNameResolver
primInitializeNetwork: resolverSemaIndex 
	"Initialize the network drivers on platforms that need it, such as the Macintosh, and return nil if network initialization failed or the reciever if it succeeds. Since mobile computers may not always be connected to a network, this method should NOT be called automatically at startup time; rather, it should be called when first starting a networking application. It is a noop if the network driver has already been initialized. If non-zero, resolverSemaIndex is the index of a VM semaphore to be associated with the network name resolver. This semaphore will be signalled when the resolver status changes, such as when a name lookup query is completed." 
	"Note: some platforms (e.g., Mac) only allow only one name lookup query at a time, so a manager process should be used to serialize resolver lookup requests." 

	<PharoGs> 
    ^self
%

category: 'primitives'
classmethod: NetNameResolver
primLocalAddress 
	"Return the local address of this host." 

	<PharoGs> 
    ^#[0 0 0 0]
%

category: 'primitives'
classmethod: NetNameResolver
primNameLookupResult 
	"Return the host address found by the last host name lookup. Returns nil if the last lookup was unsuccessful." 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primNameResolverError 
	"Return an integer reflecting the error status of the last network name resolver request. Zero means no error." 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primNameResolverStatus 
	"Return an integer reflecting the status of the network name resolver. For a list of possible values, see the comment in the 'initialize' method of this class." 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primStartLookupOfAddress: hostAddr 
	"Look up the given host address in the Domain Name Server to find its name. This call is asynchronous. To get the results, wait for it to complete or time out and then use primAddressLookupResult." 

	<PharoGsError> 
    ^self _gsError
%

category: 'primitives'
classmethod: NetNameResolver
primStartLookupOfName: hostName 
	"Look up the given host name in the Domain Name Server to find its address. This call is asynchronous. To get the results, wait for it to complete or time out and then use primNameLookupResult." 

	<PharoGsError> 
    ^self _gsError
%

set compile_env: 0
