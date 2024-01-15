section .data
    message db "Register Sizes:", 0xa
    rax_size db "RAX: ", 0
    rbx_size db "RBX: ", 0
    rcx_size db "RCX: ", 0
    rdx_size db "RDX: ", 0
    rsi_size db "RSI: ", 0
    rdi_size db "RDI: ", 0
    r8_size db "R8: ", 0
    r9_size db "R9: ", 0
    r10_size db "R10: ", 0
    r11_size db "R11: ", 0
    r12_size db "R12: ", 0
    r13_size db "R13: ", 0
    r14_size db "R14: ", 0
    r15_size db "R15: ", 0

section .text
    global _start

_start:
    ; Print the message
    mov eax, 4           ; syscall: write
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, message     ; pointer to the message
    mov edx, 16          ; length of the message
    int 0x80             ; call kernel

    ; Print RAX register size
    mov eax, 4
    mov ebx, 1
    mov ecx, rax_size
    mov edx, 5           ; length of "RAX: "
    int 0x80

    mov rax, 0xd202efb8c88d008f
    mov r8,  rax
    mov rax, r8

    ; Print the size of each register
    mov r8, 0            ; initialize counter

    print_register_size:
        ; Convert the counter (register number) to a string
        mov rsi, r8
        mov rdi, rax_size
        add rdi, 5          ; skip "RAX: "
        call number_to_string

        ; Print the register name
        mov eax, 4
        mov ebx, 1
        mov ecx, rax_size
        add ecx, 5          ; skip "RAX: "
        mov edx, 4
        int 0x80

        ; Print the register size
        mov eax, 4
        mov ebx, 1
        mov ecx, r8
        add ecx, rax_size   ; pointer to the size string
        mov edx, 2
        int 0x80

        ; Print a newline
        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, 1
        int 0x80

        ; Increment counter
        inc r8

        ; Check if we have printed all registers
        cmp r8, 15
        jle print_register_size

    ; Exit the program
    mov eax, 60          ; syscall: exit
    xor ebx, ebx         ; status: 0
    int 0x80             ; call kernel

number_to_string:
    ; Converts a number in rsi to a string in rdi
    mov rax, rsi         ; Copy the number to rax
    mov rcx, 10          ; Set divisor to 10
    mov rbx, rdi         ; Copy address of destination buffer to rbx
    add rbx, 10          ; Move rbx to the end of buffer
    mov byte [rbx], 0    ; Null-terminate the string

reverseLoop:
    dec rbx              ; Move buffer pointer backwards
    xor rdx, rdx         ; Clear any previous remainder
    div rcx              ; Divide rax by 10, result in rax, remainder in rdx
    add dl, '0'          ; Convert remainder to ASCII
    mov [rbx], dl        ; Store ASCII character in buffer

    test rax, rax        ; Check if quotient is zero
    jnz reverseLoop      ; If not, continue loop

    ; Move the string to the beginning of the buffer
    mov rsi, rbx
    mov rdi, r8
    mov rcx, 10
    rep movsb

    ret
