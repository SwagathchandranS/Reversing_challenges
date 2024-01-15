.global _start
_start:

.intel_syntax noprefix
   
    mov rax, 0x1337
   
    mov r12, 0xCAFED00D1337BEEF

    mov rsp, 0x31337

#mov rsp,60  # our program's return code (e.g., for bash scripts)
#mov rax, 42 # system call number of exit()
#syscall # do the system call
