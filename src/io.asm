;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS

section .text
    global print

print:
    ; rdi = pointer to string
    ; rsi = length
    ; rdx = length (moved from rsi)
    ; rsi = pointer to string
    ; rdi = STDOUT
    push rsi ; save length
    push rdi ; save pointer

    mov rax, SYS_WRITE
    mov rdi, STDOUT ; file descriptor
    pop rsi ; restore pointer to string
    pop rdx ; restore length
    syscall
    ret
