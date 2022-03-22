Class {
	#name : #SjmTagTimeLineNode,
	#superclass : #SjmTagTimeStartNode,
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
SjmTagTimeLineNode >> acceptVisitor: aStartVisitor [

	^ aStartVisitor visitLine: self
]
