Class {
	#name : #SjmReadable,
	#superclass : #Object,
	#traits : 'TJsonPersisted',
	#classTraits : 'TJsonPersisted classTrait',
	#instVars : [
		'name',
		'link',
		'status',
		'percentProcessed',
		'percentRead'
	],
	#category : #'SjmJenga-Reading'
}

{ #category : #accessing }
SjmReadable >> asDictionary [
	^ (Dictionary newFrom: 
		{ #name -> name
		. #link -> link 
		. #status -> status
		. #percentRead -> percentRead
		. #percentProcessed -> percentProcessed })
]

{ #category : #accessing }
SjmReadable >> initialize [
	self id.
]

{ #category : #accessing }
SjmReadable >> link: aLink [
	link := aLink
]

{ #category : #creating }
SjmReadable >> loadFromDictionary: aDict [
	"load the details of this class from a dictionary"
	name := (aDict at: #name).
	link := (aDict at: #link).
	status := (aDict at: #status).
	percentProcessed := (aDict at: #percentProcessed).
	percentRead := (aDict at: #percentRead).
	
	^ self.
]

{ #category : #accessing }
SjmReadable >> name: aName [
	name := aName.
]

{ #category : #accessing }
SjmReadable >> percentProcessed: aPercent [ 
	percentProcessed := aPercent.
]

{ #category : #accessing }
SjmReadable >> percentRead: aPercent [
	percentRead := aPercent.
]

{ #category : #setting }
SjmReadable >> persistencePath: aPath [

	persistencePath := aPath.
]

{ #category : #accessing }
SjmReadable >> status: aStatus [ 
	status := aStatus.
]
