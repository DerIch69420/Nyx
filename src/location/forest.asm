;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"

extern print

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA

section .data
    header db "|--------------------> Forest <--------------------|", 0xA
    headerlen equ $ - header

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LEVEL

section .text
    global forest

forest:
    mov rdi, header
    mov rsi, headerlen
    call print

    ret

