;Include Statements
include Irvine32.inc
include macros.inc

;Memory Statements
.386 ;x86 architecture
.stack 4096 ;4KB
ExitProcess proto,dwExitCode:dword

_SIZE = 50

.data
A dword _SIZE DUP(?)

.code
main proc
	mov eax, 0
	mov ebx, 0
	mov ecx, _SIZE
	
	L1:
		call Randomize
		call Random32
		call WriteDec
		call Crlf
		mov A[ebx], eax
		inc ebx
		loop L1

	mov ecx, _SIZE
	mov edx, 0
	mov ebx, 0

	L2:
		cmp A[ebx], 0
		jge L3
		inc edx
		L3:
		inc ebx
		loop L2

	mWrite "Count of numbers below 0: "
	mov eax, edx
	call WriteDec

invoke ExitProcess, 0
main endp
end main
