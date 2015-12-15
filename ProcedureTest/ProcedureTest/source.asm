.586
.model flat
.stack 4096

.code
main	proc
	mov		ax, 0fa75h
	test	ax, 0004h
	ret
main	endp
end