; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
include Irvine32.inc
.386 ;x86 architecture
.model flat,stdcall
.stack 4096 ;4KB
ExitProcess proto,dwExitCode:dword

.data
prompt byte "Enter a integer here: ", 0
prompt2 byte "Number of digits: ", 0 
num dword 01d
const dword 010d

.code
main proc

	mov edx, OFFSET prompt
	call WriteString
	call ReadDec
	xchg num, eax
	mov ecx, 0
	mov edx, 10

	L1:
		inc ecx
		imul edx
		mov edx, const
		cmp num, eax

	jg L1

	mov eax, ecx
	mov edx, OFFSET prompt2
	call WriteString
	call WriteDec

invoke ExitProcess, 0
main endp
end main
