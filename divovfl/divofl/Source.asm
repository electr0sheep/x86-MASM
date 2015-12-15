; Example assembly language program -- division overflow
;

.586
.MODEL FLAT

.STACK  4096										;//reserve 4096 - byte stack

.DATA												;//reserve storage for data
dividend    DWORD   08010020h
divisor     DWORD   10h
quotient	DWORD ?
remainder	DWORD ?

.CODE												;//start of main program code
main    PROC
mov		eax, $dividend
mov     eax, dividend								;//dividend to EAX
cdq													;//extend to 64 bits
mov     ecx, divisor								;//divisor to ecx
idiv    ecx											;//perform division
mov	quotient, eax									;//save quotient and remainder
mov remainder, edx
mov eax, 0
ret
main    ENDP
END													;//end of source code