$NOMOD51
#include <89c51ic2.inc>

EXTRN CODE (INICIOWAIT)
EXTRN CODE (INICIODETECT)
EXTRN CODE (INICIODISPLAY)
EXTRN CODE (INICIOCHECK)
EXTRN CODE (INICIOREAD)
EXTRN CODE (INICIOPASS1)
EXTRN CODE (INICIOPASS)
EXTRN CODE (WAIT2)
	
	PUBLIC TRINCO
	PUBLIC COD3
	PUBLIC LER
	
	STACK_SEG	SEGMENT	IDATA
	RSEG 	STACK_SEG 		
	STACK:	DS	10h 
		
	BITTRINCO SEGMENT DATA
	RSEG BITTRINCO
	TRINCO: DS 1
		
	BITREMOTE SEGMENT DATA
	RSEG BITREMOTE
	REMOTE: DS 1
	
	LER1 SEGMENT DATA
	RSEG LER1	
	LER: DS 4
		
	COD1 SEGMENT CODE
	RSEG COD1	
	COD: DB 1,2,3,4
	
	COD2 SEGMENT DATA
	RSEG COD2
	COD3:DS 4
	
	CSEG AT 0H
	JMP STARTUP
	
	INICIO1 SEGMENT CODE
	RSEG INICIO1
STARTUP:
	MOV SP,#STACK-1
	MOV TRINCO,#0
COPY:
	MOV R3,#4
	MOV R0,#COD3
	MOV DPTR,#COD
CPY:
	CLR A
	MOVC A,@A+DPTR
	MOV @R0,A
	INC DPTR
	INC R0
	DJNZ R3,CPY
	MOV R3,#3
	
	
INICIO:
	SETB EA
	MOV R6,#0
	MOV REMOTE,#0
ESCOLHE:
	MOV A,REMOTE
	CJNE A,#0,LOCAL1
	MOV R0,#16
	JMP DETECT
LOCAL1:
	MOV R0,#17
DETECT:
	LCALL INICIODISPLAY
	LCALL INICIODETECT
	USING 0
	PUSH AR0
	MOV R0,#1
	LCALL INICIOWAIT
	POP AR0
	CJNE R0,#0,VERIFICABOTOES
	USING 0
	PUSH AR0
	MOV R6,#1
	LCALL INICIOPASS1
	CJNE R0,#0,TESTE1
	PUSH AR0
	JMP FIM2
VERIFICABOTOES:
	CJNE R0,#2,ENTER 
	MOV A,REMOTE
	CJNE A,#0,MUDAPARA0
	MOV REMOTE,#1
	JMP ESCOLHE
MUDAPARA0:
	MOV REMOTE,#0
	JMP ESCOLHE
ENTER:
	MOV A,REMOTE
	CJNE A,#1,LOCAL2
	LCALL INICIOPASS1
	JMP TESTE1
LOCAL2:
	MOV R0,#LER
MAIN:
	//CALL ISR_TIM2
	LCALL INICIOPASS // LER PASSWORD LOCALMENTE
	//CLR TR2
	CJNE R0,#0,TESTE1
	JMP FIM2
	

TESTE1:
	MOV R0,#LER
	MOV R1,#COD3
	LCALL INICIOCHECK
	MOV A,R0
	JNZ TRUE
FALSE:
	MOV R0,#11
	DJNZ R3,FIM
	LCALL INICIODISPLAY
	MOV R3,#3
	USING 0
	PUSH AR0
	MOV R0,#15
	LCALL INICIOWAIT
	POP AR0
	JMP FIM2	
	
TRUE:
	CALL WAIT2
	MOV R0,#12 // p�e y no display principal
	MOV R3,#3	

FIM:	
	CALL INICIODISPLAY
	USING 0
	PUSH AR0
	MOV R0,#2
	CALL INICIOWAIT
	POP AR0
	
FIM2:
	MOV R0,#10
	CALL INICIODISPLAY
	JMP INICIO
END
	