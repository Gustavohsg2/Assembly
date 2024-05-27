section .data
    ; variáveis
    msg db 'Hello World', 0xA,   ; db - tipo de variável
    ; 0xA equivalente ao /n
    len equ $ - msg
section .text
global _start

_start:
    ;aqui nosso código
    call _hello_world ;chamar função

_hello_world:
    mov eax, 4                 ;Metodo de escrita(sys_write)
    mov ebx, 1                 ;Metodo de saida(std_out)
    mov ecx, msg               ;Mensagem
    mov edx, len               ;Tamanho
    int 0x80                   ;Chamando o kernel

    mov eax, 1                 ;Metodo de saida(sys_exit)
    int 0x80                   ;Chamando kernel