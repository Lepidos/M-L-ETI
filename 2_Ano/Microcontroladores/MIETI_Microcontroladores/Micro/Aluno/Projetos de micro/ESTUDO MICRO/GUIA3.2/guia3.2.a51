$NOMOD51
#include<89c51ic2.inc>

	CSEG AT 0H
		
MAIN:
	MOV R2,#40
	MOV DPTR,#0A000H
	MOV R0,#40H
	MOV R1,#0A0H
	
START:
	MOVX A,@DPTR
	MOV R3,A
	RLC A
	JNC MENOR

MAIOR:
	MOV A,R3
	MOV @R0,A
	INC R0
	INC DPTR
	DJNZ R2,START
	JMP FIM

MENOR:
	MOV A,R3
	MOV @R1,A
	INC R1
	INC DPTR
	DJNZ R2,START
	
FIM:
	END