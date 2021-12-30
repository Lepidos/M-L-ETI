CSEG	AT	0H

LJMP MAIN

CSEG 	AT 30H
MAIN:
	MOV 	R2,#0H
	MOV 	R3,#0H
	MOV 	R4,#0H
	MOV 	A,R0
	MOV 	R5,A
	INC 	R0

LOOP:
	CJNE 	R1,#0H,TESTA
	JMP $

TESTA:
	MOV 	A,@R0
	INC 	R0
	INC 	R0
	JB 		ACC.7,NEGATIVO
	CJNE 	A,#0H,POSITIVO
	MOV 	A,R5
	MOV 	R0,A
	MOV 	A,@R0
	CJNE 	A,#0H,POSITIVO
	INC 	R3
	JMP 	SEMI
	
NEGATIVO:
	INC 	R2
	JMP 	SEMI
	
POSITIVO:
	INC 	R4
	JMP SEMI

SEMI:
	INC 	R5
	INC 	R5
	DEC		R1
	JMP 	LOOP
	
	
END
