BITS 64
section .text
    global memmove

memmove:
    xor rcx, rcx                   ; rcx = 0
    cmp rdx, 0                      ; Si aucun byte à copier
    je mov_ret                      ; return
    cmp rsi, rdi                    ; Si la source et la destination sont les mêmes
    je mov_ret                      ; return
    jg forward                      ; aller de l'avant si rsi < rdi

reverse:
    mov r10b, byte [rsi + rdx - 1]             ; copier le byte
    mov byte [rdi + rdx - 1], r10b             ; vers la destination
    dec rdx                        ; décrémenter le nombre de bytes restants
    cmp rdx, 0                     ; vérifier si tout a été copié
    jne reverse                   ; recommencer si ce n'est pas terminé

mov_ret:
    mov rax, rdi                   ; renvoyer la destination
    ret

forward:
    mov r10b, byte [rsi + rcx]             ; copier le byte
    mov byte [rdi + rcx], r10b            ; vers la destination
    inc rcx                        ; incrémenter le nombre de bytes copiés
    cmp rcx, rdx                     ; vérifier si tout a été copié
    jne forward                   ; recommencer si ce n'est pas terminé
    je mov_ret                     ; return