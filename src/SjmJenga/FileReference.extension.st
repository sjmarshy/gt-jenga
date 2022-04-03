Extension { #name : #FileReference }

{ #category : #'*SjmJenga' }
FileReference >> sjmLoad [
	| dict |
	dict := STONJSON fromString: self contents.
	self assert: (dict at: #kind) = self class name.
	^ self 
		id: (UUID fromString: (dict at: #id));
		persistencePath: self parent;
		loadFromDictionary: dict;
		yourself.
]
