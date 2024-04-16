BITS 64

section .text
    global strcasecmp

strcasecmp:
    xor rax, rax                                ;put rax to 0

    loop_strcasecmp:
        mov bl, byte [rdi]                      ;move le byte rdi dans le sous registre bl
        mov cl, byte [rsi]                      ;move le byte rsi dans le sous registre cl

        cmp bl, 'A'                             ;compare si le byte rdi est inferieur a A
        jl no_lower_case_bl                     ;si c'est le cas pas de mise en minuscule
        cmp bl, 'Z'                             ;compare si le byte rdi est superieur a Z
        jg no_lower_case_bl                     ;si c'est le cas pas de mise en minuscule
        add bl, 32                              ; A >= byte rdi <= Z donc += 32

        no_lower_case_bl:
            cmp cl, 'A'                         ;compare si le byte rsi est inferieur a A
            jl no_lower_case_cl                 ;si c'est le cas pas de mise en minuscule
            cmp cl, 'Z'                         ;compare si le byte rsi est superieur a Z
            jg no_lower_case_cl                 ;si c'est le cas pas de mise en minuscule
            add cl, 32                          ; A >= byte rsi <= Z donc += 32
        no_lower_case_cl:
            cmp bl, 0                           ;on verifie si on est a la fin de la premiere string
            je end_loop_strcasecmp              ;si c'est le cas on return
            cmp cl, 0                           ;on verifie si on est a la fin de la seconde string
            je end_loop_strcasecmp              ;si c'est le cas on return
            cmp bl, cl                          ;on compare les deux bytes
            jne end_loop_strcasecmp             ;si ils ne sont pas egaux on return
            inc rdi                             ;sinon on change le byte de rdi
            inc rsi                             ;on change le byte de rsi
            jmp loop_strcasecmp                 ;et on recommence la loop

    end_loop_strcasecmp:
        movzx rax, bl                           ;on met le sous registre bl dans rax
        movzx rbx, cl                           ;on met le sous registre cl dans rbx
        sub rax, rbx                            ;on soustrait bl a cl pour return la bonne valeur
        ret
