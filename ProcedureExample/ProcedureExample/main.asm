.586
.MODEL FLAT
.STACK 4096

.DATA
two	dword 2
three	dword 3

.DATA?
dwArray dword 150 dup (?)

.CODE
zero	macro	source, length, size
	mov eax, 0
	mov ecx, length
	dec ecx
begin:
	mov [source + size * ecx], eax
	dec ecx
	cmp ecx, 0
	je finish
	jmp begin
finish:
endm

main PROC
	lea ebx, dwArray
	zero ebx, 150, 4
	mov	ecx, 0
	mov eax, 127
	call syracuse
	ret
main ENDP

syracuse PROC
start:
	lea ebx, dwArray
	mov [ebx + 4 * ecx], eax
	cmp eax, 1
	je done
	inc ecx
	mov ebx, eax
	cdq
	idiv two
	cmp edx, 0
	je start
	jmp odd	
odd:
	mov eax, ebx
	imul eax, three
	inc eax
	jmp start
done:
	mov eax, ecx
	ret
syracuse ENDP
END