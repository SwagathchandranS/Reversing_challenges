section .data
    message db "Register Sizes:", 0xa
    result_rdi db "Modulus of RDI: ", 0
    result_rsi db "Modulus of RSI: ", 0

section .text
    global _start

_start:
    ; Assuming you have values in rdi and rsi
    mov rdi, 0x331d        ; Load the value into rdi
    mov rsi, 0x69ce3293    ; Load the value into rsi

    ; Calculate rdi % 256 (modulus)
    mov rax, rdi
    mov rbx, 256
    xor rdx, rdx
    div rbx
    mov rdi, rdx

    ; Calculate rsi % 65536 (modulus)
    mov rax, rsi
    mov rbx, 65536
    xor rdx, rdx
    div rbx
    mov rsi, rdx

    ; Print the message
    mov eax, 4           ; syscall: write
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, message     ; pointer to the message
    mov edx, 16          ; length of the message
    int 0x80             ; call kernel

    ; Print the modulus of RDI
    mov eax, 4
    mov ebx, 1
    mov ecx, result_rdi
    mov edx, 17          ; length of "Modulus of RDI: "
    int 0x80

    ; Print the value of RDI
    mov eax, 4
    mov ebx, 1
    mov ecx, rdi         ; pointer to the size string
    add edx, 2           ; length of the value
    int 0x80

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 1
    int 0x80

    ; Print the modulus of RSI
    mov eax, 4
    mov ebx, 1
    mov ecx, result_rsi
    mov edx, 17          ; length of "Modulus of RSI: "
    int 0x80

    ; Print the value of RSI
    mov eax, 4
    mov ebx, 1
    mov ecx, rsi         ; pointer to the size string
    add edx, 2           ; length of the value
    int 0x80

    ; Exit the program
    mov eax, 60          ; syscall: exit
    xor ebx, ebx         ; status: 0
    int 0x80             ; call kernel
