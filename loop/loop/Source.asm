.586
.MODEL FLAT

.STACK 4096

.DATA
numyears DWORD 15
year DWORD 2000
two DWORD 2
four DWORD 4
hundred DWORD 100
oneeighty DWORD 180
fhundred DWORD 400
average DWORD 0

.CODE
main proc
	mov ecx, numyears					;//execute the loop numyears times
	WH:
		mov eax, year					;//move the year into eax
		cdq								;//ready eax for division
		idiv fhundred					;//divide by four hundred
		cmp edx, 0						;//is there a remainder?
		jz LEAPYEAR						;//if not, jump to LEAPYEAR
		mov eax, year					;//move the year into eax
		cdq								;//prepare for division
		idiv hundred					;//divide by a hundred
		cmp edx, 0						;//is there a remainder?
		jz NORMAL						;//if not, jump to NORMAL
		mov eax, year					;//move the year into eax
		cdq								;//prepare for division
		idiv four						;//divide by four
		cmp edx, 0						;//is there a remainder?
		jz LEAPYEAR						;//if not jump to LEAPYEAR
		jmp NORMAL						;//jump to NORMAL
	LEAPYEAR:
			add average, 366			;//add 366 to average
			jmp FINISH					;//jump to FINISH
	NORMAL:
			add average, 365			;//add 365 to average
			jmp FINISH					;//jump to FINISH
	FINISH:
		inc year						;//increment year
		loop WH							;//repeat the loop
	mov eax, 12							;//move 12 into eax
	mul numyears						;//multiply 12 by numyears
	mov numyears, eax					;//store the number of months in the number of years variable
	cdq									;//prepare for division
	idiv two							;//divide by two
	add eax, average					;//add value of average to eax
	cdq									;//ready eax for division
	idiv numyears						;//divide eax by the total number of months
	ret
main endp
end