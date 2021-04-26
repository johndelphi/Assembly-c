;john michael
;COSC-2325
;4/11/2021

;Create a procedure that fills an array of doublewords with N random integers, 
;making sure the values fall within the range j...k, inclusive. When calling the 
;procedure, pass a pointer to the array that will hold the data, pass N, and pass the
;values of j and k. Preserve all register values between calls to the procedure. Write a test program that
;calls the procedure twice,
;using different values for j and k. Verify your results using a debugger. 

; This program fills the array with N random integers that
; are within a given range

INCLUDE Irvine32.inc

.data

msg1 BYTE "Elements of the array that contains "

       BYTE " the elements in the range -20...30 :",0

msg2 BYTE "Elements of the array that contains "

       BYTE " the elements in the range 100...200 :",0

N=5

darray DWORD N DUP(?)                    ; double word array holds N integers

.code

main PROC

       ; calls the procedures

       call Clrscr                              ; clears the screen

       ; call fillArray to fill the array with 5 random integers that

       ; are in the range -20 to 30

       mov esi,OFFSET darray             ; pass the address of array

       mov ecx,N                                ; pass N

       mov ebx,-20                              ; pass the value of j(lower limit)

       mov edx,30                               ; pass the value of k (upper limit)

       call fillArray                           ; call the procedure SumArray

      

       ; display the elements of the array     

       mov edx, OFFSET msg1

       call WriteString

       call Crlf

L2:

       mov eax,[esi]

       call WriteInt

       call Crlf

       add esi,4

       loop L2

       ; call fillArray to fill the array with 5 random integers that

       ; are in the range 100 to 200

       mov esi,OFFSET darray             ; pass the address of array

       mov ecx,N                                ; pass N

       mov ebx,100                              ; pass the value of j(lower limit)

       mov edx,200                              ; pass the value of k (upper limit)

       call fillArray                           ; call the procedure SumArray

      

       ; display the elements of the array     

       mov edx, OFFSET msg2

       call WriteString

       call Crlf

L3:

       mov eax,[esi]

       call WriteInt

       call Crlf

       add esi,4

       loop L3

       call Crlf

exit

main ENDP

;-----------------------------------------------------------------------

; fillArray

; fills the array with elements that are in the given range

; Receives : ESI=pointer to the doubleword array,

; ECX=value of N, EBX=value of j, EDX=value of k

; Returns: Nothing

;-----------------------------------------------------------------------

fillArray PROC USES ecx esi eax ebx ecx edx

       ; call Randomize to get unique values each time

       call Randomize      

       add edx,1                  ; edx=k+1    

L1 :

       mov eax,edx                ; move k+1 to eax

       sub eax,ebx                ; eax=(k+1)-j

       call RandomRange     ; generate a random integer between 0 - (eax-1)

                                         ; eax= a random integer in the range {0,(k-j)}

       ; convert the random integer return by RandomRange into an integer

       ; that is in the range {j,k} by adding j to eax

       add eax,ebx                ; eax=eax+ebx

       mov [esi],eax        ; fill the array with the generated random integer

       add esi,4                  ; increment the pointer of the array to point

                                         ; the next integer location.

       loop L1

       ret

fillArray ENDP

END main