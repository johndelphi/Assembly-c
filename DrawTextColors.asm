
;john michael
;COSC-2325
;The assignment prompt
;Write a program that displays the same string in four different colors,
;using a loop. Call the SetTextColor procedure from
;following link library. Any Colors may be chosen, but you may find it easiest 
;to change the foreground color.

include Irvine32.inc

.data
str1 byte "This line is displayed in color",0

.code
main proc

mov eax, black + (white * 16) ; black on white backgrouund
mov ecx,4 ; loop counter

L1: call SetTextColor
mov edx,OFFSET str1
call WriteString
call Crlf
add eax,2 ; add 2 to foreground color
loop L1

exit
main endp
end main