.586
.MODEL FLAT, stdcall

option casemap:none
.STACK  4096

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\kernel32.lib

.DATA
nbrArray	DWORD	25, 47, 15, 50, 32, 95 DUP (?)
nbrElts		DWORD	5

.CODE
main		PROC
			mov		ecx, 10
EatBlueApple:
			PrintText "A blue Apple?!?!"
			dec		ecx
			test	ecx, ecx
			jnz		EatBlueApple
			PrintText "UGH, I ate 10 blue Apples YUCK"
			ret
main      ENDP
END