;Your heading including
;Your name
;The assignment prompt

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