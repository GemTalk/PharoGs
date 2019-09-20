Class {
	#name : 'AnalyzeFilein',
	#superclass : 'GsFileIn',
	#instVars : [
		'fileName',
		'doitCount',
		'classDefCount',
		'classGenClass',
		'className',
		'classObj',
		'commands',
		'logins',
		'commits',
		'methodCount',
		'chunks',
		'nestedFiles',
		'protected'
	],
	#classVars : [
		'BaseClasses',
		'ClassesDefined',
		'ClassExtension',
		'ClassExtensionClass',
		'Gen',
		'Instance',
		'MyActivePackage',
		'MyPackages',
		'PPackage',
		'Project',
		'SubClassSelectors',
		'SymList'
	],
	#category : nil
}

{ #category : 'private' }
AnalyzeFilein class >> _generateGsOld [
 "Generate the bootstrap .gs files 
  by reading the tonel *.st files produce by   AnalyzeFilein class >> export"
 | repositoryRoot gsSrcRoot platformConfigurationAttributes 
  projectSetDefinition projectSetModification specUrl projectDef
  topazFileNameMap visitor loadedProjectInfo rowanHome |

 SessionTemps current at: #ROWAN_TRACE put: nil . "#gciLogServer "
 (rowanHome := System gemEnvironmentVariable: 'ROWAN_PROJECTS_HOME') ifNil:[
   Error signal: 'ROWAN_PROJECTS_HOME not defined in environment'
 ].
 repositoryRoot := rowanHome ,'/GemStoneKernel' .
 gsSrcRoot :=  repositoryRoot , '/bootstrap' . "where .gs files are written"
 
 platformConfigurationAttributes := { 'common'.  'gemstone' }.

 specUrl := repositoryRoot asFileReference /'rowan'/ 'specs' / 'GemStoneKernel.ston'.
 (projectDef := RwComponentProjectDefinition newForUrl: 'file://', (specUrl pathString))
   packageConvention: 'Rowan' ;
  repositoryRoot: repositoryRoot.

 projectSetDefinition := projectDef read: platformConfigurationAttributes.
 loadedProjectInfo := projectSetDefinition properties at: 
  'loadedProjectInfo' ifAbsent: [ Dictionary new ].
 loadedProjectInfo keysAndValuesDo: [:projectName :projectInfo |
   "install the packageMapSpecs for this load into the specification prior to the load"
   | aProjectDef thePackageMapSpecs |
   aProjectDef := projectSetDefinition projectNamed: projectName ifAbsent: [].
   thePackageMapSpecs := projectInfo at: 'packageMapSpecs' .
   (thePackageMapSpecs at: #defaultSymbolDictName otherwise: nil)
      ifNotNil: [:aName | aProjectDef defaultSymbolDictName: aName ].
   (thePackageMapSpecs at: #defaultUseSessionMethodsForExtensions otherwise: nil)
      ifNotNil: [:boolean | aProjectDef defaultUseSessionMethodsForExtensions: boolean  ].
   (thePackageMapSpecs at: #packageNameToPlatformPropertiesMap otherwise: nil)
      ifNotNil: [:map | aProjectDef packageNameToPlatformPropertiesMap: map ] ].

 projectSetModification := projectSetDefinition compareAgainstBase: RwProjectSetDefinition new.
 topazFileNameMap := Dictionary new.
 projectDef packageNames do: [:packageName |
    "Writing one .gs file per package"
    (topazFileNameMap at: packageName ifAbsentPut: [{}]) add: packageName
  ].
  visitor := RwGsModificationTopazWriterVisitor new
         repositoryRootPath: gsSrcRoot;
         topazFilenamePackageNamesMap: topazFileNameMap;
         excludeClassInitializers ;
         yourself.
  visitor visit: projectSetModification.
  ^true

]

{ #category : 'private' }
AnalyzeFilein class >> adjustSymbolList [
  "Need to commit ; logout ; login   after running this"
  | symList rpt |
  rpt := String new .
  symList := System myUserProfile symbolList .
  { ObsoleteClasses . GsCompilerClasses .
    GemStone_Legacy_Streams . GemStone_Portable_Streams } do:[:dict |
    (symList includesIdentical: dict) ifFalse:[  | ofs |
       ofs := symList indexOfIdentical: Published .
       symList insertObject: dict at: ofs .
       rpt add:'inserted ' , dict name ; lf .
    ].
  ].
  rpt size == 0 ifTrue:[ ^ 'no change'].
  ^ rpt .

]

{ #category : 'private' }
AnalyzeFilein class >> analyze [
  "Loads an instance by analyzing the legacy image directory and
   stores a Rowan representation of the legacy image filein in classVar Project.
   Generates a report of files read in fileinFiles.out, and
   a report of stuff put into Project in generate.out .
   Use  AnalyzeFilein class >> export to export  Project to  rowan *.st tonel files  .
  "
  | inst imageDir base |
  self initialize .
  base := (System gemEnvironmentVariable: 'ARCHBASE') ifNil:[
    Error signal:'ARCHBASE not defined in environment '.
  ].
  imageDir := base , '/image' .
  System gemEnvironmentVariable: 'imageDir' put: imageDir .
  System gemEnvironmentVariable: 'upgradeDir' put: imageDir .
  inst := self fromServerPath: imageDir, '/slowfileinBase.topaz' .
  Instance := inst .
  (GsFile openWriteOnServer: 'fileinFiles.out') 
      nextPutAll: inst report ; close .
  (GsFile openWriteOnServer: 'generate.out')
    nextPutAll: inst generate ; close .  "Project := Rowan representation"
  ^ System commit .

]

{ #category : 'private' }
AnalyzeFilein class >> export [
  Project exportPackages: (RwProjectSetDefinition new"nothing on disk to compare to") .

]

{ #category : 'private' }
AnalyzeFilein class >> fromServerPath: aPath [
  System beginTransaction .
^ self fromServerPath: aPath parentClass: nil .

]

{ #category : 'private' }
AnalyzeFilein class >> fromServerPath: aPath parentClass: pClass [
  | fileStream res expandedPath |
  expandedPath := GsFile _expandFilename: aPath isClient: false .
  fileStream := FileStreamPortable read: expandedPath type: #serverText . 
  [ 
    res := (self _fromStream: fileStream to: nil ) doFileIn_parentClass: pClass
  ] ensure: [fileStream close].
  ^ res

]

{ #category : 'private' }
AnalyzeFilein class >> globalsNumClasses [
  | cnt |
  cnt := 0 .
  Globals valuesDo:[:v | v isBehavior ifTrue:[ cnt := cnt + 1 ]].
  ^ cnt

]

{ #category : 'private' }
AnalyzeFilein class >> initialize [
  | misc |
  BaseClasses ifNil:[ | set |
    set := IdentitySet new .
    { Globals . ObsoleteClasses } do:[:dict |
       dict valuesDo:[:v | v isBehavior ifTrue:[ set add: v ]]].
    BaseClasses := set .
  ].
  SubClassSelectors := IdentitySet withAll:#(
    byteSubclass:classVars:classInstVars:poolDictionaries:inDictionary:
    byteSubclass:classVars:classInstVars:poolDictionaries:inDictionary:options:
    indexableSubclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:
    indexableSubclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:options:
    subclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:
    subclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:newVersionOf:description:options:
    subclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:options:
    _newKernelSubclass:instVarNames:inDictionary:
    _newKernelByteSubclass:classVars:poolDictionaries:inDictionary:options:reservedOop:
    _newKernelIndexableSubclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:options:reservedOop:
    _newKernelSubclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:options:reservedOop:
    _newKernelSubclass:subclassOf:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:options:reservedOop:
    _newKernelByteSubclass:classVars:poolDictionaries:inDictionary:options:reservedOop11:
    _newKernelIndexableSubclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:options:reservedOop11:
    _newKernelSubclass:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:options:reservedOop11:
    _newKernelSubclass:subclassOf:instVarNames:classVars:classInstVars:poolDictionaries:inDictionary:options:reservedOop11:
    ).
  misc := SymbolDictionary new .
  #( GemStone_Install_Stream_Implementation_Status UserGlobals 
     Monticello_Methods 
     Gs_Package_Methods Gs_Package_Globals
     GemStone_MCZ_Install_Stream_Implementation_Status ) 
     do:[:sym | misc at: sym put: nil ].
  SymList := SymbolList withAll: { Globals . ObsoleteClasses . GsCompilerClasses . 
               misc 
               "(GsPackageLibrary packageNamed: #'Monticello_Globals') symbolDict . "
               "((AllUsers userWithId:'CodeLibrarianUser') resolveSymbol:#UserGlobals) value "
               }.
  Gen := false .
  ClassesDefined := nil .
  ClassExtension := nil .
  ClassExtensionClass := nil .
  PPackage := nil .
  Project  := nil .
  Instance := nil .
  MyPackages := StringKeyValueDictionary new .
  MyActivePackage := nil .
  System commit

]

{ #category : 'private' }
AnalyzeFilein class >> methodsInStarCategoriesReport [
  | rpt classes |
  rpt := String new . 
  classes := SortedCollection withAll: BaseClasses sortBlock:[ :a :b | a name <= b name ].
  classes do:[ :cls | | cStr |
    cStr := '' .
    { cls . cls class } do:[:aCls | | meths |
      meths := SortedCollection new .
      aCls categoryNames do:[:cat |
        (cat at:1) == $* ifTrue:[ meths addAll: (  aCls _selectorsInBaseCategory: cat)].
      ].
      meths do:[:sel | rpt add: cls name ; add: ' ' ; add: cStr; add: '>> ' ; add: sel ; lf ].
      cStr := 'class ' .
    ].
  ].
  ^ rpt  

]

{ #category : 'private' }
AnalyzeFilein class >> packageName [
^ PPackage ifNotNil:[ PPackage _isSymbol ifTrue:[ PPackage ] ifFalse:[ PPackage name ]]

]

{ #category : 'private' }
AnalyzeFilein class >> starCategoriesReport [
  | rpt classes |
  rpt := String new .
  classes := SortedCollection withAll: BaseClasses sortBlock:[ :a :b | a name <= b name ].
  classes do:[:cls |
    cls categoryNames do:[:cat | 
      (cat at:1) == $* ifTrue:[ rpt add: cls name ; add: '  '; add: cat; lf ].
    ].
    cls class categoryNames do:[:cat |
      (cat at:1) == $* ifTrue:[ rpt add: cls name ; add: ' class   '; add: cat ; lf ].
    ].
  ].
  ^ rpt

]

{ #category : 'private' }
AnalyzeFilein class >> subclassSels [
  ^ Array withAll:( SortedCollection withAll: SubClassSelectors)

]

{ #category : 'private' }
AnalyzeFilein >> _sendIsLegal [
  ^ false

]

{ #category : 'private' }
AnalyzeFilein >> addPackageNamed: aString [
  MyPackages at: aString put: IdentitySet new .
  MyActivePackage := IdentitySet new .
  MyPackages at: aString put: MyActivePackage .
  ^ Project addPackageNamed: aString .

]

{ #category : 'private' }
AnalyzeFilein >> checkIsClass: clsObj [
  (clsObj isBehavior and:[ classObj isMeta not]) ifFalse:[ Error signal:'bad class'].
  ^ clsObj 

]

{ #category : 'private' }
AnalyzeFilein >> classMethod: aClassName [
  aClassName ifNotNil:[ self setClass: aClassName ].
  self classMethod.

]

{ #category : 'private' }
AnalyzeFilein >> compileWarning: aWarning [
  | msg |
  msg := aWarning asString .
  #( 'not optimized' 
     '#comment: should not be reimplemented'
     '#comment should not be reimplemented' ) do:[:str |
    (msg includesString: str) ifTrue:[ ^ aWarning resume ].
  ].
  Error signal: 'unexpected Warning'.

]

{ #category : 'private' }
AnalyzeFilein >> doCompile: aBlock [
 [ aBlock value ] on: CompileWarning do:[:ex | self compileWarning: ex ].

]

{ #category : 'private' }
AnalyzeFilein >> doFileIn_parentClass: pClass [
  "analyze the file"
  |  path lastSlash prefix excludeDirs |
  path := fileStream gsfile pathName . 
  prefix := '/hood1/users/otisa/Svn/36a/' .
  lastSlash := path indexOfLastByte: $/ codePoint startingAt: path size .
  fileName := path copyFrom: lastSlash + 1 to: path size .

  doitCount := 0 .
  chunks := { } .
  logins := { } .
  commits := { } .
  commands := { } . 
  methodCount := 0 .
  nestedFiles := { } .
  classDefCount := 0 .  
  protected := false .
  className := pClass ifNotNil:[ 
                 pClass name 
               ].
  classObj := pClass  .
  "System gemEnvironmentVariable: 'upgradeDir' put: imageDir ."

  excludeDirs := #( 'cypress/' 'metacello/' 'monticello/' 'ston/' 'tonel/' ) .
  excludeDirs do:[:aDir | 
     (path includesString: aDir) ifTrue:[
        GsFile gciLogServer:'skipping ' , fileName .
        ^ self
     ].
  ]. 
  false ifTrue:[ GsFile gciLogServer:'reading ' , fileName  ].
  false ifTrue:[
    pClass ifNotNil:[
       GsFile gciLogServer:'         parentFile class ', pClass name .
    ].
  ].
  super doFileIn .
  chunks do:[:arr | self reportChunk: arr indent: 1 level: nil.   "check for errors now" ].
  1 to: nestedFiles size do:[:n | | arr fn |
    arr := nestedFiles at:n .
    arr at: 3 put:( self class fromServerPath: (fn := arr at: 2) parentClass: classObj).
  ].  
  ^ self

]

{ #category : 'private' }
AnalyzeFilein >> error: aString [
  Error signal: aString

]

{ #category : 'private' }
AnalyzeFilein >> generate [
  | rpt |
  Gen := true .
  ClassesDefined := IdentitySet new .
  (Project := RwComponentProjectDefinition 
    newForDiskBasedProjectNamed: 'GemStoneKernel')
    packageFormat: 'tonel' ;
    packageConvention: 'Rowan' ; "not RowanHybrid"
    projectHome: '/hood1/users/otisa/Svn/36a/git' "ROWAN_PROJECTS_HOME" .
  PPackage := nil .
  ClassExtensionClass := nil .
  rpt := self report: 1 .
  Gen := false .
  System commit .
  ^ rpt

]

{ #category : 'private' }
AnalyzeFilein >> lookup: aString [
  ^ (SymList resolveSymbol: aString asSymbol) value

]

{ #category : 'private' }
AnalyzeFilein >> method: aClassName [
  aClassName ifNotNil:[ self setClass: aClassName ].
  self method.

]

{ #category : 'private' }
AnalyzeFilein >> packageName [
^ self class packageName

]

{ #category : 'private' }
AnalyzeFilein >> project [
^ Project

]

{ #category : 'private' }
AnalyzeFilein >> report [
^ self report: 1

]

{ #category : 'private' }
AnalyzeFilein >> report: level [
  | rpt indent sz fn |
  rpt := String new .
  fn := fileName .
  indent := level * 3 .
  (Gen and:[level < 4]) ifTrue:[  | str |
    str := String new  . indent timesRepeat:[ str add:$  ]. 
    false ifTrue:[ GsFile gciLogServer: level asString, str , fileName ].
  ].
  rpt add: level asString .  
  indent - 1 timesRepeat:[ rpt add: $  ] . rpt add: $  .
  rpt add: fileName , '  ' ; lf .
  Gen ifTrue:[ 
    level <= 2 ifTrue:[ |  pkg nam |
      "NOTE: package names must match  those in git/GemStoneKernel/rowan/components/Core.ston "
      fn = 'filein1a.topaz' ifTrue:[ pkg := self addPackageNamed: 'Filein1A'].

      fn = 'filein1b.topaz' ifTrue:[ pkg := self addPackageNamed: 'Filein1B'].
      fn = 'filein1c.topaz' ifTrue:[ pkg := self addPackageNamed: 'Filein1C'].
      fn = 'obsolete_classes.topaz' ifTrue:[ nam := 'Filein1D-ObsoleteClasses' .
             MyPackages at: nam put: IdentitySet new .
             pkg := Project addPackageNamed: nam
                withConditions:#('common') 
                gemstoneDefaultSymbolDictionaryForUser: 'SystemUser'->'ObsoleteClasses' ].

      fn = 'compilerClasses.topaz' ifTrue:[  nam := 'Filein1E-CompilerClasses'.
             MyPackages at: nam put: IdentitySet new .
             pkg := Project addPackageNamed: nam 
                withConditions:#('common') 
                gemstoneDefaultSymbolDictionaryForUser: 'SystemUser'->'GsCompilerClasses' ].

      fn = 'filein2a.topaz' ifTrue:[ pkg := self addPackageNamed:'Filein2A'].

      fn = 'filein2c_inits.topaz' ifTrue:[ pkg := self addPackageNamed:'Filein2CInit'].
      fn = 'Streams.topaz' ifTrue:[ pkg := self addPackageNamed:'Filein2Streams'].
      fn = 'filein3classes.topaz' ifTrue:[ pkg := self addPackageNamed:'Filein3A' ].
      fn = 'filein3.topaz' ifTrue:[ pkg := self addPackageNamed:'Filein3B' ].
      fn = 'filein3_inits.topaz' ifTrue:[ pkg := self addPackageNamed:'Filein3Init' ].
      "NOTE: package names must match  those in git/GemStoneKernel/rowan/components/Core.ston "

      pkg ifNotNil:[ rpt add: '  ++++++++++++  Package ' , pkg name ; lf ].
      fn = 'GciLibraryA.gs' ifTrue:[ pkg := #SkipFFI ].
      PPackage := pkg. 
      ClassExtensionClass := nil .
    ].
  ].
  rpt add:'    ', methodCount asString , ' methods  ' .
  logins size > 0 ifTrue:[ 
    level > 2 ifTrue:[ Error signal:'Login not allowed in level' , level].
    rpt add: logins  size asString , '  LOGINS  ' 
  ].
  doitCount size > 0 ifTrue:[ rpt add: doitCount asString , '  doits  ' ].
  commits size > 0 ifTrue:[ rpt add: commits  size asString , '  Commits  ' ].
  classDefCount > 0 ifTrue:[ rpt add: classDefCount asString, ' classDefs  '].
  rpt lf .
  chunks do:[:arr | rpt addAll:( self reportChunk: arr indent: indent level: level) ].
  1 to: nestedFiles size do:[:n | | arr |
    arr := nestedFiles at:n .
    rpt addAll: ((arr at: 3) report: level + 1 )
  ].
  ^ rpt

]

{ #category : 'private' }
AnalyzeFilein >> reportChunk: arr indent: indent level: level [
 | kind |
 kind := arr at: 1 .
 kind == #doit ifTrue:[
   ^ self reportDoit: arr indent: indent level: level
 ] ifFalse:[
   ^ self reportMethod: arr indent: indent level: level
 ].

]

{ #category : 'private' }
AnalyzeFilein >> reportDoit: arr indent: indent level: level [
 | fName lNum clsName src meth sels lits subclassSel indentStr rpt clsObj rcvr |
 rpt := String new .
 indentStr := String new . indent timesRepeat:[ indentStr add: $  ]. indentStr add: $  .
 lNum := arr at: 2 .
 fName := fileName .
 src := arr at: 3 .
 meth := arr at: 4 .
 sels := meth _selectorPool .
 lits := meth literals .
 sels size == 2 ifTrue:[
   sels = (IdentitySet withAll:#( _objectForOop: comment: )) ifTrue:[
     rpt add:'     Ignoring comment:' , fName, ' ',lNum asString  ; lf.
     ^ rpt
   ].
 ].
 sels size == 1 ifTrue:[ | sel |
   sel := sels _at: 1 .
   (sel == #comment: or:[ sel == #category: ]) ifTrue:[
     rcvr := lits at: 1 .
     rcvr class == SymbolAssociation ifTrue:[ 
       rcvr := rcvr value
     ]. 
     rcvr isBehavior ifTrue:[
       rpt add:'     Ignoring ', rcvr name, ' ', sel ; lf.
     ^ rpt .
     ] ifFalse:[
       Error signal:'unrecognized receiver for ', sel .
     ].
   ].
 ].
 subclassSel := sels select:[:aSel | aSel includesString: 'subclass:' ] .
 subclassSel size > 0 ifTrue:[  | scSel |
   subclassSel size > 1 ifTrue:[ GsFile gciLogServer:'  Multiple subclasses'. nil pause ].
   (SubClassSelectors includes: (scSel := subclassSel _at: 1)) ifFalse:[ 
       GsFile gciLogServer:'unrecognized subclass selector '. nil pause 
   ].
   rcvr := lits at: 1 .
   sels size == 1 ifTrue:[ 
     clsName := lits at: 2 .
     clsName _isOneByteString ifFalse:[ clsName := lits at: 1 ]. "rcvr nil"
   ] ifFalse:[ 
     (sels includes: #at: ) ifTrue:[
       (meth _sourceOffsetOfFirstSendOf: #at:) < (meth _sourceOffsetOfFirstSendOf: scSel)
         ifFalse:[ Error signal:'unrecognized form of class creation(2)'].
       clsName := lits at: 3 .
     ] ifFalse:[ | scOfs |
       scOfs := meth _sourceOffsetOfFirstSendOf: scSel .
       sels do:[:aSym | (meth _sourceOffsetOfFirstSendOf: aSym) <= scOfs
                ifTrue:[ 'unrecognized form of class creation(3)']].
       clsName := lits at: 2 .
     ]
   ].
   clsObj := self lookup: clsName .
   clsObj isBehavior ifFalse:[ Error signal:'unrecognized subclass name' ].
   rpt addAll: indentStr, '   classDef: ' , clsName ; lf . 
   classDefCount := classDefCount + 1 .
 ].  
 clsName ifNotNil:[
   self checkIsClass: clsObj .
   (Gen and:[ PPackage ~~ #SkipFFI ])  ifTrue:[ 
     (ClassesDefined includes: clsObj) ifTrue:[ Error signal: clsName, ' already defined']. 
     ClassesDefined add: clsObj . 
     PPackage ifNotNil:[ | def |
       (def := RwClassDefinition
            newForClassNamed: clsName 
            super: (clsObj superclass ifNotNil:[:sup | sup name asString ] ifNil:['nil'])
            category: clsObj category )
        updatePropertiesFromClass: clsObj ;
        _removeSubclassesDisallowed .
        PPackage addClassDefinition: def .
        rpt add: 'created RwClassDefinition for ', clsName asString ; lf .
     ] ifNil:[
        rpt add: 'topaz creates ', clsName asString ; lf.
     ].
     ^ rpt .
   ].
 ] ifNil:[
   (Gen and:[ PPackage ~~ #SkipFFI ])  ifTrue:[  | err |
     PPackage ifNotNil:[
       classDefCount > 0 ifTrue:[
         err := 'doit after classdef ', fName, ' line ' , lNum asString.
       ] ifFalse:[
         err := 'doit in ', PPackage name,' ', fName, ' line ' , lNum asString.
       ].
     ].
     err ifNotNil:[ GsFile gciLogServer: err . nil pause ].
   ].
 ].
 ^ rpt

]

{ #category : 'private' }
AnalyzeFilein >> reportMethod: arr indent: indent level: level [
 | fName lNum kind categ clsObj src rwExt rpt meth sel gen |
 kind := arr at: 1 . lNum := arr at: 2 . categ := arr at: 3 .
 clsObj := arr at: 4 . src := arr at: 5 . meth := arr at: 6 .
 rpt := String new .
 fName := fileName .
 gen := (Gen and:[ PPackage ~~ #SkipFFI ]) .
 [
   gen ifTrue:[ rwExt := self rwExtensionForClass: clsObj report: rpt ].
   kind == #specialmethod ifTrue:[
     sel := meth .
     gen ifTrue:[
       meth := RwMethodDefinition newForSelector: sel protocol: categ source: src.
       rwExt addInstanceMethodDefinition: meth .
     ].
   ].
   kind == #method ifTrue:[
     sel := meth selector .
     gen ifTrue:[ 
       [ rwExt addInstanceMethod: src protocol: categ 
       ] on: CompileWarning do:[:ex | self compileWarning: ex ] .
     ].
   ].
   kind == #classmethod ifTrue:[
     sel := meth selector .
     gen ifTrue:[ rwExt addClassMethod: src protocol: categ ].
     sel == #initialize ifTrue:[
       rpt add: clsObj name,' class >> initialize'; lf 
     ].
   ].
   sel ifNil:[ Error signal:'bad method kind ' , kind asString ].
 ] on: Error do:[:ex | 
   "help with debugging duplicate defs"
   fName size .  lNum size . arr size .  "make referenced from VC"
   (ex messageText at: 1 equals: 'Duplicate definition') ifTrue:[ 
      GsFile gciLogServer: ex messageText .
      nil pause . ex resume 
   ].
   ex pass .
 ].
 false ifTrue:[
   rpt add: '      ' , clsObj name .
   kind == #classmethod ifTrue:[ rpt add:' class'].
   rpt add: ' >> ' ; add: sel .
   true  ifTrue:[ GsFile gciLogServer: rpt ].
 ].
 ^ rpt

]

{ #category : 'private' }
AnalyzeFilein >> rwExtensionForClass: clsObj report: rpt [ 
 | nam |
 clsObj ifNil:[ Error signal:'clsObj arg is nil'].
 nam := clsObj name .
 ClassExtensionClass == clsObj ifFalse:[
    PPackage ifNil:[ Error signal:'No active Package' ].
    ClassExtension := PPackage classExtensionDefinitionNamed: nam 
	      ifAbsent: [ 
           true ifTrue:[ rpt add: 'creating class extension ', nam; lf ].
           MyActivePackage add: clsObj .
           PPackage addClassExtensionDefinition: 
                   (RwClassExtensionDefinition newForClassNamed: nam) 
        ].
    ClassExtensionClass := clsObj .
 ].
 ^ ClassExtension

]
