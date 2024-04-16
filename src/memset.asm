BITS 64

section .text
    global memset

memset:
    xor rax, rax                        ;put rax to 0

    loop_memset:
        cmp rax, rdx                    ;cmp act index with max index
        je done_memset                  ;return pointer to rdi
        mov byte [rdi + rax], sil       ;met la valeur de rsi dans rdi a l'index rax
        inc rax                         ;incremente l'index
        jmp loop_memset                 ;on recommence la loop

    done_memset:
        mov rax, rdi                    ;on met la valeu de rdi dans rax
        ret                             ;return rax
