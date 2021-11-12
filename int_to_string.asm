;Include Statements
include Irvine32.inc
include macros.inc

;Memory Statements
.386 ;x86 architecture
.stack 4096 ;4KB
ExitProcess proto,dwExitCode:dword

_SIZE = 10

.data
buffer byte _SIZE DUP(?)
N DWORD ?
R DWORD ?
count DWORD 0

.code
main proc
	
	call clear

	mWrite "Enter a integer: "
	call ReadDec
	mov N, eax

	mov ebx, _SIZE - 1
	L1:
	mov edx, 0
	mov eax, N
	mov ecx, 10
	div ecx
	mov R, edx
	mov N, eax
	mov buffer[ebx], dl
	dec ebx
	inc count
	cmp N, 0
	jg L1

	mov ebx, _SIZE
	sub ebx, count
	mov ecx, count

	mWrite "String: "
	L2:
	mov al, buffer[ebx]
	inc ebx
	call WriteDec
	loop L2

invoke ExitProcess, 0
main endp

clear proc
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
ret
clear endp

end main
