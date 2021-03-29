;john michael
;cosc 2325 2801
; Program Name:  bigEndian to LittleEndian
; Description:Write a program that uses the variables below and MOV 
;instructions to copy the value from bigEndian to littleEndian, reversing the order of the bytes. The number's 32 - bit value is understood to be 12345678 hexadecimal. 

 ;   .data
;bigEndian   BYTE 12h, 34h, 56h, 78h
;littleEndian DWORD?
 
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
 
.data
bigEndian BYTE 12h,34h,56h,78h
littleEndian BYTE 0
 
.code
main PROC
  mov al,[bigEndian+3]
  mov littleEndian,al
 
  mov al,[bigEndian+2]
  mov littleEndian+1,al
 
  mov al,[bigEndian+1]
  mov littleEndian+2,al
 
  mov al,[bigEndian]
  mov littleEndian+3,al
 
INVOKE ExitProcess,0
main ENDP
END main
