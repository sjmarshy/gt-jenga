Class {
	#name : #SjmTagTimeTag,
	#superclass : #Object,
	#instVars : [
		'name',
		'count',
		'totalTime'
	],
	#category : #'SjmJenga-cli'
}

{ #category : #accessing }
SjmTagTimeTag class >> fromString: aString [
	"produce a FnTagTimeTag from a single line of output of FnTagTime"
	| col |
	col := aString trim splitOn: Character space.
	
	^ self new 
		name: (col at: 1);
		count: (col at: 2) asInteger;
		totalTime: (Duration fromTagTimePieTimeString: (col at: 6));
		yourself.
	
]

{ #category : #accessing }
SjmTagTimeTag >> count [
	^ count
]

{ #category : #accessing }
SjmTagTimeTag >> count: aString [
	count := aString
]

{ #category : #accessing }
SjmTagTimeTag >> name [
	^ name
]

{ #category : #accessing }
SjmTagTimeTag >> name: aString [
	name := aString
]

{ #category : #accessing }
SjmTagTimeTag >> totalTime: aDuration [
	totalTime := aDuration
]
