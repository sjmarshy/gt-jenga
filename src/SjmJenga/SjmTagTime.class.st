Class {
	#name : #SjmTagTime,
	#superclass : #SuGenericUnixCommand,
	#category : #'SjmJenga-cli'
}

{ #category : #accessing }
SjmTagTime class >> last_seven_days: aLogFileString [
	| res |
	res := self new 
		logFile: aLogFileString;
		since: (Duration days: 7);
		yourself.
		
	^ SjmTagTimeOutput new fromRawOutput: res output.
]

{ #category : #accessing }
SjmTagTime >> initialize [
	super initialize.
	template := (MacOSResolver new home / 'repos' / 'TagTime' / 'cntpings', 'pl') pathString, ' -v {logFile} -s {fromDate}'.
	^ self.
	
]

{ #category : #accessing }
SjmTagTime >> logFile: aString [
	self argumentAt: #logFile put: aString.
	^ self
]

{ #category : #accessing }
SjmTagTime >> since: aDuration [
	"a report of time spent from Duration time ago until now"
	|now fromDate|
	now := DateAndTime now.
	fromDate := (now - aDuration) asIso8601.
	self argumentAt: #fromDate put: fromDate.
	^ self
	
]
