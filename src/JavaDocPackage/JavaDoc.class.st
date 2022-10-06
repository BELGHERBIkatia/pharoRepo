Class {
	#name : #JavaDoc,
	#superclass : #Object,
	#category : #JavaDocPackage
}

{ #category : #'instance creation' }
JavaDoc >> for: aClass [ 
| strm methodNames file filename  varInstanceName subclasses|
filename := aClass printString .
varInstanceName:=aClass   instVarNames flatCollect:[:each|' ', each,' '] .
subclasses :=aClass   subclasses  flatCollect:[:each|' ', each,' '] .
methodNames := aClass methods   .
strm := String streamContents: [ :stream |
		stream 
			nextPutAll: 'Classe : ';
			nextPutAll: aClass printString;
			nextPutAll: '.';
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Package : ';
			nextPutAll: aClass package  printString;
			nextPutAll: '.';
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Super classe : ';
			nextPutAll: aClass superclass printString;
			nextPutAll: '.';
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Sub-classes : ';
			nextPutAll:  subclasses ;
			nextPutAll: '.';
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Nombre de Variables d`instances : ';
			nextPutAll: aClass   instVarNames size  printString;
			nextPutAll: '.';
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Variables d`instances : ';
			nextPutAll:  varInstanceName ;
			nextPutAll: '.';
			nextPut: Character cr;
			nextPut: Character cr;
		
			nextPutAll: 'Methods Name : ';
			nextPutAll: (''join:methodNames  printString) ;
			nextPut: Character cr;
			nextPutAll: '     ';
			nextPut: Character cr ;
			nextPut: Character cr
			].
		file := (filename asString,'.txt') asFileReference.
file ensureCreateFile.
file writeStreamDo: [ :stream | stream nextPutAll: strm   ].
	^ file.

]
