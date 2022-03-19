Class {
	#name : #BaselineOfSjmJenga,
	#superclass : #BaselineOf,
	#category : #BaselineOfSjmJenga
}

{ #category : #baseline }
BaselineOfSjmJenga >> baseline: spec [
	
	<baseline>
	spec for: #common do: [
		spec package: 'SjmJenga'
	]
	"spec for: #'common' do: [
	
		spec baseline: 'ExternalProject' with: [
			spec repository: 'github://<organization>/<repository>:main/src' ].
			
		spec package: 'PackageOne'.
		spec package: 'PackageTwo' with: [ 
			spec requires: #( 'ExternalProject' 'PackageOne' ) ]
	]"
]
