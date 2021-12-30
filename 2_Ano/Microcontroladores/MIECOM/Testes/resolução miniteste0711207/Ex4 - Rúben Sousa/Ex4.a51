		CSEG 	AT 	0H
		JMP 	MAIN
		CSEG  	AT 	30H
MAIN:
		MOV 	DPTR,#DADOS			; Move para DPTR o endere�o do primeiro n�mero em DADOS
TESTE:	
		CJNE	R0,#12H,PERCORRER	; Se j� chegou ao fim da sequ�ncia, parar de percorrer
		MOV		A,R2				; Mover para A o menor n�mero encontrado, que se encontra em R2
		JMP 	$					
PERCORRER:
		MOV		A,R0
		MOVC 	A,@A+DPTR			; Move para A o n�mero atual
		JNB		ACC.0,PAR			; Verifica se o n�mero � par. �ltimo bit do acumulador tem de ser 0
		INC		R0					; Se n�o for par, passa para o pr�ximo n�mero
		JMP		TESTE				; Verifica o pr�ximo n�mero
PAR:
		MOV		R1,A				
		CJNE	R1,#0,LOOP			; 0 n�o � par, por isso, n�o pode ser m�nimo
		JMP		TESTE
LOOP:								
		DEC		A
		CJNE	A,#0,LOOP2			
		JMP		PAR2				; Se o n�mero atual da sequ�ncia chegar primeiro a 0, � o novo m�nimo
LOOP2:
		DEC		R3					; Se o m�nimo atual chegar primeiro a 0, continua a ser o menor at� ao momento
		CJNE	R3,#0,LOOP			; Se j� chegou a 0, podemos verificar o pr�ximo n�mero
		MOV		A,R2				
		MOV		R3,A				; Transfere novamente para R3 o m�nimo que est� em R2
		INC		R0					; Verifica o pr�ximo n�mero da sequ�ncia
		JMP		TESTE				
PAR2:
		MOV		A,R1				
		MOV		R2,A				; Transferir o novo m�nimo para R2 e R3. R2 � uma c�pia de seguran�a, visto que R3 vai ser alterado
		MOV		R3,A
		INC		R0					; Verifica o pr�ximo n�mero da sequ�ncia
		JMP		TESTE
		CSEG 	AT	440H			; Inicia o c�digo que se segue no endere�o 440H
DADOS:
		DB 10,9,8,2,4,6,7,8,9,1,14,19,20,22,14,15,28,19,0
END