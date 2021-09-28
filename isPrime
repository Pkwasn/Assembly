; Patrick Kwasniak
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
num dword 017d ; temporary variable which holds our number

.code
main proc

	call cleard
		
		mov eax, num			; move temp variable onto bh register
		test eax, 01H			; if temp variable is even, number is not prime
		jz L1

		mov ecx, 01d
		L2:
		add ecx, 02d
		mov eax, num			; reinstantiate num onto eax (since during idiv, eax changes)
		mov edx, 0				; clear edx so idiv works
		idiv ecx
		
			cmp edx, 0			; if edx is 0, ecx fit perfectly into eax, zf = 1
			je L3				; since zf = 1, jump to L3

		cmp edx, 1				; if our remainder is greater than or equal to 1, go to L2 and increase ecx by 02d
		jge L2					

		jmp Exit
		L1:						; should only jump here if the number is even or not prime
			mov eax, 0
			jmp Exit

		L3:
			cmp eax, 1			; if eax is large than 1, the number is not prime
			jg L1				; if the number is not prime, go to L1, otherwiese set eax to 1
			mov eax, 1

	Exit:

invoke ExitProcess, 0
main endp
	
	cleard proc ; function to clear data registers

		mov eax, 0
		mov ebx, 0 
		mov ecx, 0
		mov edx, 0
	ret
	cleard endp

end main
