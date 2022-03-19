Class {
	#name : #SjmTagTimeOutput,
	#superclass : #Object,
	#instVars : [
		'tags'
	],
	#category : #'SjmJenga-cli'
}

{ #category : #accessing }
SjmTagTimeOutput >> fromRawOutput: aString [
	| pieIx |
	pieIx := aString findString: 'PIE'.
	tags := (aString copyFrom: pieIx + 4 to: (aString size)) trimBoth.
	tags := tags splitOn: Character lf.
	tags := tags collect: [:item | SjmTagTimeTag fromString: item  ].
	^ self
]

{ #category : #accessing }
SjmTagTimeOutput >> gtPieChart: aView [
	<gtView>
	^ aView explicit
          title: 'Dashboard' translated;
          priority: 1;
          stencil: [ 
          	
          	| pingCount angles fromAngle chart centerLabel |
          	pingCount := (tags collect: [:el | el count]) sum.
          	angles := tags collect: [:el | el -> ((el count / pingCount) * 360) ].
          	fromAngle := 0.

				chart := BlElement new
				size: 700@700.
				
			centerLabel := BlElement new relocate: 300@300.
			
			angles do: [:el |
				| start end sec label element |
				start := fromAngle.
				end := fromAngle + el value.
				sec := BlAnnulusSector new 
					startAngle: start;
					endAngle: end;
					innerRadius: 0.5.
		
				label := BlTextElement new text: (el key name) asRopedText.
				label relocate: 300@300.
				
				fromAngle := el value + fromAngle.
				
				element := BlElement new
					background: (BlColorPaint color: Color random);
					size: 400@400;
					geometry: sec.
					
				element relocate: 100@100.
				
				(element addEventHandlerOn: BlMouseEnterEvent do: [ chart addChild: label as:#centerLabel ]).
				
				(element addEventHandlerOn: BlMouseLeaveEvent do: [ chart removeChildNamed: #centerLabel]).
				
				chart addChild: element.
			].

			^ chart.
           ]
]

{ #category : #accessing }
SjmTagTimeOutput >> tags [
	^ tags
]
