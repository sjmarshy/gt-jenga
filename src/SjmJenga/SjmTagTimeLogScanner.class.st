Class {
	#name : #SjmTagTimeLogScanner,
	#superclass : #SmaCCScanner,
	#category : #'SjmJenga-tag-time'
}

{ #category : #generated }
SjmTagTimeLogScanner >> emptySymbolTokenId [

	^ 15
]

{ #category : #generated }
SjmTagTimeLogScanner >> errorTokenId [

	^ 16
]

{ #category : #generated }
SjmTagTimeLogScanner >> scan1 [

	[ 
	self recordMatch: #( 3 ).
	self step.
	currentCharacter == $- ifTrue: [ 
		self step.
		((currentCharacter between: $A and: $Z) or: [ 
			 currentCharacter between: $a and: $z ]) ifTrue: [ ^ self scan1 ].
		^ self reportLastMatch ].
	(currentCharacter between: $A and: $Z) or: [ 
		currentCharacter between: $a and: $z ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SjmTagTimeLogScanner >> scan2 [

	[ 
	self step.
	currentCharacter == $] ifTrue: [ 
		[ 
		self recordMatch: #( 4 ).
		self step.
		currentCharacter == $] ] whileTrue.
		^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
SjmTagTimeLogScanner >> scanForToken [

	self step.
	currentCharacter == Character lf ifTrue: [ 
		self recordMatch: #( 2 5 ).
		self step.
		(currentCharacter isSeparator or: [ 
			 currentCharacter == Character pageUp ]) ifTrue: [ 
			[ 
			self recordMatch: #( 2 ).
			self step.
			currentCharacter isSeparator or: [ 
				currentCharacter == Character pageUp ] ] whileTrue ].
		^ self reportLastMatch ].
	currentCharacter == $[ ifTrue: [ 
		self step.
		^ self scan2 ].
	currentCharacter isDigit ifTrue: [ 
		[ 
		self recordMatch: #( 1 ).
		self step.
		currentCharacter isDigit ] whileTrue.
		^ self reportLastMatch ].
	((currentCharacter between: $A and: $Z) or: [ 
		 currentCharacter between: $a and: $z ]) ifTrue: [ ^ self scan1 ].
	(currentCharacter isSeparator or: [ 
		 currentCharacter == Character pageUp ]) ifTrue: [ 
		[ 
		self recordMatch: #( 2 ).
		self step.
		currentCharacter isSeparator or: [ 
			currentCharacter == Character pageUp ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SjmTagTimeLogScanner >> tokenActions [

	^ #( nil #whitespace )
]
