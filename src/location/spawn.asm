;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"

extern print
extern input

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BUFFER

section .bss
    input_buffer resb 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DATA

section .data
    header db "|--------------------> Spawn <--------------------|", 0xA
    headerlen equ $ - header

    text1 db "There are two paths.", 0xA
          db "Which one will you take?", 0xA
    text1len equ $ - text1

    path1 db "Path1: Into a dark forest", 0xA
    path1len equ $ - path1

    path2 db "Path2: A muddy pond", 0xA
    path2len equ $ - path2
    
    chosen1 db "You chose Path1", 0xA
    chosen1len equ $ - chosen1

    chosen2 db "You chose Path2", 0xA
    chosen2len equ $ - chosen2

    invalid db "Invalid choice.", 0xA
    invalidlen equ $ - invalid


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LEVEL

section .text
    global spawn

spawn:
    ;; print start texts
    mov rdi, header
    mov rsi, headerlen
    call print

    mov rdi, text1
    mov rsi, text1len
    call print

    mov rdi, path1
    mov rsi, path1len
    call print

    mov rdi, path2
    mov rsi, path2len
    call print


    ; prompt for input
    mov rdi, input_buffer
    mov rsi, 64
    call input

    ; check user input
    mov al, [input_buffer]   ; load first character from input buffer

    cmp al, '1'
    je .chosen_path1

    cmp al, '2'
    je .chosen_path2

    ; if neither 1 nor 2, invalid input
    mov rdi, invalid
    mov rsi, invalidlen
    call print
    ret

.chosen_path1:
    mov rdi, chosen1
    mov rsi, chosen1len
    call print
    ret

.chosen_path2:
    mov rdi, chosen2
    mov rsi, chosen2len
    call print
    ret

    ret

