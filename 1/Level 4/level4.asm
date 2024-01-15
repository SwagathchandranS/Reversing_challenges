section .data
    ; You can initialize your data here if needed

section .text
    global _start

_start:
    ; Assuming you have values in rdi, rsi, and rdx

    ; Multiply rsi by rdx, result in rdx:rdi
    imul rdi, rsi, rdx

    ; Your result is now stored in rdx:rdi

    ; Add any further instructions or code as needed
    
    ; Exit the program
    mov eax, 60         ; syscall: exit
    xor edi, edi        ; status: 0
    syscall            ; call kernel
