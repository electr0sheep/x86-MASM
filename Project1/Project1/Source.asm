.586
.MODEL FLAT

.STACK  4096					; reserve 4096-byte stack

.DATA							; reserve storage for data
value	DWORD	?
char	BYTE	?

.CODE							; start of main program code
main:
		mov		al,		-4
		mov		bl,		8
		imul	bl					; ax = 1111 1111 1110 0000 = -32
		mov		eax,	0			; exit with return code 0
		ret
END main