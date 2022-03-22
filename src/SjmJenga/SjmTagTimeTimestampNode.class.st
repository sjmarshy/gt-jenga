Class {
	#name : #SjmTagTimeTimestampNode,
	#superclass : #SjmTagTimeStartNode,
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
SjmTagTimeTimestampNode >> acceptVisitor: aStartVisitor [

	^ aStartVisitor visitTimestamp: self
]
