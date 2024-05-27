section .data
    msg db 'Digite o seu nome: '
    len equ $ - msg

section .bss
    name resb 1

section .text
global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, name
    mov edx, 60 ; Limite de entrada
    int 0x80  ; Chamar o kernel

    call resultado

    mov eax, 1    ;SYS_EXIT
    int 0x80      ;Chamar Kernell

resultado:
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, len
    int 0x80
    ret