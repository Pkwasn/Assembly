; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
include Irvine32.inc
include macros.inc
.386 ;x86 architecture
.model flat,stdcall
.stack 4096 ;4KB
ExitProcess proto,dwExitCode:dword

BUFFER_SIZE = 50

.data
  buffer byte BUFFER_SIZE DUP(?)
  filename byte 80 DUP(?)
  fileHandle handle ?
  
.code
main proc
  mWrite "Enter an input filename: "
  mov edx, offset filename
  mov ecx, sizeof filename
  call ReadString
  
  mov edx, offset filename
  call OpenInputFile
  mov fileHandle, eax

  ;check for error
  cmp eax, INVALID_HANDLE_VALUE
  jne FILE_VALID
  
    mWrite "File Handeling Error"
    jmp MY_EXIT
  
  FILE_VALID:
  	mWrite "File is valid"
    
    mov edx, offset buffer
    mov ecx, BUFFER_SIZE
    call ReadFromFile
    jnc CHECK_BUFFER_SIZE ;file opening was successful
    mWrite "Error Reading The File"
    call WriteWindowsMsg
    jmp CLOSE_FILE
    
    CHECK_BUFFER_SIZE:
        cmp eax, BUFFER_SIZE
        jb BUF_SIZE_OK ; BUFFER_SIZE is bigger so, CF = 1
        mWrite "Buffer Error"
        jmp My_EXIT
       
    BUF_SIZE_OK:  
        mov buffer[eax], 0 ;insert null terminator
        mWrite "File Size: "
        call WriteDec
    	call Crlf ; new line
      
    ; display the buffer
    mWrite "Buffer contains: "
    mov edx, offset buffer
    call WriteString
    call Crlf
    
	CLOSE_FILE:
    	mov eax, fileHandle
	call CloseFile
      
	MY_EXIT:
invoke ExitProcess, 0
main endp
end main
