SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data

notice db 'System notice: READY', 10


notice_len equ $ - notice

section .text

global _start

_start:
     mov eax, SYS_WRITE
     mov ebx, STDOUT
     mov ecx, notice
     mov edx , 50
     int 0x80
    
    mov eax, SYS_EXIT
    mov ebx, 0
    int 0x80 