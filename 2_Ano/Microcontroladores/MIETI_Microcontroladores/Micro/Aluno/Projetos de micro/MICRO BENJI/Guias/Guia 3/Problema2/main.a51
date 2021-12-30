	NAME MAIN
#include <89C51rx2.inc>
	
	N_LOOPS		EQU		6
		
	CSEG		AT 	0H			
	LJMP		MAIN			
	
MAIN:

	
	MOV		R3, #0A0H 			;Serve para guardar os n�os inferiores a 128 (decimal)
	MOV		R4, #40H 			;Serve para guardar os n�os iguais e superiores a 128 (decimal)
	MOV		R5, #N_LOOPS

START:
	
	MOV		DPTR, #0A000H
	
	

CICLO:
	
	MOVX	A, @DPTR
	CLR 	C
	SUBB	A, #128
	ADD		A, #128
	JNC		MAIOR_OU_IGUAL
	MOV		B, R3
	MOV		R0, B
	MOV		@R0, A
	INC		R3
	JMP		INCREMENTAR_DPTR
	
MAIOR_OU_IGUAL:
	
	MOV		B, R4
	MOV		R0, B
	MOV		@R0, A
	INC		R4

INCREMENTAR_DPTR:

	INC		DPTR

LOOP_FIM:

	DJNZ	R5,CICLO
	
	END


;INC DPL DATA POINT PARA O LOW
;INC DPH DATA POINT PARA O HIGH

;Qual o objectivo de desenvolver este programa em dois m�dulos?
;Diminui o tempo de execu��o; o programa fica mais leve em compara��o se fosse feito apenas num m�dulo.

;As directivas para liga��o do programa utilizam-se quando o programa a desenvolver se encontra distribu�do por v�rios m�dulos.
;Como os m�dulos necessitam de partilhar informa��o torna-se necess�rio identificar a origem da informa��o (quando externa) 
;ou qual a informa��o que vai ser partilhada.

;PUBLIC:Lista os s�mbolos que podem ser usados por outros m�dulos; exporta um s�mbolo, neste caso m�dulo H2A
;EXTRN:Lista os s�mbolos referidos no m�dulo corrente e definidos noutro m�dulo; usa um s�mbolo, neste caso m�dulo MAIN
;SEGMENT:Define um segmento.
;RSEG:Selec��o de um segmento.
;NAME:Especifica o nomedo m�dulo objecto gerado pelo programa.

;Qual o endere�o na mem�ria de c�digo das etiquetas:
;BA3_NAO: C:0x080C
;FIM_H2A: C:0x0812

;Os ficheiros '.lst' contem os codigos maquina e assembly e os respectivos endere�os no c�digo.

;O objectivo de incluir a linha: #include<89C51Rx2.inc> �:

;O ficheiro com extens�o '.M51' contem os endere�os das etiquetas.