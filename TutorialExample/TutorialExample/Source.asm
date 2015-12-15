;http://www.dreamincode.net/forums/topic/251471-masm-getting-started-with-masm/

.586
.model flat, stdcall
option casemap: none

include kernel32.inc

include kernel32.lib

.code
BareApp:

	invoke		ExitProcess, 0
end BareApp