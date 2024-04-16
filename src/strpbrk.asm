BITS 64

section .text
    global strpbrk

strpbrk:
    xor rax, rax                        ;put rax to 0
    xor r10, r10                        ;put r10 to 0

    main_loop_strpbrk:
        xor r11, r11                    ;put r11 to 0
        mov r12b, byte [rdi + r10]      ;mov value de rdi a l'index r10 dans le sous registre r12b

        cmp r12b, 0                     ;verifie si on est a la fin
        je end_0                        ;si c'est ça on return 0
        inc r10                         ;sinon on incremente r10

        sub_loop_strpbrk:
            mov r13b, byte [rsi + r11]  ;on value de rsi a l'index r11 dans le sous registre r13b
            cmp r13b, 0                 ;si on est a la fin de rsi
            je main_loop_strpbrk        ;on recommence la main loop
            cmp r12b, r13b              ;sinon on compare r12b et r13b
            je set_result               ;si ça marche on return le pointeur de rdi a l'index r10
            inc r11                     ;sinon on incremente r11
            jmp sub_loop_strpbrk        ;et on recommence la petite loop

    set_result:
        sub r10, 1                      ;on retire 1 a l'index de r10
        add rdi, r10                    ;on bouge le pointeur de rdi de r10fois
        mov rax, rdi                    ;on attribue le nouveau pointeur a rax
        sub rdi, r10                    ;on remet le pointeur a sa position d'origine
        ret                             ;on return

    end_0:
        xor rax, rax                    ;on met rax a 0
        ret                             ;on return
