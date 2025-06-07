section .data
    clear   db 27, "[2J", 27, "[H"
    clear_len equ $ - clear

%macro clear_screen 0
    mov rax, 1         ; syscall number: write
    mov rdi, 1         ; file descriptor: stdout
    mov rsi, clear     ; pointer to ANSI string
    mov rdx, clear_len ; length of string
    syscall
%endmacro

%macro sleep 1
    ; Sleeps for %1 seconds (tv_sec = %1, tv_nsec = 0)
    sub rsp, 16
    mov qword [rsp], %1    ; tv_sec
    mov qword [rsp + 8], 0 ; tv_nsec = 0

    mov rax, 35  ; syscall: nanosleep
    mov rdi, rsp ; const struct timespec *req
    xor rsi, rsi ; remaining = NULL
    syscall

    add rsp, 16 ; clean up stack
%endmacro

%macro exit 0 ; macro to exit the program
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro
