Trait {
	#name : #TSjmTagTimeStartNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
TSjmTagTimeStartNodeVisitor >> visitStart: aStart [

	^ self visitSmaCCParseNode: aStart
]
