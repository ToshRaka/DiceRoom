Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'facets',
		'threshold',
		'criticalSuccessThreshold',
		'criticalFailThreshold'
	],
	#category : #'RPG-Dice'
}

{ #category : #'as yet unclassified' }
Die class >> facets: anInteger [
	^ self new
		facets: anInteger;
		yourself
]

{ #category : #'as yet unclassified' }
Die class >> roll [
	^ self new roll 
]

{ #category : #'as yet unclassified' }
Die class >> roll: anInteger [
	^ self new roll: anInteger 
]

{ #category : #accessing }
Die >> facets [
	^ facets
]

{ #category : #accessing }
Die >> facets: anInteger [
	facets := anInteger
]

{ #category : #rolling }
Die >> isCriticalFail: anInteger [
	^ criticalFailThreshold isNotNil and: [ anInteger >= criticalFailThreshold ]
]

{ #category : #rolling }
Die >> isCriticalSuccess: anInteger [
	^ criticalSuccessThreshold isNotNil and: [ anInteger <= criticalSuccessThreshold ]
]

{ #category : #rolling }
Die >> roll [
	^ Roll from: self with: facets atRandom
]

{ #category : #rolling }
Die >> roll: anInteger [
	^ (OrderedCollection ofSize: anInteger) collect: [ :each | self roll ]
]

{ #category : #rolling }
Die >> rollCriticalsUnder: anInteger [
	| rand |
	rand := facets atRandom.
	(self isCriticalFail: rand)
		ifTrue: [ ^ CriticalFail from: self with: rand ].
	(self isCriticalSuccess: rand)
		ifTrue: [ ^ CriticalSuccess from: self with: rand ].
	rand <= anInteger
		ifTrue: [ ^ RollSuccess from: self with: rand ].
	^ RollFail from: self with: rand
]

{ #category : #rolling }
Die >> rollOver: anInteger [
	| rand |
	rand := facets atRandom.
	rand >= anInteger
		ifTrue: [ ^ RollFail from: self with: rand ].
	^ RollSuccess from: self with: rand
]

{ #category : #rolling }
Die >> rollUnder: anInteger [
	| rand |
	rand := facets atRandom.
	rand <= anInteger
		ifTrue: [ ^ RollSuccess from: self with: rand ].
	^ RollFail from: self with: rand
]
