section .data


clear_screen db 27, "[2J", 27, "[H"
clear_len equ $ - clear_screen


newline db 10

Menu_msg            db "MENU", 0xA
                        db "[A]dd", 0xA
                        db "[S]ubtract", 0xA
                        db "[M]ultiply",0xA
                        db "[D]ivide",0XA
                        db " ",0xA
   Menu_len         equ $ - Menu_msg 

   option_msg db "Enter choice: ",0xA
    option_len equ $ - option_msg

enter1_msg db "enter first number: ",0xA

 enter1_len equ $ - enter1_msg


enter2_msg db "enter second number: ",0xA

 enter2_len equ $ - enter2_msg

 result_msg db "The result is ",0xA
   result_len equ $ - result_msg

Again_msg db"try again? ",0xA
Again_len equ $ - Again_msg

invalid db "INVALID",0xA
    msg_invalid_len equ $ - invalid

    No_msg db "Error: Cannot divide by zero.", 10
    No_len equ $ - No_msg

 section .bss
    Choice        resb 5
    enter1_num   resb 2
    enter2_num  resb 2
    result      resb 12
    Fail       resb 2
    operation resb 1
   
section .text
  global _start



_start: 


main_loop:

mov eax, 4
    mov ebx, 1
    mov ecx, clear_screen
    mov edx, clear_len
    int 0x80

 mov eax, 4          
    mov ebx, 1          
    mov ecx, Menu_msg       
    mov edx, Menu_len
    int 0x80

mov eax, 4          
    mov ebx, 1          
    mov ecx, option_msg      
    mov edx, option_len
    int 0x80

mov eax, 3          
    mov ebx, 0          
    mov ecx, Choice
    mov edx, 2
    int 0x80
  

  mov al, [Choice]

  cmp al, 'A'
    je select_add
    cmp al, 'a'
    je select_add

    cmp al, 'S'
    je select_sub
    cmp al, 's'
    je select_sub

    cmp al, 'M'
    je select_mul
    cmp al, 'm'
    je select_mul

    cmp al, 'D'
    je select_div
    cmp al, 'd'
    je select_div

    jmp invalid_choice


select_add:
    mov byte [operation], 1
    jmp get_numbers

select_sub:
    mov byte [operation], 2
    jmp get_numbers

select_mul:
    mov byte [operation], 3
    jmp get_numbers

select_div:
    mov byte [operation], 4
    jmp get_numbers


;getting the numbers

get_numbers:
    mov ecx, enter1_msg
    mov edx, enter1_len
    call print_string

    mov eax, 3
    mov ebx, 0
    mov ecx, enter1_num
    mov edx, 2
    int 0x80

   mov ecx, enter2_msg
   mov edx, enter2_len
   call print_string

    mov eax, 3
    mov ebx, 0
    mov ecx, enter2_num 
    mov edx, 2
    int 0x80

    ; Convert ASCII digits to integers
    movzx eax, byte [enter1_num]
    sub eax, '0'
    mov esi, eax

    movzx ebx, byte [enter2_num]
    sub ebx, '0'

    ; Selecting calculation


    cmp byte [operation], 1
    je do_add

    cmp byte [operation], 2
    je do_sub

    cmp byte [operation], 3
    je do_mul

    cmp byte [operation], 4
    je do_div


  
do_add:
    mov eax, esi
    add eax, ebx
    jmp show_result

do_sub:
    mov eax, esi
    sub eax, ebx
    jmp show_result

do_mul:
    mov eax, esi
    imul eax, ebx
    jmp show_result

do_div:
    cmp ebx, 0
    je division_error

    mov eax, esi
    cdq
    idiv ebx
    jmp show_result     


;display result


show_result:
    push eax

    mov ecx, result_msg
    mov edx, result_len
    call print_string

    pop eax
    call print_number

    mov ecx, newline
    mov edx, 1
    call print_string

    jmp ask_again


;retry
ask_again:
    mov ecx, Again_msg
    mov edx, Again_len
    call print_string

    mov eax, 3
    mov ebx, 0
    mov ecx, Fail
    mov edx, 2
    int 0x80

    mov al, [Fail]

    cmp al, 'Y'
    je main_loop
    cmp al, 'y'
    je main_loop

    cmp al, 'N'
    je exit_program
    cmp al, 'n'
    je exit_program

    jmp ask_again

invalid_choice:
    mov ecx, invalid
    mov edx, msg_invalid_len
    call print_string
    jmp ask_again

division_error:
    mov ecx, No_msg
    mov edx, No_len
    call print_string
    jmp ask_again

print_string:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

print_number:
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov edi, result
    add edi, 11

    xor esi, esi

    ; Handle negative numbers
    test eax, eax
    jns convert_digits

    neg eax
    mov esi, 1

convert_digits:
    mov ebx, 10

digit_loop:
    xor edx, edx
    div ebx

    add dl, '0'
    dec edi
    mov [edi], dl

    test eax, eax
    jnz digit_loop

    ; Add minus sign if needed
    cmp esi, 1
    jne write_number

    dec edi
    mov byte [edi], '-'

write_number:
    mov ecx, edi
    mov edx, result
    add edx, 11
    sub edx, edi

    mov eax, 4
    mov ebx, 1
    int 0x80

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret




exit_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80