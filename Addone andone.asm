; AddTwoSum_64.asm - Chapter 3 example.
; Student Name (John muema michael)
; Computer Organization
; COSC 2325-2801
; Date 1/28/2021
ExitProcess proto

.data
sum qword 0

.code
main proc
	mov	rax,1
	add	rax,1
	mov   sum,rax

	mov   ecx,0
	call  ExitProcess

main endp
end