	CSEG 	AT 	0H
	
	SJMP	MAIN
	CSEG	AT  30H
	
MAIN:
	MOV		R4,#N		; Move para R4 a quantidade de n�meros a serem trocados
	MOV		R5,#40h     ; Endere�o destino do 1� n�mero, 0x40
	MOV		R7,#10h     ; R7 cont�m os 8bits mais significativos do endere�o de 16bits onde se encontram os n�meros
	MOV		R6,#00h		; R6 cont�m os 8bits menos significativos do endere�o de 16bits onde se encontram os n�meros	
	CALL    ROTINA	
	JMP		$

ROTINA:
	MOV		A,R5
	MOV		R0,A		; R0 apontar� para a primeira posi��o onde ser� colocado o n�mero
	INC		R5
	MOV		A,R5
	MOV		R1,A		; R1 apontar� para a posi��o seguinte
	MOV		DPL,R6		; Move os 8bits menos significativos para DPL
	MOV		DPH,R7		; Move os 8bits mais significativos para DPH
	MOV		A,B			
	MOVC	A,@A+DPTR	; Guarda em A o n�mero que est� em NUMS
	DEC		R4			; Decrementa a quantidade de n�meros que falta ler
	MOV		@R1,A		; Faz a troca do n�mero
	INC		B			; L� o n�mero seguinte
	MOV		A,B
	MOVC	A,@A+DPTR	; Guarda em A o n�mero seguinte
	MOV		@R0,A		; Faz novamente a troca
	SUBB 	R4,#2
	INC		B			
	INC		R5			
	CJNE	R4,#0,ROTINA	
	RET

	CSEG	AT 1000H
	
NUMS:
	DB 		80h,05h,6h,10h,20h,30h,5Fh,30h
	N		EQU $-NUMS
	
END