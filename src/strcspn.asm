BITS 64

section .text
    global strcspn

strcspn:
    xor rax, rax                        ;put rax to 0
    xor r10, r10                        ;put r10 to 0

    main_loop_strcspn:
        xor r11, r11                    ;put r11 to 0
        mov r12b, byte [rdi + r10]      ;put r12 to value of rdi at r10
        inc r10                         ;increment r10

        sub_loop_strcspn:
            mov r13b, byte [rsi + r11]  ;put r13 to value of rsi at r11
            cmp r12b, r13b              ;compare r12 to r13
            je set_result_strcspn       ;if equal, set result and return
            cmp r13b, 0                 ;if r13 is 0
            je main_loop_strcspn        ;go to main_loop
            inc r11                     ;else increment r11
            jmp sub_loop_strcspn        ;and go to sub_loop

    set_result_strcspn:
        sub r10, 1                      ;decrement r10
        mov rax, r10                    ;put r10 to rax
        ret

    end_0_strcspn:
        xor rax, rax                    ;put rax to 0
        ret
