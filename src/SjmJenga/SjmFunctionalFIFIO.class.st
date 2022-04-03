"
An exploration of a Functional approach to a First In First Out queue, inspired by [vfoley.xyz on Functional Queues](https://vfoley.xyz/functional-queues/)
"
Class {
	#name : #SjmFunctionalFIFIO,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'SjmJenga-exploration'
}

{ #category : #accessing }
SjmFunctionalFIFIO >> dequeue [
	(state key size = 0)
		ifTrue: [ 
			state := state value reversed -> OrderedCollection new
		].
	^ state key removeAt: 1
	
]

{ #category : #accessing }
SjmFunctionalFIFIO >> enqueue: aValue [ 
	state value addFirst: aValue.
]

{ #category : #accessing }
SjmFunctionalFIFIO >> initialize [
	state := OrderedCollection new -> OrderedCollection new
]

{ #category : #accessing }
SjmFunctionalFIFIO >> size [
	^ state value size + state key size
]
