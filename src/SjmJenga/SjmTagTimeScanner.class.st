Class {
	#name : #SjmTagTimeScanner,
	#superclass : #SmaCCScanner,
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
SjmTagTimeScanner >> emptySymbolTokenId [

	^ 15
]

{ #category : #generated }
SjmTagTimeScanner >> errorTokenId [

	^ 16
]

{ #category : #generated }
SjmTagTimeScanner >> scan1 [

	[ 
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $- ifTrue: [ ^ self scan2 ].
	currentCharacter == $" or: [ 
		(currentCharacter between: $0 and: $:) or: [ 
			(currentCharacter between: $A and: $Z) or: [ 
				currentCharacter between: $a and: $z ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SjmTagTimeScanner >> scan2 [

	self step.
	(currentCharacter == $" or: [ 
		 (currentCharacter between: $0 and: $:) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter between: $a and: $z ] ] ]) ifTrue: [ 
		^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
SjmTagTimeScanner >> scanForToken [

	self step.
	currentCharacter == $[ ifTrue: [ 
		self step.
		currentCharacter ~~ $] ifTrue: [ 
			[ 
			self step.
			currentCharacter == $] ifTrue: [ 
				^ self recordAndReportMatch: #( 4 ) ].
			true ] whileTrue ].
		^ self reportLastMatch ].
	(currentCharacter between: $0 and: $9) ifTrue: [ 
		[ 
		self recordMatch: #( 1 3 ).
		self step.
		currentCharacter == $- ifTrue: [ ^ self scan2 ].
		currentCharacter between: $0 and: $9 ] whileTrue.
		(('":' includes: currentCharacter) or: [ 
			 (currentCharacter between: $A and: $Z) or: [ 
				 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan1 ].
		^ self reportLastMatch ].
	(currentCharacter isSeparator or: [ 
		 currentCharacter == Character pageUp ]) ifTrue: [ 
		[ 
		self recordMatch: #( 2 ).
		self step.
		currentCharacter isSeparator or: [ 
			currentCharacter == Character pageUp ] ] whileTrue.
		^ self reportLastMatch ].
	(('":' includes: currentCharacter) or: [ 
		 (currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ] ]) ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
SjmTagTimeScanner >> tokenActions [

	^ #( nil #whitespace )
]
