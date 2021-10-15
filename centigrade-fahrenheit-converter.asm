; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
;include Irvine32.inc
.386 ;x86 architecture
.model flat,stdcall
.stack 4096 ;4KB
ExitProcess proto,dwExitCodedword

.data
temp byte 05d

.code
main proc
	
	call init
	call convertc
	call init
	mov temp, 032d
	call convertf 

invoke ExitProcess, 0
main endp

init proc
	mov eax, 0
	mov ebx, 0
	mov ecx, 0 
	mov edx, 0
ret
init endp

convertc proc 

	mov al, temp
	mov cl, 9
	imul cl
	mov cl, 5
	idiv cl
	add al, 32

ret
convertc endp

convertf proc

	mov al, temp
	sub al, 32
	mov cl, 5
	imul cl
	mov cl, 9
	idiv cl

ret
convertf endp

end main
