.586
.MODEL FLAT
.STACK 4096

.DATA
nbrArray	DWORD	25, 47, 15, 50, 32, 95 DUP (?)
nbrElts		DWORD	5

.CODE
main	PROC
; find sum and average
		mov		eax, 0				; sum := 0
		lea		ebx, nbrArray		; get address of nbrArray
		mov		ecx, nbrElts		; count := nbrElts
		jecxz	quit				; quit if no numbers
forCount1:
		add		eax, [ebx]			; add number to sum
		add		ebx, 4				; get address of next entry in array elt
		loop	forCount1			; repeat nbrElts times

		cdq							; extend sum to quadword
		idiv	nbrElts				; calculate average: edx:eax r:q
; add 10 to each array element below average
		lea		ebx, nbrArray		; get address of nbrArray
		mov		ecx, nbrElts		; count := nbrElts
forCount2:
		cmp		[ebx], eax			; number < average ?
		jnl		endIfSmall			; continue if not less
		add		DWORD PTR [ebx], 10	; add 10 to number
endIfSmall:
		add		ebx, 4				; get address of next array elt
		loop	forCount2			; repeat
quit:
		mov		eax, 0				; exit with return code 0
		ret
main	ENDP
END
