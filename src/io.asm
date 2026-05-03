;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INCLUDES

%include "src/constants.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS

section .text
    global print
    global input

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

input:
    ; rdi = pointer to buffer
    ; rsi = maximum number of bytes to read
    ; returns: rax = number of bytes read

    mov rax, SYS_READ ; syscall number for read
    mov rdx, rsi ; number of bytes to read
    mov rsi, rdi ; pointer to buffer
    mov rdi, STDIN ; file descriptor (STDIN = 0)
    syscall
    ret
    
