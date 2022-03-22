Class {
	#name : #SjmTagTimeLogParser,
	#superclass : #SmaCCParser,
	#category : #'SjmJenga-tag-time'
}

{ #category : #'generated-accessing' }
SjmTagTimeLogParser class >> cacheId [
	^'2022-03-22T18:23:44.894009+00:00'
]

{ #category : #generated }
SjmTagTimeLogParser class >> definitionComment [
"<timestamp>
	: [0-9]+
	;
<whitespace>
	: \s+
	;
<tag>
	: [a-zA-Z]+(\- [a-zA-Z]+)*
	;
<redundantDate>
	: \[ <isCharacter>+ \]
	;
<eol>
	: \n
	;Start 
	: TagLine +
	;
Tag
	: <tag>
	;
TagList
	: Tag +
	;
TagLine
	: Timestamp TagList RedundantData <eol>
	;
RedundantData
	: <redundantDate>
	;
Timestamp
	: <timestamp>
	;"
]

{ #category : #generated }
SjmTagTimeLogParser class >> reduceTable [
^#(
	#(14 1 #reduceFor: 296961 false) 
	#(7 1 #reduceFor: 146433 false) 
	#(8 1 #reduceFor: 156673 false) 
	#(8 2 #reduceFor: 156674 false) 
	#(9 1 #reduceFor: 169985 false) 
	#(11 1 #reduceFor: 197633 false) 
	#(10 1 #reduceFor: 186369 false) 
	#(13 1 #reduceFor: 260097 false) 
	#(11 2 #reduceFor: 197634 false) 
	#(12 4 #reduceFor: 206849 false)
	).
]

{ #category : #generated }
SjmTagTimeLogParser class >> scannerClass [
	^SjmTagTimeLogScanner
]

{ #category : #generated }
SjmTagTimeLogParser class >> startingStateForStart [

	^ 1
]

{ #category : #generated }
SjmTagTimeLogParser class >> symbolNames [

	^ #( '<timestamp>' '<whitespace>' '<tag>' '<redundantDate>'
	     '<eol>' 'B e g i n' 'Start' 'TagLine +' 'Tag' 'TagList'
	     'Tag +' 'TagLine' 'RedundantData' 'Timestamp' 'E O F' 'error' )
]

{ #category : #generated }
SjmTagTimeLogParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 7 0 17 0 8 0 21 0 12 0 25 0 14] 
#[0 0 6 0 3] 
#[0 0 0 0 15] 
#[1 0 9 0 1 0 29 0 12 0 25 0 14 0 10 0 15] 
#[0 0 14 0 1 0 15] 
#[1 0 33 0 3 0 37 0 9 0 41 0 10 0 45 0 11] 
#[0 0 18 0 1 0 15] 
#[0 0 22 0 3 0 4] 
#[0 0 26 0 3 0 4] 
#[1 0 49 0 4 0 53 0 13] 
#[1 0 33 0 3 0 30 0 4 0 57 0 9] 
#[0 0 34 0 5] 
#[0 0 61 0 5] 
#[0 0 38 0 3 0 4] 
#[0 0 42 0 1 0 15]
	).
]
