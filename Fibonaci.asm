;Include Statements
include Irvine32.inc
include macros.inc

;Memory Statements
.386 ;x86 architecture
.stack 4096 ;4KB
ExitProcess proto,dwExitCode:dword

.data

.code
main proc
	
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mWrite "Enter an intger: "
	call ReadDec

	cmp eax, 20
	jbe L1

	mWrite "N Should be less than or equal to 20"

	L1:
	xchg eax, ecx
	call Fibonaci

invoke ExitProcess, 0
main endp

Fibonaci proc
	
	mov eax, 0
	mov ebx, 1
	
	L2:
	call WriteDec
	mWrite " "
	add eax, ebx
	xchg eax, ebx

	loop L2

ret 
Fibonaci endp

end main
