section .data

initial_pin db "1234"
intial_bal dd 10000

    Name_user    db "Enter account name: ", 0
    Name_user_len    equ $ - Name_user
    
    pin_user       db "Enter pin: ", 0
    pin_user_len     equ $ - pin_user
    
    amount_user    db "Enter withdrawal amount: ", 0
    amount_user_len  equ $ - amount_user

   msg_granted     db "ACCESS GRANTED", 10, 0
    msg_granted_len       equ $ - msg_granted
    
      msg_denied      db "ACCESS DENIED", 10, 0
    msg_denied_len      equ $ - msg_denied

    msg_current_balance    db "Current Balance: PHP ", 0
    msg_current_balance_len     equ $ - msg_current_balance

    msg_success     db "WITHDRAWAL SUCCESSFUL", 10, 0
     msg_success_len       equ $ - msg_success

    msg_withdrawn   db "Amount Withdrawn: PHP ", 0
    msg_withdrawn_len     equ $ - msg_withdrawn

    msg_remaining     db "Remaining Balance: PHP ", 0
    msg_remaining_len      equ $ - msg_remaining

    invalid     db "INSUFFICIENT FUNDS", 10, 0
    invalid_len       equ $ - invalid

    funds_error       db "INSUFFICIENT FUNDS", 10, 0
    funds_error_len        equ $ - funds_error

    multiple_error    db "AMOUNT MUST BE A MULTIPLE OF 100", 10, 0
    multiple_error_len     equ $ - multiple_error

    newline         db 10

section .bss
    NAME        resb 100
    NAME_len    resd 1
    
    PIN         resb 10
    PIN_len     resd 1
    
    AMOUNT_str  resb 20
    AMOUNT_len  resd 1
    
    AMOUNT_val  resd 1
    BALANCE     resd 1
    out_buf     resb 16

section .text
    global _start

_start:
    mov eax, [intial_bal]
    mov [BALANCE], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, Name_user
    mov edx, Name_user_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, NAME
    mov edx, 100
    int 0x80

    cmp eax, 0
    jle .save_NAME
    dec eax
    cmp byte [NAME+ eax], 10
    je .save_NAME
    inc eax
.save_NAME:
    mov [NAME_len], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, pin_user
    mov edx, pin_user_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, PIN
    mov edx, 10
    int 0x80

    cmp eax, 0
    jle .save_PIN
    dec eax
    cmp byte [PIN + eax], 10
    je .save_PIN
    inc eax
.save_PIN:
    mov [PIN_len], eax

    cmp dword [PIN_len], 4
    jne .access_denied
    
    mov esi, PIN
    mov edi, initial_pin
    mov ecx, 4
    cld
    repe cmpsb
    jne .access_denied

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_granted
    mov edx, msg_granted_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_current_balance
    mov edx, msg_current_balance_len
    int 0x80

    mov eax, [BALANCE]
    call print_eax

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, amount_user
    mov edx, amount_user_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, AMOUNT_str
    mov edx, 20
    int 0x80

    cmp eax, 0
    jle .save_AMOUNT
    dec eax
    cmp byte [AMOUNT_str + eax], 10
    je .save_AMOUNT
    inc eax
.save_AMOUNT:
    mov [AMOUNT_len], eax

    mov ecx, [AMOUNT_len]
    cmp ecx, 0
    je .invalid_AMOUNT
    
    xor eax, eax
    xor edx, edx
    mov esi, AMOUNT_str
.atoi_loop:
    movzx edx, byte [esi]
    cmp dl, '0'
    jl .invalid_AMOUNT
    cmp dl, '9'
    jg .invalid_AMOUNT
    sub dl, '0'
    imul eax, 10
    add eax, edx
    inc esi
    loop .atoi_loop

    cmp eax, 0
    jle .invalid_AMOUNT
    mov [AMOUNT_val], eax

    mov ebx, [BALANCE]
    cmp eax, ebx
    jg .insufficient_funds

    mov eax, [AMOUNT_val]
    xor edx, edx
    mov ecx, 100
    div ecx
    cmp edx, 0
    jne .not_multiple_100

    mov eax, [BALANCE]
    sub eax, [AMOUNT_val]
    mov [BALANCE], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_success
    mov edx, msg_success_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_withdrawn
    mov edx, msg_withdrawn_len
    int 0x80

    mov eax, [AMOUNT_val]
    call print_eax

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_remaining
    mov edx, msg_remaining_len
    int 0x80

    mov eax, [BALANCE]
    call print_eax

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    jmp .exit_clean

.access_denied:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_denied
    mov edx, msg_denied_len
    int 0x80
    jmp .exit_clean

.invalid_AMOUNT:
    mov eax, 4
    mov ebx, 1
    mov ecx, invalid
    mov edx, invalid_len
    int 0x80
    jmp .exit_clean

.insufficient_funds:
    mov eax, 4
    mov ebx, 1
    mov ecx, funds_error
    mov edx, funds_error_len
    int 0x80
    jmp .exit_clean

.not_multiple_100:
    mov eax, 4
    mov ebx, 1
    mov ecx, multiple_error
    mov edx, multiple_error_len
    int 0x80

.exit_clean:
    mov eax, 1
    mov ebx, 0
    int 0x80

print_eax:
    mov ecx, out_buf
    add ecx, 15
    mov byte [ecx], 0
    mov ebx, 10
.itoa_loop:
    xor edx, edx
    div ebx
    add dl, '0'
    dec ecx
    mov [ecx], dl
    test eax, eax
    jnz .itoa_loop
    
    mov eax, out_buf
    add eax, 15
    sub eax, ecx
    mov edx, eax
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret
