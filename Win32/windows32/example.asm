; Example assembly language program -- adds 158 to number in memory
; Author:  R. Detmer
; Date:   

.586
.MODEL FLAT

.STACK  4096					; reserve 4096-byte stack

.DATA							; reserve storage for data
value	DWORD	?
char	BYTE	?

.CODE							; start of main program code
main	PROC		; special note: in MASM it is necessary to have the "main" function
		mov	value,	100
		mov esi, 00406000h
		mov	eax,	[esi]
		mov	char,	'*'
		add	value,	1
		mov ecx, 00406000h
		add [ecx], ebx
		mov	eax, 0			; exit with return code 0
		ret
main	ENDP

END								; end of source code