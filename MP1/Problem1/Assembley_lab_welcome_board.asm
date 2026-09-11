SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, place
    mov edx, len_place
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, mode
    mov edx, len_mode
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, status
    mov edx, len_status
    int 0x80

    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80

section .data

place db 'Assembly Laboratory', 0xa
len_place equ $ - place

mode db 'Mode: Linux ELF32', 0xa
len_mode equ $ - mode

status db 'Status: Ready!', 0xa
len_status equ $ - status
