Class {
	#name : #SjmTagTimeLogParser,
	#superclass : #SmaCCParser,
	#category : #'SjmJenga-tag-time'
}

{ #category : #'generated-accessing' }
SjmTagTimeLogParser class >> cacheId [
	^'2022-03-22T20:07:16.185866+00:00'
]

{ #category : #generated }
SjmTagTimeLogParser class >> definitionComment [
"%root Program;
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
	: <tag> 
	;
TagList
	: Tag  +
	;
TagLine
	: Timestamp 'timestamp' TagList'tags' RedundantData  'redundant' +
	| Timestamp 'timestamp' RedundantData 'redundant' +
	;
RedundantData
	: <redundantData>
	;
Timestamp
	: <timestamp>
	;"
]

{ #category : #generated }
SjmTagTimeLogParser class >> reduceTable [
^#(
	#(14 1 #liftFirstValue: 451585 false) 
	#(6 1 #liftFirstValue: 186369 false) 
	#(6 2 #liftFirstValue: 186370 false) 
	#(7 1 #liftFirstValue: 240641 false) 
	#(13 1 #liftFirstValue: 414721 false) 
	#(9 1 #liftFirstValue: 269313 false) 
	#(8 1 #liftFirstValue: 258049 false) 
	#(10 2 #liftFirstValue: 279554 false) 
	#(12 1 #liftFirstValue: 382977 false) 
	#(10 3 #liftFirstValue: 279553 false) 
	#(11 1 #liftFirstValue: 327681 false) 
	#(9 2 #liftFirstValue: 269314 false) 
	#(12 2 #liftFirstValue: 382978 false) 
	#(11 2 #liftFirstValue: 327682 false)
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

	^ #( '<timestamp>' '<whitespace>' '<tag>' '<redundantData>'
	     'B e g i n' 'Start' 'Tag' 'TagList' 'Tag  +' 'TagLine' 'RedundantData  ''redundant'' +'
	     'RedundantData ''redundant'' +' 'RedundantData' 'Timestamp'
	     'E O F' 'error' )
]

{ #category : #generated }
SjmTagTimeLogParser class >> symbolTypes [

	^ #( #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken
	     #SmaCCErrorNode )
]

{ #category : #generated }
SjmTagTimeLogParser class >> transitionTable [
^#(
#[1 0 21 0 1 0 13 0 6 0 13 0 10 0 21 0 14] 
#[0 0 6 0 3 0 4] 
#[1 0 21 0 1 0 25 0 10 0 21 0 14 0 0 0 15] 
#[0 0 10 0 1 0 15] 
#[1 0 45 0 3 0 49 0 4 0 45 0 7 0 41 0 8 0 45 0 9 0 49 0 12 0 49 0 13] 
#[0 0 14 0 1 0 15] 
#[0 0 18 0 3 0 4] 
#[0 0 22 0 1 0 4 0 15] 
#[0 0 26 0 3 0 4] 
#[0 0 57 0 4 0 11 0 13] 
#[1 0 65 0 3 0 30 0 4 0 65 0 7] 
#[1 0 34 0 1 0 69 0 4 0 69 0 13 0 34 0 15] 
#[0 0 38 0 1 0 4 0 15] 
#[1 0 42 0 1 0 73 0 4 0 73 0 13 0 42 0 15] 
#[0 0 46 0 1 0 4 0 15] 
#[0 0 50 0 3 0 4] 
#[0 0 54 0 1 0 4 0 15] 
#[0 0 58 0 1 0 4 0 15]
	).
]
