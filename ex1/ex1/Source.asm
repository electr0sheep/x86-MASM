; Example assembly language program -- adds 158 to number in memory
; Author:  R.Detmer
; Date:    1 / 2008

.586
.MODEL FLAT

.STACK  4096; reserve 4096 - byte stack

.DATA; reserve storage for data
number  DWORD - 105
sum     DWORD ?

.CODE; start of main program code
main    PROC
mov	ax, 0FA75h
test ax, 0004h
ret
main    ENDP

END; end of source code