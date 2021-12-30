#include<89c51ic2.inc>

CSEG AT 0H
	LJMP MAIN

CSEG AT 03H
	LJMP CONFIGT2

CSEG AT 0BH
	LJMP LUZ
	
CSEG AT 13H
	LJMP TESTEVEL
	
BSEG AT 9H
	EXCESSO: DBIT 1

CSEG AT 30H
	
MAIN:
	MOV TMOD,#01H
	MOV TH0,#HIGH(-10000)
	MOV TL0,#LOW(-10000)
	MOV R6,#150
	MOV R5,#150
	MOV R4,#10
	MOV TCON,#5
	SETB EA
	SETB ET0
	SETB TR0
	SETB EX0
	SETB EX1
	
LOOP:
	JMP $
			
LUZ:
	JB EXCESSO,VERMELHO
	JMP AMARELO
		
AMARELO:
	DJNZ R6,OUT
	CPL P1.1
	MOV R6,#150
OUT:
	CLR TF0
	MOV TH0,#HIGH(-10000)
	MOV TL0,#LOW(-10000)
	RETI
		
	
VERMELHO:
	SETB 	P1.1
	CLR 	P1.0
	DJNZ 	R5,OUT
	MOV 	R5,#150
	DJNZ 	R4,OUT
	MOV 	R4,#10
	CLR 	EXCESSO
	SETB 	P1.0
	CLR 	P1.1
	JMP 	OUT
	
CONFIGT2:
	MOV T2CON,#04H
	MOV TH2,#HIGH(-10000)
	MOV TL2,#LOW(-10000)
	MOV RCAP2H,#HIGH(-10000)
	MOV RCAP2L,#LOW(-10000)
	SETB TR2
	CLR IE0
	RETI
	
TESTEVEL:	
	CLR TR2
	JB TF2,NOTWASTED
	SETB EXCESSO
	
NOTWASTED:
	CLR TR2
	CLR TF2
	CLR IE1
	RETI

END