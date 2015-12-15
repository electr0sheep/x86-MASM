.586
.model flat
.stack 4096

.data

.code
main proc
	mov eax, 12355678h
	push eax
	push 30
	pop ebx
	pop ecx
	mov eax, 0
	ret
main endp
end