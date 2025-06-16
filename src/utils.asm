section .data
    clear   db 27, "[2J", 27, "[H" ; string to clear terminal screen
    clearlen equ $ - clear

%macro sleep 1
    ; sleeps for %1 seconds (tv_sec = %1, tv_nsec = 0)
    sub rsp, 16
    mov qword [rsp], %1 ; tv_sec
    mov qword [rsp + 8], 0 ; tv_nsec = 0

    mov rax, 35 ; syscall: nanosleep
    mov rdi, rsp ; const struct timespec *req
    xor rsi, rsi ; remaining = NULL
    syscall

    add rsp, 16 ; clean up stack
%endmacro

%macro clear_screen 0
    mov rdi, clear ; file descriptor: stdout
    mov rsi, clearlen ; pointer to ANSI string
    call print
%endmacro

%macro exit 0 ; macro to exit the program
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro
