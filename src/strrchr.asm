BITS 64

section .text
    global strrchr

strrchr:
	xor rax, rax                            ;put rax to 0
    xor r10, r10                            ;put r10 to 0

    loop_strrchr:
        cmp [rdi + r10], sil                ;cmp sil (sous registre de rsi) avec la valeur de rdi a l'index r10
        je mov_rax                          ;si c'est bon je change rax a la valeur de rdi a l'index r19
        cmp byte [rdi + r10], 0             ;cmp si je ne suis pas a la fin de la string
        je end_loop_strrchr                 ;si c'est le cas je return
        inc r10                             ;sinon j'incremente r10
        jmp loop_strrchr                    ;et je continue la loop

    mov_rax:
        add rdi, r10                        ;pointeur sur string += l'index
        mov rax, rdi                        ;rax = nouveau pointeur sur string
        sub rdi, r10                        ;pointeur sur string -= l'index
        inc r10                             ;incremente r10
        cmp sil, 0                          ;on verifie que la valeur de rsi n'est pas 0
        je end_loop_strrchr                 ;si c'est 0 on return
        jmp loop_strrchr                    ;sinon on refait la loop

    end_loop_strrchr:
        ret
