[org 0x7c00]

; code
mov bp, 0x8000
mov sp, bp

mov bx, BOOT_STR
call rm_print_str

jmp $

; includes
%include "./boot/rm_print_str.asm"

; constants
BOOT_STR:
db 'switching to 64-bit long mode...', 0

times 510-($-$$) db 0x0
dw 0xaa55