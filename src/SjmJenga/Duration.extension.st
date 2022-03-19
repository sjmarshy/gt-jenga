Extension { #name : #Duration }

{ #category : #'*SjmJenga' }
Duration >> fromTagTimePieTimeString: aString [
	| col hours mins secs |
	
	col := aString copyFrom: 2 to: (aString size - 1).
	
	(col anySatisfy: [:i | i = $h])
		ifTrue: [ 
			col := col splitOn: 'h'.
	
			hours := (col at: 1) asInteger.
			col := (col at: 2) splitOn: ':'.
			
			mins := (col at: 1) asInteger.
			secs := (col at: 2) asInteger.
			
			^ Duration days: 0 hours: hours minutes: mins seconds: secs
		]
		ifFalse: [
			col := col splitOn: ':'.
			
			mins := (col at: 1) asInteger.
			secs := (col at: 2) asInteger.
			
			^ Duration days: 0 hours: 0 minutes: mins seconds: secs
		].
]
