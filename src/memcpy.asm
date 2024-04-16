BITS 64

section .text
    global memcpy

memcpy:
    xor rax, rax

    loop_memcpy:
        cmp rax, rdx
        je done_memcpy
        mov r10b, byte [rsi + rax]
        mov [rdi + rax], r10b
        inc rax
        jmp loop_memcpy

    done_memcpy:
        mov rax, rdi
        ret
