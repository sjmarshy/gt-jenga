Class {
	#name : #SjmNamed,
	#superclass : #Object,
	#instVars : [
		'persistencePath',
		'id',
		'itemName'
	],
	#category : #SjmJenga
}

{ #category : #accessing }
SjmNamed class >> loadFrom: aFileReference [
	|dict cls|
	dict := STONJSON fromString: aFileReference contents.
	self assert: (dict at: #kind) = self name.
	^ self new 
		id: (UUID fromString: (dict at: #id));
		itemName: (dict at: #itemName);
		persistencePath: aFileReference parent;
		yourself.
	
	
]

{ #category : #private }
SjmNamed >> id: aUuid [
	id := aUuid
]

{ #category : #initialization }
SjmNamed >> initialize [
	id := UUIDGenerator next.
]

{ #category : #setting }
SjmNamed >> itemName: aString [
	itemName := aString.
]

{ #category : #accessing }
SjmNamed >> persist [ 
	"write me to disk at the persistencePath provided"
	(id isNotNil
		& (persistencePath isNotNil)
		& (itemName isNotNil))
		ifTrue: [
			| file json |
			
			file := persistencePath / id asString , 'json'.
			
			json := NeoJSONWriter toString: ((Dictionary newFrom: 
				{ #id -> id asString
				. #itemName -> itemName 
				. #kind -> self class name
				})).
			
			file writeStreamDo: [:stream |
				stream nextPutAll: json
			]
		]
]

{ #category : #setting }
SjmNamed >> persistencePath: aFileReference [
	persistencePath := aFileReference.
]
