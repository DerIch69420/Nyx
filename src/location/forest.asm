;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"
%include "src/utils.asm"

extern print
extern input

;;;;;;;;;;;;;;;;;;;;;;;;;
; LOCATIONS
extern clearing

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BUFFER

section .bss
    user_input resb 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA

section .data
    header db "|--------------------> Forest <--------------------|", 0xA
    headerlen equ $ - header

    intro_text1 db "You find yourself surrounded by towering trees.", 0xA
                db "Mysterious sounds echo from all directions.", 0xA
    intro_text1_len equ $ - intro_text1

    intro_text2 db "Suddenly, an enigmatic glowing light appears before you.", 0xA
    intro_text2_len equ $ - intro_text2

    intro_text3 db "As you step closer, you realize it is an apple.", 0xA
                db "You wonder whether you should eat it...", 0xA
    intro_text3_len equ $ - intro_text3

    option_1 db "1. Eat the mysterious apple.", 0xA
    option_1_len equ $ - option_1

    option_2 db "2. Walk past it.", 0xA
    option_2_len equ $ - option_2

    result_1_1 db "A sharp pain spreads throughout your entire body.", 0xA
    result_1_1_len equ $ - result_1_1

    result_1_2 db "You have died...", 0xA
    result_1_2_len equ $ - result_1_2

    result_2 db "You continue deeper into the forest until you reach a clearing.", 0xA
    result_2_len equ $ - result_2

    invalid_input db "Unrecognized choice. Please try again.", 0xA
    invalid_input_len equ $ - invalid_input

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LEVEL

section .text
    global forest

forest:

    clear_screen

    mov rdi, header
    mov rsi, headerlen
    call print

    ; print introduction part 1
    mov rdi, intro_text1
    mov rsi, intro_text1_len
    call print

    sleep 5

    ; print introduction part 2
    mov rdi, intro_text2
    mov rsi, intro_text2_len
    call print

    sleep 5

    ; print introduction part 3
    mov rdi, intro_text3
    mov rsi, intro_text3_len
    call print

    sleep 1

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
    je .eat_apple

    cmp al, '2'
    je .pass_by

    ; Invalid input
    mov rdi, invalid_input
    mov rsi, invalid_input_len
    call print
    ret

    ret

.eat_apple:
    mov rdi, result_1_1
    mov rsi, result_1_1_len
    call print

    sleep 2

    mov rdi, result_1_2
    mov rsi, result_1_2_len
    call print

    sleep 3

    ret

.pass_by:
    mov rdi, result_2
    mov rsi, result_2_len
    call print

    sleep 3

    call clearing

    ret
