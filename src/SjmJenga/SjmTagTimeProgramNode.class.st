Class {
	#name : #SjmTagTimeProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
SjmTagTimeProgramNode >> acceptVisitor: aProgramVisitor [

	^ aProgramVisitor visitProgram: self
]
