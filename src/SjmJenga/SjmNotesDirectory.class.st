Class {
	#name : #SjmNotesDirectory,
	#superclass : #Object,
	#traits : 'TJsonPersisted',
	#classTraits : 'TJsonPersisted classTrait',
	#instVars : [
		'location'
	],
	#category : #SjmJenga
}

{ #category : #accessing }
SjmNotesDirectory >> asDictionary [
	"return the details of this class as a dictionary"
	^ Dictionary newFrom: { #location -> location }.
]

{ #category : #creating }
SjmNotesDirectory >> loadFromDictionary: aDict [
	"load the details of this class from a dictionary"
	location := (aDict at: #location).
]
