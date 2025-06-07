section .data
    clear   db 27, "[2J", 27, "[H"
    clear_len equ $ - clear

%macro clear_screen 0
    mov rax, 1          ; syscall number: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, clear      ; pointer to ANSI string
    mov rdx, clear_len  ; length of string
    syscall
%endmacro

%macro exit 0           ; macro to exit the program
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro
