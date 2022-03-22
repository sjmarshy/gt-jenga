Trait {
	#name : #TSjmTagTimeProgramNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
TSjmTagTimeProgramNodeVisitor >> visitProgram: aProgram [

	^ self visitSmaCCParseNode: aProgram
]
