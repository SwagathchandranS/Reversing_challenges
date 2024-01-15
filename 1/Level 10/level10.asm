section .data
    message db "Bitwise AND Result:", 0xa
    result db "Result: ", 0

section .text
    global _start

_start:
    ; Assuming you have values in rdi and rsi
    mov rdi, 0x8e52d458b6e7424d
    mov rsi, 0x757374df383000f8

    ; Perform bitwise AND operation
    mov rax, rdi
    and rax, rsi

    ; Print the message
    mov eax, 4           ; syscall: write
    mov ebx, 1           ; file descriptor: stdout
    mov ecx, message     ; pointer to the message
    mov edx, 20          ; length of the message
    int 0x80             ; call kernel

    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 8           ; length of "Result: "
    int 0x80

    ; Convert the result to a hexadecimal string and print it
    mov rsi, rax
    mov rdi, result + 8  ; skip "Result: "
    call number_to_hex

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 60          ; syscall: exit
    xor ebx, ebx         ; status: 0
    int 0x80             ; call kernel

number_to_hex:
    ; Converts a number in rsi to a hexadecimal string in rdi
    mov rax, rsi
    mov rcx, 16
    mov rbx, rdi
    add rbx, 16          ; Move rbx to the end of buffer
    mov byte [rbx], 0    ; Null-terminate the string

reverseLoop:
    dec rbx              ; Move buffer pointer backwards
    xor rdx, rdx         ; Clear any previous remainder
    div rcx              ; Divide rax by 16, result in rax, remainder in rdx
    add dl, '0'          ; Convert remainder to ASCII
    cmp dl, '9'
    jbe no_correction
    add dl, 7            ; Adjust to ASCII 'A' to 'F'
no_correction:
    mov [rbx], dl        ; Store ASCII character in buffer

    test rax, rax        ; Check if quotient is zero
    jnz reverseLoop      ; If not, continue loop

    ; Move the string to the beginning of the buffer
    mov rsi, rbx
    mov rdi, result + 8  ; Skip "Result: "
    sub rdi, 1           ; Adjust for the extra decrement before storing the first digit
    mov rcx, 16
    rep movsb

    ret
