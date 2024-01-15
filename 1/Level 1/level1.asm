.global _start
_start:
# .intel_syntax tells the assembler that we are using Intel assembly syntax
# noprefix tells it that we will not prefix all register names with "%" (cause that looks silly)
.intel_syntax noprefix

# Set a register (level 1)
mov rdi, 0x1337

#mov rdi, 42 # our program's return code (e.g., for bash scripts)
mov rax, 60 # system call number of exit()
syscall # do the system call
