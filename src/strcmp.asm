BITS 64

section .text
    global strcmp

strcmp:
    xor rax, rax                   ;put rax to 0

    loop_strcmp:
        mov bl, byte [rdi]          ;mov value of rdi into subregister bl
        mov cl, byte [rsi]          ;mov value of rsi into subregister cl

        cmp bl, 0                   ;compare bl with end string
        je end_loop                 ;if bl is 0, jump to end_loop
        cmp cl, 0                   ;compare cl with end string
        je end_loop                 ;if cl is 0, jump to end_loop
        cmp bl, cl                  ;compare bl with cl
        jne end_loop                ;if different, jump to end_loop
        inc rdi                     ;else increment rdi
        inc rsi                     ;and increment rsi
        jmp loop_strcmp             ;and jump to loop_strcmp

    end_loop:
        movzx rax, bl               ;mov value of bl into rax
        movzx rbx, cl               ;mov value of cl into rbx
        sub rax, rbx                ;sub rbx from rax
        ret
