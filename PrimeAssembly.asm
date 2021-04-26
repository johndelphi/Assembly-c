; PrimeAssemly.asm
; Student Name john michael
; Computer Organization
; COSC 2325-2801
; Date 04/25/2021

;Write a program that generates all prime numbers between 2 and 1000, 
;using the Sieve of Eratosthenes method. You can find many
;articles that describe the method for finding primes
;in this manner on theinternet. Display all the prime values
INCLUDE Irvine32.inc

includelib irvine32.lib

PrimeNumbers PROTO,

counter: DWORD ;used to give number of values to display

FirstNumber = 2 ; initial value

LastNumber = 1000 ;final value

.data

commaStr BYTE " ", 0

.data?

sieve BYTE LastNumber DUP (?)

.code

; Main Procedure

main PROC

mov ecx, LastNumber

mov edi, OFFSET sieve

mov al, 0

cld

rep stosb

mov esi, FirstNumber

.WHILE Esi <LastNumber ; loop until reach final value

.IF Sieve [esi * TYPE sieve] == 0 ;initial value

call Multiple ; call multiple procedure

.ENDIF

inc esi

.ENDW

INVOKE PrimeNumbers, LastNumber ;display the prime numbers

exit

main ENDP

; Multiple Procedure

Multiple PROC

push eax

push esi

mov eax, esi ;prime number

add esi, eax ;start with first multiple number

L1: cmp esi, LastNumber

ja L2

mov sieve [esi * TYPE sieve], 1

add esi, eax

jmp L1

L2: pop esi

pop eax

ret

Multiple ENDP

; Print Prime numbers

PrimeNumbers PROC,

counter: DWORD ;number of values to display

mov esi, 1

mov eax, 0

mov ecx, counter

L1: mov al, sieve [esi * TYPE sieve]

.IF Al == 0

mov eax, esi

call WriteDec

mov edx, OFFSET commaStr

call WriteString

.ENDIF

inc esi

loop L1

ret

PrimeNumbers ENDP

END main