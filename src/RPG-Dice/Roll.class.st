Class {
	#name : #Roll,
	#superclass : #Object,
	#instVars : [
		'result',
		'die'
	],
	#category : #'RPG-Dice'
}

{ #category : #'instance creation' }
Roll class >> from: aDie with: anInteger [
	^ self new 
		die: aDie;
		result: anInteger;
		yourself
]

{ #category : #accessing }
Roll >> die [
	^ die
]

{ #category : #accessing }
Roll >> die: anObject [
	die := anObject
]

{ #category : #accessing }
Roll >> result [
	^ result
]

{ #category : #accessing }
Roll >> result: anInteger [
	result := anInteger
]
