	NAME MAIN
#include <89C51rx2.inc>

	EXTRN		CODE	(INICIOH2A)
	N_LOOPS		EQU		5		
	
	CSEG		AT 	0H			
	LJMP		START			

	CSEG 		AT 30H				
START:
	MOV 	20H,#05H
	MOV 	21H,#08H
	MOV 	22H,#0AH
	MOV 	23H,#0EH
	MOV 	24H,#07H
	
	MOV 	R2,#N_LOOPS
	MOV 	R0,#20H
	MOV 	R1,#8H
	Mov		DPTR,#MESSAGE
	MOV		R2,#N_LOOPS
	
LOOP:
	CLR 	A
	MOVC	A,@A+DPTR
	MOV 	A,@R0
	PUSH	ACC				
	LCALL	INICIOH2A	
	MOV		A,B				
	MOVX	@R1,A			
	POP		ACC								
	INC		DPTR
	INC     R0
	INC     R1
	DJNZ	R2,LOOP			
	SJMP	$	

;declarar que estao a partir desse endereco
	CSEG AT 1000H

MESSAGE:
		DB	10,7,12,3,15,10,15,14,8,7,0

END



;Qual o objectivo de desenvolver este programa em dois m�dulos?
;Diminui o tempo de execu��o; o programa fica mais leve em compara��o se fosse feito apenas num m�dulo.

;As directivas para liga��o do programa utilizam-se quando o programa a desenvolver se encontra distribu�do por v�rios m�dulos.
;Como os m�dulos necessitam de partilhar informa��o torna-se necess�rio identificar a origem da informa��o (quando externa) 
;ou qual a informa��o que vai ser partilhada.

;PUBLIC: Lista os s�mbolos que podem ser usados por outros m�dulos; exporta um s�mbolo, neste caso m�dulo H2A

;EXTRN: Lista os s�mbolos referidos no m�dulo corrente e definidos noutro m�dulo; usa um s�mbolo, neste caso m�dulo MAIN

;SEGMENT: Define um segmento.

;RSEG: Selec��o de um segmento.

;NAME:Especifica o nome do m�dulo objecto gerado pelo programa.

;Qual o endere�o na mem�ria de c�digo das etiquetas:
;BA3_NAO: C:0x000c
;FIM_H2A: C:0x00012

;Os ficheiros '.lst' contem os codigos maquina e assembly e os respectivos endere�os no c�digo.

;O objectivo de incluir a linha: #include<89C51Rx2.inc> �: incluir a biblioteca.

;O ficheiro com extens�o '.M51' contem os endere�os das etiquetas, enderecos de outras intrucoes...