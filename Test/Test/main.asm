.586
.MODEL FLAT

.STACK  4096

.DATA
Value	WORD	08F2h
number2	DWORD	158
number3	DWORD	45
sum		DWORD	?

.CODE
main	PROC
		imul	bx, Value, 256	;256 = 2^8
		ret						;bx = F200
main	ENDP

END	