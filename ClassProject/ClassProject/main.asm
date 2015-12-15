.586
.MODEL FLAT

.STACK 4096

.DATA

.CODE
main PROC
mov ECX, 3
mov EAX, 0;
start:
	je	ECX, 0
	dec ECX
	inc EAX
end:
	ret
main endp
end main