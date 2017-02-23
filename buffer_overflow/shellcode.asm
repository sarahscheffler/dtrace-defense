; note: I created this by following these guides:
; https://www.exploit-db.com/docs/33698.pdf
; stackoverflow.com/questions/26823678/linux-64-bit-shellcode
; 0xax.blogspot.com2014/08/say-hello-to-x64-assembly-part-1.html
; https://thebrownnotebook.wordpress.com/2009/10/27/native-64-bit-hello-world-with-nasm-on-freebsd/
; https://dhavalkapil.com/blogs/Shellcode-Injection
; http://stackoverflow.com/questions/15593214/linux-shellcode-hello-world

global _start

section .data

section .text

_start:
    jmp message

message:
    call goback ; return address (of "Hello, World\n") pushed onto stack
    db "Hello, World", 0x21, 0x00

goback:
    mov rax, 4
    mov rdi, 1
    pop rsi ; pop into rsi, now we have address of "Hello, World\n"
    mov rdx, 13
    syscall

    mov rax, 1
    xor rdi, rdi ; mov rdi, 0
    syscall

