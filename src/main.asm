;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"
%include "src/macros.asm"

extern print

;;;;;;;;;;;;;;;;;;;;;;;;;
; LOCATIONS
extern spawn

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA

section .data
    header db "###################################################", 0xA
           db "#                  Welcome to Nyx                 #", 0xA
           db "###################################################", 0xA
           db "#               The Twilight Awaits...            #", 0xA
           db "###################################################", 0xA
           db 0xA

    headerlen equ $ - header

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROGRAM

section .text
    global _start

_start:
    mov rdi, header
    mov rsi, headerlen
    call print

    call spawn

    exit

