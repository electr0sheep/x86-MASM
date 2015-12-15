; Input x and y, call procedure to evaluate 3*x+7*y, display result
; Author:	M. DeGraw
; Date:		3/30/2015
.586
.model flat

include io-asm.h

.stack 4096

.data
number 1	dword	?
number2		dword	?
prompt1		byte	"Enter first number x", 0
prompt2		byte	"Enter second number y", 0
string		byte	20 dup (?)
resultlbl	byte	"3*x+7*y", 0
result		byte	11 dup (?), 0

.code
_MainProc proc
	input	prompt1, string, 20		; read ASCII characters
	atod	string					; convert to integer
	mov		number1, eax			; store in memory

	input	prompt2, string, 20		; repeat for second number
	atod	string
	mov		number2, eax

	push	number2					; 2nd parameter
	push	number1					; 1st parameter
	call	fctn1					; fctn1(number1, number2)
	add		esp, 8					; remove parameters from stack

	dtoa	result, eax				; convert to ASCII characters
	output	resultlbl, result		; output label and result

	mov		eax, 0					; exit with return code 0
	ret								; return
_MainProc endp

; int fctn1(int x, int y)
; returns 3*x+4*y
fctn1	proc
	push	ebp						; save base pointer
	mov		ebp, esp				; establish stack frame
	push	ebx						; save EBX

	mov		eax, [ebp+8]			; x
	imul	eax, 3					; 3*x
	mov		ebx, [ebp+12]			; y
	imul	ebx, 7					; 7*y
	add		eax, ebx				; 3*x + 7*y

	pop		ebx						; restore EBX
	pop		ebp						; restore EBP
	ret								; return
fctn1	endp
END