section .data
    message db "Bitwise Shifts:", 0xa
    result_shl db "Shift Left: ", 0
    result_shr db "Shift Right: ", 0

section .text
    global _start

_start:
    ; Assuming you have a value in rdi
    mov rdi, 0x5daecf245d2f8b1c   ; Load the value into rdi

    ; Perform a bitwise left shift by 2
    mov rax, rdi
    shl rax, 2

    ; Print the message
    mov eax, 4           ; syscall: write
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, message     ; pointer to the message
    mov edx, 17          ; length of the message
    int 0x80             ; call kernel

    ; Print the result of the left shift
    mov eax, 4
    mov ebx, 1
    mov ecx, result_shl
    mov edx, 14          ; length of "Shift Left: "
    int 0x80

    ; Print the value after left shift
    mov eax, 4
    mov ebx, 1
    mov ecx, rax         ; pointer to the shifted value
    mov edx, 16          ; length of the value (64-bit hexadecimal)
    int 0x80

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 1
    int 0x80

    ; Perform a bitwise right shift by 1
    mov rax, rdi
    shr rax, 1

    ; Print the result of the right shift
    mov eax, 4
    mov ebx, 1
    mov ecx, result_shr
    mov edx, 15          ; length of "Shift Right: "
    int 0x80

    ; Print the value after right shift
    mov eax, 4
    mov ebx, 1
    mov ecx, rax         ; pointer to the shifted value
    mov edx, 16          ; length of the value (64-bit hexadecimal)
    int 0x80

    ; Exit the program
    mov eax, 60          ; syscall: exit
    xor ebx, ebx         ; status: 0
    int 0x80             ; call kernel
