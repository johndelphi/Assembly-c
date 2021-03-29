;john michael
;cosc-2325
;date:3/28/2021
; Color Matrix  
; Write a program that displays a single character in all possible 
; combinations of foreground and background colors (16x16 =256).  The
; colors are numbered from 0 to 15, so you can use a nested loop to
; generate all possible combinations. 
 
 
INCLUDE Irvine32.inc
 
CR = 0Dh		; carriage return
LF = 0Ah		; line feed
 
.data
prompt1   BYTE "Please type a character: ",0
 
dispChr   DWORD ?
 
.code
main PROC
; Set text color to white text on black background
; even though these are the default colors.
; Each color constant is defined in Irvine32.inc
	mov  eax,white + (black * 16)
	call SetTextColor
	call Clrscr		; clear the screen
; Get the user to type some character for our display:
	mov  edx,OFFSET prompt1		; "Please type a..."
	call WriteString
	call ReadChar
; One now has the desired character in AL, but we can
; only use it later, so we save it in variable dispChr:
	mov  dispChr,eax
	call Crlf		; new line
 
; Generating all the possible color combinations in a nested
; loop requires a bit more work than simply a single loop.
; ECX will be preserved on the stack across the i5nner loop:
	mov  ecx,16	; outer loop counter
 
L1:	push ecx	; save outer loop counter
; As the text attributes above illustrate, to set colors we
; need to compute EAX in a way that combines both attributes.
; Set EAX using the stack copy of ECX value so the background
; will vary slowest (with the outer loop counter).
	mov  ecx,16	; inner loop counter
 
L2:	pop  eax	; gets the outer loop counter in EAX
	push eax	; saves it back again
	sub  eax,1	; shifts range from 1-16 to 0-15
	rol  eax,4	; sets AL for the background color
	add  eax,ecx	; adds the inner loop counter of ECX
	sub  eax,1	; sets AL for the foreground color
	call SetTextColor
; EAX is now available for restoring the display character
	mov  eax,dispChr
	call WriteChar
	Loop L2
; Return the cursor to beginning of next row for matrix
	call Crlf		; new line
 
	pop  ecx	; restore outer loop counter
	Loop L1
 
; Show the results on screen until user hits enter, then exit.
	mov  eax,white + (black * 16)
	call SetTextColor	; otherwise we leave black on black
	call Crlf		; new line
	call WaitMsg		; "Press [Enter]..."
 
	exit
main ENDP
 
END main