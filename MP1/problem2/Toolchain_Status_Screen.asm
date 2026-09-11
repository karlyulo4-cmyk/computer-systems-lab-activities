SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .text
    global _start

_start:
    ; Print Assembler status
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, assembler
    mov edx, len_assembler
    int 0x80

    ; Print Linker status
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, linker
    mov edx, len_linker
    int 0x80

    ; Print Program status
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, program
    mov edx, len_program
    int 0x80

    ; Exit
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80

section .data

assembler db 'Assembler ready!', 0xa
len_assembler equ $ - assembler

linker db 'Linker ready!', 0xa
len_linker equ $ - linker

program db 'Program ready!', 0xa
len_program equ $ - program

