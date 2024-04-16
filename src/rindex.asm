BITS 64
section .text
    global rindex

rindex:
	xor rax, rax
    xor r10, r10

    loop_rindex:
        cmp [rdi + r10], sil
        je mov_rax
        cmp byte [rdi + r10], 0
        je end_loop_rindex
        inc r10
        jmp loop_rindex

    mov_rax:
        add rdi, r10
        mov rax, rdi
        sub rdi, r10
        inc r10
        cmp sil, 0
        je end_loop_rindex
        jmp loop_rindex

    end_loop_rindex:
        ret