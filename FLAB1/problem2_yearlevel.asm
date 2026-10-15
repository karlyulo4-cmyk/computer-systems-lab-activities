section .data

 Username db "what is your name?", 0
Username_len equ $ - Username

Useryearlevel db "what is your year level?", 0
Useryearlevel_len equ $ - Useryearlevel


msg_greeting db "Hello ",0
msg_greeting_len equ $ - msg_greeting

You db "You are ",0
You_len equ $ - You

 Years db " years old", 10, 0
    Years_len       equ $ - Years

age db "what is your age?",0
age_len equ $ - age

Freshman db "Freshman",0
Freshman_len equ $ - Freshman


Sophmore db "Sophomore",0
Sophmore_len equ $ - Sophmore


Junior db "Junior",0
Junior_len equ $ - Junior

Senior db "Senior",0
Senior_len equ $ - Senior

invalid db "INVALID",0
msg_invalid_len equ $ - invalid



newline db 10


section .bss
    Name        resb 100
    Name_len    resd 1
    
    Age         resb 10
    Age_len     resd 1
    
    Year     resb 4



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

    ; --- Prompt and Useryearlevel ---
    mov eax, 4          
    mov ebx, 1          
    mov ecx, Useryearlevel     ; Fixed label name
    mov edx, Useryearlevel_len
    int 0x80

    mov eax, 3          
    mov ebx, 0          
    mov ecx, Year
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

    ; --- Check year ---
    mov al, [Year]    

    cmp al, '1'
    je .print_Freshman
    cmp al, '2'
    je .print_Sophmore

    cmp al, '3'
    je .print_Junior
    cmp al, '4'
    je .print_Senior

    jmp .print_invalid

.print_Freshman:
    mov ecx, Freshman
    mov edx, Freshman_len
    jmp .do_print

.print_Sophmore:
    mov ecx, Sophmore
    mov edx, Sophmore_len
    jmp .do_print

.print_Junior:
    mov ecx, Junior
    mov edx, Junior_len
    jmp .do_print

.print_Senior:
    mov ecx, Senior
    mov edx, Senior_len
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
