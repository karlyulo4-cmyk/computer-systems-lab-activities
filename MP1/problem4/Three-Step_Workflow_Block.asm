SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data

message db 'Step 1:Edit', 10
        db 'Step 2:Assemble', 10
        db 'Step 3:Run', 10
        db 'Step 4:test',10

message_len equ $ - message

section .text

global _start

_start:
     mov eax, SYS_WRITE
     mov ebx, STDOUT
     mov ecx, message
     mov edx , 12
     int 0x80
    
    mov eax, SYS_EXIT
    mov ebx, 0
    int 0x80 