BITS 64

section .text
    global strncmp

strncmp:
    xor rax, rax                        ;put rax to 0
    xor r8, r8                          ;put r8 to 0
    sub rdx, 1                          ;dec rdx by 1

    loop_strncmp:
        mov bl, byte [rdi + r8]         ;mov le byte de rdi a l'index r8 dans le sous registre bl
        mov cl, byte [rsi + r8]         ;mov le byte de rsi a l'index r8 dans le sous registre cl

        cmp rdx, -1                     ;cmp rdx avec -1
        je return_0                     ;si c'est le cas return 0
        cmp r8, rdx                     ;cmp r8 avec rdx
        je end_loops                    ;si c'est le bon index on return
        cmp bl, 0                       ;cmp bl avec la fin d'une string
        je end_loops                    ;si c'est le cas on return
        cmp cl, 0                       ;cmp cl avec la fin d'une string
        je end_loops                    ;si c'est le cas on return
        cmp bl, cl                      ;on compare bl et cl
        jne end_loops                   ;si ils sont différent on return
        inc r8                          ;on incremente r8
        jmp loop_strncmp                ;on recommence la loop

    return_0:
        xor rax, rax                    ;on met rax a 0
        ret                             ;pour return

    end_loops:
        movzx rax, bl                   ;on met bl dans le registre rax
        movzx r8, cl                    ;on mets cl dans le registre r8
        sub rax, r8                     ;on soustrait r8 a rax
        ret                             ;on return
