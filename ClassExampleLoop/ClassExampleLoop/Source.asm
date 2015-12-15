.586
.MODEL FLAT
.STACK 4096
INCLUDE io.h

.DATA
prompt1		BYTE	"String to search?", 0
prompt2		BYTE	"Key to search for?", 0
target		BYTE	80 DUP (?)
key			BYTE	80 DUP (?)
trgtLength	DWORD	?
keyLength	DWORD	?
lastPosn	DWORD	?
resultLbl	BYTE	"Search Results", 0
failure		BYTE	"The key does not appear in the string", 0
success		BYTE	"The key appears at position"
position	BYTE	11 DUP (?)
			BYTE	" in the string.", 0

.CODE
_MainProc PROC
	input	prompt1, target, 80
	lea		eax, target
	push	eax
	call	strlen
	add		esp, 4
	mov		trgLength, eax
	input	prompt2, key, 80
	lea		eax, key
	push	eax
	call	strlen
	add		esp, 4
	mov		keyLength, eax

	mov		eax, trgLength
	sub		eax, keyLength
	inc		eax
	mov		lastPosn, eax
	cld
	mov		eax, 1
whilePosn:
	cmp		eax, lastPosn
	jnle	endWhilePosn
	lea		esi, target
	add		esi, eax
	dec		esi
	lea		edi, key
	mov		ecx, keyLength
	repe	cmpsb
	jz		found
	inc		eax
	jmp		whilePosn
endWhilePosn:
	output	resultLbl, failure
	jmp		quit
found:
	dtoa	position, eax
	output	resultLbl, success
quit:
	mov		eax, 0
	ret
_MainProc	ENDP

strlen PROC
	push	ebp
	mov		ebp, esp
	push	ebx
	sub		eax, eax
	mov		ebx, [ebp+8]
whileChar:
	cmp		BYTE PTR [ebx], 0
	je		endWhileChar
	inc		eax
	inc		ebx
	jmp		whileChar
endWhileChar:
	pop		ebx
	pop		ebp
	ret
strlen ENDP
END