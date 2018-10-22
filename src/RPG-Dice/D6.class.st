Class {
	#name : #D6,
	#superclass : #Die,
	#category : #'RPG-Dice'
}

{ #category : #initialization }
D6 >> initialize [ 
	super initialize.
	facets := 6.
	criticalFailThreshold := nil.
	criticalSuccessThreshold := nil
]
