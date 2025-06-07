%macro exit 0           ; macro to exit the program
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro
