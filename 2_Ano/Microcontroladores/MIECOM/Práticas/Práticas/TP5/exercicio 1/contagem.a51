;	INICIO DE PROGRAMA

#include <89C51IC2.inc>
		NAME MAIN
		EXTRN 	CODE 	(ENVIAR_RS232, RECEBER_RS232, CONFIG_RS232)
		
		CSEG 	AT	0H
		JMP		MAIN
		CSEG 	AT 	30H
		
		N		EQU		5		; vari�vel "N" toma o valor de 3

; ROTINA PARA CONFIGURAR A PORTA DE SERIE, E, INICIALIZAR AS VARI�VEIS  (posi��o da fun��o pode ser alterada)		
MAIN:
		CALL	CONFIG_RS232	; configura a porta de serie(flags, bourate, etc)
		MOV		R1,#N			; registo R1 guarda o valor de "N"	
		MOV		R2,#0			; registo R2 que ir� ter os valores a ser enviados PARA o terminal(quando executar "CALL	ENVIAR_RS232" = mostra no terminal)
		MOV		R3,#0			; contador de N at� 0 no ciclo CONTADOR
		MOV		R4,#0			; vari�vel que ir� percurrer a String e tomar os seus valores
		
		MOV		R5,#0			; contador de menor peso, em ATRASO_2
		MOV		R6,#0			; contador de peso intermedio, em ATRASO_1
		MOV		R7,#0			; contador de maior peso, em ATRASO_0

; ROTINA PARA CADA SEQUENCIA DE "0" AT� "N"
RECOMECAR:
		MOV		A,R1			; A = R1
		MOV		R3,A			; R3 = A, ter� que tomar o valor de "N" a cada sequ�ncia de numeros uma vez que se encontra com o valor de "0" no final de cada
		INC		R3				; R3 = R3+1, porque no ciclo da sequencia ele decrementa de "N" at� ser igual a "0", n�o correndo o ciclo do "0". Logo R3 = N+1
		MOV 	R4,#0			; R4 = 0, ter� que tomar o valor de "0" a cada sequ�ncia de numeros uma vez que se encontra com o valor de "N" no final de cada
		MOV 	R2,#0			; R2 = 0, ter� que tomar o valor de "0" a cada sequ�ncia de numeros uma vez que se encontra com o valor de "N" no final de cada
		MOV 	DPTR,#MENSAGEM	; DPTR toma o valor do apontador de MENSAGEM, ou seja o valor da primeira posi��o da string

; ROTINA PARA CONTAR CADA NUMERO COM O ATRASO
CONTADOR:
		MOV		R5,#222		; ajuste de "ATRASO_2"
		MOV		R6,#140			; ajuste de "ATRASO_1"
		MOV		R7,#4			; ajuste de "ATRASO_0"
		CALL	ESCREVER		; chama a fun��o ESCREVER e quando esta acabar o programa continua aqui
		CALL	ATRASO_0		; chama a fun��o ATRASO e quando esta acabar o programa continua aqui
		DEC		R3				; decrementa "1" a R3 
		MOV		A,R3
		CJNE	A,#0,CONTADOR	; salta para CONTADOR enquanto R3 for diferente de "0" (ciclo de "N" vezes)
		JMP		RECOMECAR		; quando os "N" numeros forem digitados ele salta para RECOME�AR

; ROTINA PARA OBTER UM ATRASO DE 0.7s (posi��o da fun��o pode ser alterada)
ATRASO_0:
ATRASO_1:
ATRASO_2:
		NOP	          			; queima 1 ciclo por cada ciclo
		DJNZ	R5,ATRASO_2		; decrementa "1" a R5 e salta para "ATRASO_2" enquanto for diferente de "0". A partir do 2� ciclo R5 = 0-1 = 255, ou o ciclo ocorrer 255 vezes
		NOP
		DJNZ	R6,ATRASO_1		; decrementa "1" a R5 e salta para "ATRASO_1" enquanto for diferente de "0". A partir do 2� ciclo R5 = 0-1 = 255, ou o ciclo ocorrer 255 vezes
		NOP
		DJNZ	R7,ATRASO_0		; decrementa "1" a R5 e salta para "ATRASO_0" enquanto for diferente de "0". A partir do 2� ciclo R5 = 0-1 = 255, ou o ciclo ocorrer 255 vezes
		RET						;O PROGRAMA CONTINUA ONDE FOI CHAMADA A FUN��O "ATRASO_0"

; ROTINA PARA ENVIAR PARA O DISPLAY E PARA O TERMINAL O NUMERO DA SEQUENCIA (posi��o da fun��o pode ser alterada)
ESCREVER:
        MOV		A,R4			; A = R4
		MOVC	A,@A+DPTR  		; A = ao conteudo da 1� posi��o da mensagem/String
		MOV		P1,A			; o display toma o valor desse conteudo
		MOV		A,R2			; A = toma o valor de R2
		CALL	ENVIAR_RS232	; envia para o terminal o valor de A(=R2)
		INC		R4				; R4 = R4+1
		INC		R2				; R2 = R2+1
		RET 					; O PROGRAMA CONTINUA ONDE FOI CHAMADA A FUN��O "ESCREVER"
		
; LOCAL ONDE "DPTR" � INICIALIZADO (posi��o da fun��o pode ser alterada)
MENSAGEM:
		DB	0Ch,0CFh,54h,46h,87h,26h,24h,4Fh,04h,07h 	; 00, 01, 02, 03, 04, 05, 06, 07, 08, 09
		
END		;FIM DE PROGRAMA