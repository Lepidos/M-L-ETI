NAME MAIN
;#include <89C51rx2.inc>

	EXTRN		CODE	(INICIOH2A)
	NO_LOOPS	EQU		5		
	
	CSEG		AT 	0H			
	LJMP		START			
	
	CSEG 		AT 30H				
START:
	MOV		20H,#05H
	MOV		21H,#08H
	MOV		22H,#0AH
	MOV		23H,#0EH
	MOV		24H,#07H
	
	MOV		R2,#NO_LOOPS
	MOV		R0,#20H
	MOV		R1,#8H
LOOP:
	MOV		A,@R0
	PUSH	ACC				
	LCALL	INICIOH2A		
	MOV		A,B				
	MOVX	@R1,A			
	POP		ACC				
	INC		R0				
	INC		R1				
	DJNZ	R2,LOOP			
	SJMP	$				
END

; O objectivo de fazer um programa em dois modulos � a diminui��o do tempo de execu��o
; tambem a diminui��o do peso do programa em compara��o se fosse feito num s� modulo

; PUBLIC 	= Lista os s�mbolos que podem ser usados por outros m�dulos
; EXTRN 	= Lista os s�mbolos referidos no m�dulo corrente e definidos noutro m�dulo
; SEGMENT 	= Define um segmento
; RSEG 		= Selec��o de um segmento

; endere�o na mem�ria de c�digo das etiquetas BA3_NAO = c:0x080C
; endere�o na mem�ria de c�digo das etiquetas FIM_H2A = c:0x0812

; tens os codigos maquina e assembley e os respectivos endere�os no c�digo

; 

; tem os endere�os das etiquetas