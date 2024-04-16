BITS 64

section .text
    global strlen

strlen:
    xor rax, rax                      ;put rax to 0

    loop_strlen:
        cmp byte [rdi + rax], 0       ;compare the byte at rdi + rax to 0
        je done_srtlen                ;if equal, jump to done_strlen
        inc rax                       ;else, increment rax
        jmp loop_strlen               ;jump to loop_strlen

    done_srtlen:
        ret