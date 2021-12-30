	NAME WAIT
	PUBLIC INICIOWAIT
	WAITCODE SEGMENT CODE 
	RSEG WAITCODE
		
INICIOWAIT:
		DEC R0
CARGA:
		MOV TMOD,#10H
		MOV R1,#6
LOOP:
		MOV TH1,#HIGH(-50000)
		MOV TL1,#LOW(-50000)
		SETB TR1
WAIT:
		JNB TF1,WAIT
		CLR TR1
		CLR TF1
		DJNZ R1,LOOP
		CJNE R0,#0,INICIOWAIT
FIM:
		RET
END		