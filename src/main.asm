;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"
%include "src/utils.asm"

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
    clear_screen
    hide_cursor

    mov rdi, header
    mov rsi, headerlen
    call print

    sleep 3

    call spawn

    show_cursor

    exit

