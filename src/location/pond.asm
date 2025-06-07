;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"

extern print

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA

section .data
    header db "|--------------------> Pond <--------------------|", 0xA
    headerlen equ $ - header

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LEVEL

section .text
    global pond

pond:
    mov rdi, header
    mov rsi, headerlen
    call print

    ret

