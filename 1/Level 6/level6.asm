section .data
    ; You can initialize your data here if needed

section .text
    global _start

_start:
    ; Assuming you have values in rdi and rsi
    mov rdi, 0x1e73e438  ; Load the dividend into rdi
    mov rsi, 0x3ff        ; Load the divisor into rsi

    ; Divide rdi by rsi, result in rdi:rdx
    mov rdx, 0            ; Clear any previous remainder
    div rsi               ; Divide rdi by rsi, result in rdi:rdx

    ; Your remainder is now stored in rdx

    ; Add any further instructions or code as needed
    
    ; Exit the program
    mov eax, 60           ; syscall: exit
    xor edi, edi          ; status: 0
    syscall              ; call kernel
