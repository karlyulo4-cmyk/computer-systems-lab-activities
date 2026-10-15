section .data

 Username db "what is your name?", 0
Username_len equ $ - Username

Usergender db "what is your gender?", 0
Usergender_len equ $ - Usergender


msg_greeting db "Hello ",0
msg_greeting_len equ $ - msg_greeting
You db "You are ",0
You_len equ $ - You

Years       db " years old", 10, 0
    Years_len       equ $ - Years

age db "what is your age?",0
age_len equ $ - age

msg_m db "Hello",0
msg_m_len equ $ - msg_m

msg_f db "World",0
msg_f_len equ $ - msg_f

invalid db "INVALID",0
msg_invalid_len equ $ - invalid

newline db 10


section .bss
    Name        resb 100
    Name_len    resd 1
    
    Age         resb 10
    Age_len     resd 1
    
    Gender      resb 4



section .text
    global _start

_start:
    ; --- Prompt and Read Name ---
    mov eax, 4          
    mov ebx, 1          
    mov ecx, Username       ; Fixed label name
    mov edx, Username_len
    int 0x80

    mov eax, 3          
    mov ebx, 0          
    mov ecx, Name
    mov edx, 100
    int 0x80

    cmp eax, 0
    jle .save_Name_len
    dec eax             
    cmp byte [Name + eax], 10
    je .save_Name_len   
    inc eax             
.save_Name_len:
    mov [Name_len], eax

    ; --- Prompt and Read Age ---
    mov eax, 4          
    mov ebx, 1          
    mov ecx, age        ; Fixed label name
    mov edx, age_len
    int 0x80

    mov eax, 3          
    mov ebx, 0          
    mov ecx, Age
    mov edx, 10
    int 0x80

    cmp eax, 0
    jle .save_Age_len
    dec eax
    cmp byte [Age + eax], 10
    je .save_Age_len
    inc eax
.save_Age_len:
    mov [Age_len], eax

    ; --- Prompt and Read Gender ---
    mov eax, 4          
    mov ebx, 1          
    mov ecx, Usergender     ; Fixed label name
    mov edx, Usergender_len
    int 0x80

    mov eax, 3          
    mov ebx, 0          
    mov ecx, Gender
    mov edx, 4
    int 0x80

    ; --- Print Hello [Name] ---
    mov eax, 4          
    mov ebx, 1          
    mov ecx, msg_greeting
    mov edx, msg_greeting_len
    int 0x80

    mov eax, 4          
    mov ebx, 1          
    mov ecx, Name
    mov edx, [Name_len]
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; --- Print You are [Age] years old ---
    mov eax, 4          
    mov ebx, 1          
    mov ecx, You
    mov edx, You_len
    int 0x80

    mov eax, 4          
    mov ebx, 1          
    mov ecx, Age
    mov edx, [Age_len]
    int 0x80

    mov eax, 4          
    mov ebx, 1          
    mov ecx, Years
    mov edx, Years_len
    int 0x80

    ; --- Check Gender ---
    mov al, [Gender]    

    cmp al, 'M'
    je .print_m
    cmp al, 'm'
    je .print_m

    cmp al, 'F'
    je .print_f
    cmp al, 'f'
    je .print_f

    jmp .print_invalid

.print_m:
    mov ecx, msg_m
    mov edx, msg_m_len
    jmp .do_print

.print_f:
    mov ecx, msg_f
    mov edx, msg_f_len
    jmp .do_print

.print_invalid:
    mov ecx, invalid
    mov edx, msg_invalid_len

.do_print:
    mov eax, 4          
    mov ebx, 1          
    int 0x80

    ; --- Exit Program ---
    mov eax, 1          
    mov ebx, 0          
    int 0x80


