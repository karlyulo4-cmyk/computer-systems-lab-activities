SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data

message db 'Task Complete', 10
message_len equ $ - message

section .text

global _start

_start:
     mov eax, SYS_WRITE
     mov ebx, STDOUT
     mov ecx, message
     mov edx , message_len
     int 0x80
    
    mov eax, SYS_EXIT
    mov ebx, 25
    int 0x80 