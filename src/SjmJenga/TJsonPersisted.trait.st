Trait {
	#name : #TJsonPersisted,
	#instVars : [
		'persistencePath',
		'id'
	],
	#category : #'SjmJenga-SjmJenga'
}

{ #category : #accessing }
TJsonPersisted >> asDictionary [
	"return the details of this class as a dictionary"
	^ self explicitRequirement.
]

{ #category : #accessing }
TJsonPersisted >> id [
	"create an ID"
	id := UUIDGenerator next.
]

{ #category : #setting }
TJsonPersisted >> id: aUUID [
	id := aUUID.
]

{ #category : #creating }
TJsonPersisted >> loadFromDictionary: aDict [
	"load the details of this class from a dictionary"
	^ self explicitRequirement.
]

{ #category : #creating }
TJsonPersisted >> loadFromFile: aFileReference [
	|dict|
	dict := STONJSON fromString: aFileReference contents.
	self assert: (dict at: #kind) = self class name.
	persistencePath := aFileReference parent.
	id := UUID fromString: (dict at: #id).
	^ self 
		loadFromDictionary: dict;
		yourself.
]

{ #category : #operations }
TJsonPersisted >> persist [
	| dict file |
	persistencePath isNotNil & (id isNotNil) 
		ifFalse: [
			^ Error signal: 'persistancePath and id must be set'
		].
		
	dict := self asDictionary
		at: #kind put: self class name;
		at: #id put: id asString;
		yourself.
		
	file := (persistencePath / (id asString) , 'json').
	
	file isFile ifTrue: [
		file ensureDelete.
	].
	
	file writeStreamDo: [:stream |
		stream nextPutAll:  (NeoJSONWriter toString: dict).
	].	
]

{ #category : #setting }
TJsonPersisted >> persistencePath: aFileRef [
	persistencePath := aFileRef.
]
