; AddTwoSum_64.asm - Chapter 3 example.
; Student Name (John muema michael)
; Computer Organization
; COSC 2325-2801
; Date 2/14/2021
ExitProcess proto
;description
;using registers: A = (A + B) + (C + D). Assign integer values to the EAX, EBX, ECX, and EDX registers

.data
A qword 5 ; where we store our  A value
B qword 7 ; where we store our B value
c qword 8 ; where we store our B value
D qword 3 ; where we store the value for D
sum qword A ; where we will move the total  sum of all the numbers 

.code
main proc
	mov	rax,A   ; moving the value of first num to the rax register
	add	rax,B   ; adding and moving the value of (A+b) to rax
	add rax,C   ; adding the value comtained in C to the value of rax
	add rax,D   ; adding D to rax and then moving  the total  to rax register
	mov   sum,rax ; moving the total of (A+B+C+D) to sum 
	mov   ecx,0
	call  ExitProcess

main endp
end
