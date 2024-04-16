BITS 64

section .text
    global strstr

strstr:
    xor rax, rax    ;put return value to 0
    xor r10, r10    ;put index to second string at 0
    xor r11, r11    ;put index to first string at 0

    loop:
        mov r12b, byte [rsi + r10]  ;put second string argument at index r10 into r12
        mov r13b, byte [rdi + r11]  ;put first string argument at index r11 into r13
        cmp r12b, 0                 ;compare r12 with 0 to check end of second string
        je result
        cmp r13b, 0                 ;compare r13 with 0 to check end of first string
        je false_result
        cmp r13b, r12b              ;compare second and first string
        je true_cmp
        xor r10, r10                ;false compare so put r10 to 0
        inc r11                     ;increment first string index
        jmp loop

    true_cmp:
        inc r10                     ;increment second string index
        inc r11                     ;increment first string index
        jmp loop

    false_result:
        mov rax, 0                  ;return null pointer
        ret

    result:
        sub r11, r10                ;substract first string index with second string index
        add rdi, r11                ;move rdi pointer by r11
        mov rax, rdi                ;put rdi pointer into rax
        sub rdi, r11                ;put back rdi
        ret
