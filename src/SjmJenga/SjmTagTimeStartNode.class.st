Class {
	#name : #SjmTagTimeStartNode,
	#superclass : #SmaCCParseNode,
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
SjmTagTimeStartNode >> acceptVisitor: aStartVisitor [

	^ aStartVisitor visitStart: self
]
