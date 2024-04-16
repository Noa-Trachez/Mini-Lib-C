BITS 64

section .text
    global strchr

strchr:
    xor rax, rax                        ;put rax to 0

    loop_strchr:
        cmp byte [rdi + rax], sil       ;cmp le byte de rdi a l'index rax avec la valeur de rsi
        je done_strchr                  ;si la comparaison est bone on return le pointeur
        cmp byte [rdi + rax], 0         ;regarde si on est a la fin de la string
        je error_strchr                 ;si c'est le cas on return 0
        inc rax                         ;incremente rax
        jmp loop_strchr                 ;on recommence la loop

    done_strchr:
        add rdi, rax                    ;on bouge le pointeur de rdi
        mov rax, rdi                    ;on l'attribue a rax
        ret

    error_strchr:
        xor rax, rax                      ;on met rax a 0
        ret