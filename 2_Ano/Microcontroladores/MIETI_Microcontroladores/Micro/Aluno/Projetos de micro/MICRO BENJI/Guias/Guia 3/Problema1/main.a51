	NAME MAIN
#include <89C51rx2.inc>
#define N_LOOPS 20	

	CSEG		AT 	0H			
	LJMP		START			
	
START:

	MOV		R0, #30H
	MOV		R1, #0H
	MOV		R2, #80H ;<-- PARES
	MOV		R3, #90H ;<-- IMPARES
	MOV		R4, #N_LOOPS
	
CICLO:
	
	MOV		A,@R0
	INC     R0
	JB		Acc.0, IMPAR
	Mov     B, R2
	Mov     R1, B
	MOV		@R1,A
	INC		R2
	
	jmp 	loopfim
	
IMPAR:
	
	MOV		B,R3
	MOV		R1,B
	MOV		@R1,A
	INC		R3

loopfim:

	DJNZ	R4,CICLO	
					
END

;Universidade do Minho
;MIECOM
;Microcontroladores
;Jorge Bastos a68456

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