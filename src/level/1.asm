;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"

extern print

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA

section .data
    welcome db "Welcome to Level1", 0xA
    welcomelen equ $ - welcome

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LEVEL

section .text
    global level1

level1:
    mov rdi, welcome
    mov rsi, welcomelen
    call print
    ret
