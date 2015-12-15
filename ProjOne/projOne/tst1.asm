; Programming Project 1
; Author: Michael DeGraw R10483006
; Date: 2/10/14

.586							; processor directive. .586 is a 32 bit processor (No "r" registers)
.MODEL FLAT						; memory will be allocated sequentially, using the flat model

.STACK  4096					; reserve 4096-byte stack

.DATA							; 'variables'
number1	DWORD	-105			; 32 bit registers expect doubleword length variables
number2	DWORD	158				; you can use word variables if you don't use "e" registers
number3	DWORD	45
sum		DWORD	?

.CODE							; start of main program code
main	PROC					; the program start is main. Important if you are doing your own linking
		mov		eax, number1	; first number to EAX
		mov		edx, number2	; retrieve contents of memory location "number2" and store in EDX
		add		eax, edx		; add the contents of EDX to EAX and store the result in EAX
		mov		edx, number3	; retrieve contents of memory location "number3" and store in EDX
		add		eax, edx		; add the contents of EDX to EAX and store the result in EAX
		mov		sum, eax		; store contents of EAX in memory location "sum"
		mov		eax, 0			; exit with return code 0
		ret
main	ENDP

END								; end of source code