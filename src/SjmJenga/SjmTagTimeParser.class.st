Class {
	#name : #SjmTagTimeParser,
	#superclass : #SmaCCParser,
	#category : #'SjmJenga-tag-time'
}

{ #category : #'generated-accessing' }
SjmTagTimeParser class >> cacheId [
	^'2022-03-22T21:06:33.041683+00:00'
]

{ #category : #generated }
SjmTagTimeParser class >> definitionComment [
"%start Start;
%prefix SjmTagTime;
%suffix Node;<timestamp>
	: [0-9]+
	;
<whitespace>
	: \s+
	;
<tag>
	: [a-zA-Z0-9:""]+(\- [a-zA-Z0-9:""]+)*
	;
<redundantData>
	: \[ ([^\]])+ \]
	;
Start 
	: TagLine 'line'
	| Start TagLine 'line' 
	;
Tag
	: <tag> {{Tag}}
	;
TagList
	: Tag  + {{}}
	;
TagLine
	: Timestamp 'timestamp' TagList'tags' RedundantData  'redundant' + {{Line}}
	| Timestamp 'timestamp' RedundantData 'redundant' + {{Line}}
	;
RedundantData
	: <redundantData> {{RedundantData}}
	;
Timestamp
	: <timestamp> {{Timestamp}}
	;"
]

{ #category : #generated }
SjmTagTimeParser class >> reduceTable [
^#(
	#(14 1 #reduceFor: 498689 false) 
	#(6 1 #reduceFor: 184321 false) 
	#(6 2 #reduceFor: 184322 false) 
	#(7 1 #reduceFor: 238593 false) 
	#(13 1 #reduceFor: 443393 false) 
	#(9 1 #reduceFor: 274433 false) 
	#(8 1 #reduceFor: 263169 false) 
	#(10 2 #reduceFor: 289794 false) 
	#(12 1 #reduceFor: 402433 false) 
	#(10 3 #reduceFor: 289793 false) 
	#(11 1 #reduceFor: 337921 false) 
	#(9 2 #reduceFor: 274434 false) 
	#(12 2 #reduceFor: 402434 false) 
	#(11 2 #reduceFor: 337922 false)
	).
]

{ #category : #generated }
SjmTagTimeParser class >> scannerClass [
	^SjmTagTimeScanner
]

{ #category : #generated }
SjmTagTimeParser class >> startingStateForStart [

	^ 1
]

{ #category : #generated }
SjmTagTimeParser class >> symbolNames [

	^ #( '<timestamp>' '<whitespace>' '<tag>' '<redundantData>'
	     'B e g i n' 'Start' 'Tag' 'TagList' 'Tag  +' 'TagLine' 'RedundantData  ''redundant'' +'
	     'RedundantData ''redundant'' +' 'RedundantData' 'Timestamp'
	     'E O F' 'error' )
]

{ #category : #generated }
SjmTagTimeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 6 0 17 0 10 0 21 0 14] 
#[0 0 6 0 3 0 4] 
#[1 0 9 0 1 0 25 0 10 0 21 0 14 0 0 0 15] 
#[0 0 10 0 1 0 15] 
#[1 0 29 0 3 0 33 0 4 0 37 0 7 0 41 0 8 0 45 0 9 0 49 0 12 0 53 0 13] 
#[0 0 14 0 1 0 15] 
#[0 0 18 0 3 0 4] 
#[0 0 22 0 1 0 4 0 15] 
#[0 0 26 0 3 0 4] 
#[1 0 33 0 4 0 57 0 11 0 61 0 13] 
#[1 0 29 0 3 0 30 0 4 0 65 0 7] 
#[1 0 34 0 1 0 33 0 4 0 69 0 13 0 34 0 15] 
#[0 0 38 0 1 0 4 0 15] 
#[1 0 42 0 1 0 33 0 4 0 73 0 13 0 42 0 15] 
#[0 0 46 0 1 0 4 0 15] 
#[0 0 50 0 3 0 4] 
#[0 0 54 0 1 0 4 0 15] 
#[0 0 58 0 1 0 4 0 15]
	).
]
