	AREA	RESET,DATA,READONLY
	EXPORT	__Vectors
__Vectors

	DCD 0x10001000
	DCD Reset_Handler
		
	AREA mycode,CODE,READONLY
	ENTRY	
	EXPORT	Reset_Handler
	
Reset_Handler
	
	LDR	R0,=NUM
	LDR R1,[R0]
	LDR R0,=RES+7
	MOV R2,#8
LOOP	
	AND R3,R1,#0X0F
	STRB R3,[R0],#-1
	LSR	R1,#4
	SUB R2,#1
	TEQ R2,#0
	BNE LOOP
STOP
	B STOP
NUM DCD 0XABCDEF12
	
	
	AREA	mydata,DATA,READWRITE
RES DCB 0
	END
	
	