NAME	H2A
	
	PUBLIC	INICIOH2A
	
	H2ACODE	SEGMENT	CODE			; Declara segmento
	RSEG 	H2ACODE					; Seleciona o segmento
		
	; Rotina que converte d�gito hexadecimal armazenado
	; no endere�o de mem�ria apontado por R0 para ASCII
INICIOH2A:
		; BA1: Bloco de atribui��o 1
		;MOV		A, @R0
		CLR C				
		SUBB 	A,#10 		
		
		; BD1: Bloco de decis�o 1					
		JC BA3_NAO			
		; Carry � 0, logo � letra porque A>=0
		; BA2_SIM: Bloco de atribui�ao 2					
		ADD A,#'A'			
		MOV B,A				
		JMP FIMH2A 			
		
		; BA3_NAO: Bloco de atribui��o 3					
BA3_NAO:
		ADD A,#10			
		ADD A,#'0'			
		MOV B,A				
FIMH2A:
		RET					
		
END
	
; Universidade do Minho
; MIECOM
; Microcontroladores
; David Faria a48238

; Qual o objectivo de desenvolver este programa em dois m�dulos?
; Diminui o tempo de execu��o. O programa fica mais leve em 
; compara��o se fosse feito em apenas um m�dulo.

; As directivas para liga��o do programa utilizam-se quando o programa 
; a desenvolver se encontra distribu�do por v�rios m�dulos.
; Como os m�dulos necessitam de partilhar informa��o torna-se necess�rio 
; identificar a origem da informa��o (quando externa) 
; ou qual a informa��o que vai ser partilhada.

; -> PUBLIC: Lista os s�mbolos que podem ser usados por outros m�dulos; 
; 			exporta um s�mbolo, neste caso m�dulo H2A.

; -> EXTRN: Lista os s�mbolos referidos no m�dulo corrente e definidos 
; 			noutro m�dulo; usa um s�mbolo, neste caso m�dulo MAIN.

; -> SEGMENT: Define um segmento.

; -> RSEG: Selec��o de um segmento.

; -> NAME: Especifica o nome do m�dulo objecto gerado pelo programa.

; Qual o endere�o na mem�ria de c�digo das etiquetas:
; BA3_NAO: C:0x000F
; FIM_H2A: C:0x0015

; Os ficheiros '.lst' contem os codigos maquina e assembly e os respectivos endere�os no c�digo.

; O objectivo de incluir a linha: #include<89C51Rx2.inc> �: incluir uma biblioteca, neste caso, a do nosso microcontrolador.

; O ficheiro com extens�o '.M51' contem os endere�os das etiquetas, endere�os de outras instru��es.