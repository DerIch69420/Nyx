;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"
%include "src/utils.asm"

extern print
extern input

;;;;;;;;;;;;;;;;;;;;;;;;;
; LOCATIONS
extern forest
extern pond

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BUFFER

section .bss
    user_input resb 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; STRINGS

section .data
    header db "|--------------------> Spawn <--------------------|", 0xA
    headerlen equ $ - header

    intro_text db "You stand at a mysterious crossroads.", 0xA
               db "Which path will you take?", 0xA
    intro_text_len equ $ - intro_text

    option_1 db "1. Enter the shadowy forest", 0xA
    option_1_len equ $ - option_1

    option_2 db "2. Cross the swampy pond", 0xA
    option_2_len equ $ - option_2

    result_1 db "You walk cautiously into the forest, shadows dancing around you...", 0xA
    result_1_len equ $ - result_1

    result_2 db "You step into the pond, the water cold and murky...", 0xA
    result_2_len equ $ - result_2

    invalid_input db "Unrecognized choice. Please try again.", 0xA
    invalid_input_len equ $ - invalid_input

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTION

section .text
    global spawn

spawn:

    clear_screen

    ; print header
    mov rdi, header
    mov rsi, headerlen
    call print

    ; print introduction
    mov rdi, intro_text
    mov rsi, intro_text_len
    call print

    ; print options
    mov rdi, option_1
    mov rsi, option_1_len
    call print

    mov rdi, option_2
    mov rsi, option_2_len
    call print

    ; get input from player
    mov rdi, user_input
    mov rsi, 64
    call input

    ; check input
    mov al, [user_input]
    cmp al, '1'
    je .choose_forest

    cmp al, '2'
    je .choose_pond

    ; Invalid input
    mov rdi, invalid_input
    mov rsi, invalid_input_len
    call print
    ret

.choose_forest:
    mov rdi, result_1
    mov rsi, result_1_len
    call print

    sleep 3

    call forest

    ret

.choose_pond:
    mov rdi, result_2
    mov rsi, result_2_len
    call print

    sleep 3

    call pond

    ret

