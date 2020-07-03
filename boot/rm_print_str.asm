
rm_print_str:
pusha
mov ah, 0x0e			; tells BIOS to use scrolling teletype routine when interrupt 0x10 happens.
rm_print_str_loop:		; label for printing next character

mov al, [bx]			; set al (where BIOS will get the char from) to the byte at bx
cmp al, 0				; check if al is a null character
je rm_print_str_end		; if it is: goto the end, otherwise continue

int 0x10				; use interrupt 0x10 to make the BIOS print what is in al
add bx, 1				; move bx one forward (to the next char in the string)
jmp rm_print_str_loop	; repeat
 
rm_print_str_end:
popa
ret