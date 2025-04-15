;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"

extern print

;;;;;;;;;;;;;;;;;;;;;;;;;
; LOCATIONS
extern spawn

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA

section .data
    msg db "Welcome to Nyx", 0xA
    len equ $ - msg

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROGRAM

section .text
    global _start

_start:
    mov rdi, msg
    mov rsi, len
    call print

    call spawn

    ; exit(0)
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

