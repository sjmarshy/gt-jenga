Class {
	#name : #SjmTagTimeTagNode,
	#superclass : #SjmTagTimeStartNode,
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
SjmTagTimeTagNode >> acceptVisitor: aStartVisitor [

	^ aStartVisitor visitTag: self
]
