Class {
	#name : #D100,
	#superclass : #Die,
	#category : #'RPG-Dice'
}

{ #category : #initialization }
D100 >> initialize [ 
	super initialize.
	facets := 100.
	criticalFailThreshold := 96.
	criticalSuccessThreshold := 5
]
