section .data

section .bss
num resb 4

section .text
global _start

_start:
    mov eax, 123
    mov ebx, 100
    div ebx
    add al, '0'
    mov [num], al

    mov eax, edx
    mov ebx, 10
    div ebx
    add al, '0'
    mov [num+1], al

    add dl, '0'
    mov [num+2], dl
    mov byte [num+3], 0

    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 3
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
