section .data
filename db 'Receipt.txt', 0

Price db" A. Rice:Plain Rice        php 5.00",10
      db" B. Rice:Java Rice         php 10.00",10
      db" C. Ulam1: (Fish)          php 35.00",10
      db" D. Ulam2: (Pork)          php 50.00",10
      db" E. Ulam3: (Vegetables)    php 20.00",10
      db" F. Saging con yelo        php 60.00",10    
PriceLen equ $ - Price   

 Rice_Plain dd 5
 Rice_Java dd 10
 Ulam_Fish dd 35
 Ulam_Pork dd 50
 Ulam_Vegetables dd 20
 yelo dd 60

 TotalLabel db "Total Amount: Php "
TotalLabelLen equ $ - TotalLabel

NewLine db 10


ReceiptA db "Plain Rice - Php 5.00", 10
ReceiptALen equ $ - ReceiptA

ReceiptB db "Java Rice - Php 10.00", 10
ReceiptBLen equ $ - ReceiptB

ReceiptC db "Fish - Php 35.00", 10
ReceiptCLen equ $ - ReceiptC

ReceiptD db "Pork - Php 50.00", 10
ReceiptDLen equ $ - ReceiptD

ReceiptE db "Vegetables - Php 20.00", 10
ReceiptELen equ $ - ReceiptE

ReceiptF db "Saging con yelo - Php 60.00", 10
ReceiptFLen equ $ - ReceiptF


  



Menu db"...........Georgette Eatery...........",10
     db": A. Rice:Plain Rice                 :",10
     db": B. Rice:Java Rice                  :",10
     db": C. Ulam1: (Fish)                   :",10
     db": D. Ulam2: (Pork)                   :",10
     db": E. Ulam3: (Vegetables)             :",10
     db": F. Saging con yelo                 :",10 
     
MenuLen equ $ - Menu  


Confirmation db"Do you want to order again? [Y/N]: "

Confirmationlen equ $ - Confirmation

Thanks db"Thank you! Please come again!"

Thankslen equ $ - Thanks

%macro print_text 2
    mov ecx, %1
    mov edx, %2
    call print_proc
%endmacro

%macro print_choice 1
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, 2
    int 0x80
%endmacro


%macro confirm_choice 1
mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, 2
    int 0x80
%endmacro




section .bss

fileDescriptor resd 1

selectedLine resd 1

selectedLineLen resd 1

menu_choice resb 2


foodCount resd 1


; Accumulated total.
    totalFee resd 1
selectedPrice resd 1
continueInput resb 2



numberBuffer resb 12

global _start

section .text



_start:


;intialize total fee
 mov dword [totalFee], 0


mov eax, 5
    mov ebx, filename
    mov ecx, 577
    mov edx, 420
    int 0x80

    mov [fileDescriptor], eax

order_loop:

print_text Price, PriceLen

print_text Menu, MenuLen
 
read_menu_choice:
 print_choice menu_choice


 ; Plain Rice
    cmp byte [menu_choice], 'A'
    je choice_A
    cmp byte [menu_choice], 'a'
    je choice_A
     
     
    ; Java Rice
    cmp byte [menu_choice], 'B'
    je choice_B
    cmp byte [menu_choice], 'b'
    je choice_B

    ; Fish
    cmp byte [menu_choice], 'C'
    je choice_C
    cmp byte [menu_choice], 'c'
    je choice_C

    ; Pork
    cmp byte [menu_choice], 'D'
    je choice_D
    cmp byte [menu_choice], 'd'
    je choice_D

    ; Vegetables
    cmp byte [menu_choice], 'E'
    je choice_E
    cmp byte [menu_choice], 'e'
    je choice_E

    ; Saging con yelo
    cmp byte [menu_choice], 'F'
    je choice_F
    cmp byte [menu_choice], 'f'
    je choice_F

    jmp read_menu_choice

choice_A:
    mov eax, [Rice_Plain]
    mov [selectedPrice], eax
    mov dword [selectedLine], ReceiptA
    mov dword [selectedLineLen], ReceiptALen

    jmp accumulate_total

choice_B:
    mov eax, [Rice_Java]
    mov [selectedPrice], eax
     mov dword [selectedLine], ReceiptB
    mov dword [selectedLineLen], ReceiptBLen

    jmp accumulate_total

choice_C:
    mov eax, [Ulam_Fish]
    mov [selectedPrice], eax
    mov dword [selectedLine], ReceiptC
    mov dword [selectedLineLen], ReceiptCLen

    jmp accumulate_total

choice_D:
    mov eax, [Ulam_Pork]
    mov [selectedPrice], eax

    mov dword [selectedLine], ReceiptD
    mov dword [selectedLineLen], ReceiptDLen
    
    jmp accumulate_total

choice_E:
    mov eax, [Ulam_Vegetables]
    mov [selectedPrice], eax

      mov dword [selectedLine], ReceiptE
    mov dword [selectedLineLen], ReceiptELen

    jmp accumulate_total

choice_F:
    mov eax, [yelo]
    mov [selectedPrice], eax

      mov dword [selectedLine], ReceiptF
    mov dword [selectedLineLen], ReceiptFLen
    jmp accumulate_total



accumulate_total:
    ; Add selected price to total
    mov eax, [totalFee]
    add eax, [selectedPrice]
    mov [totalFee], eax

    ; Write selected food to receipt
    mov eax, 4
    mov ebx, [fileDescriptor]
    mov ecx, [selectedLine]
    mov edx, [selectedLineLen]
    int 0x80

    jmp confirmation_loop
    

confirmation_loop:

    print_text Confirmation, Confirmationlen

    confirm_choice continueInput

    ; Check uppercase Y
    cmp byte [continueInput], 'Y'
    je order_loop

    ; Check lowercase y
    cmp byte [continueInput], 'y'
    je order_loop

    ; Check uppercase N
    cmp byte [continueInput], 'N'
    je exit_program

    ; Check lowercase n
    cmp byte [continueInput], 'n'
    je exit_program

    ; Invalid input
    jmp confirmation_loop


exit_program:

    print_text Thanks, Thankslen

print_text NewLine, 1

    ; Write total label to receipt
    mov eax, 4
    mov ebx, [fileDescriptor]
    mov ecx, TotalLabel
    mov edx, TotalLabelLen
    int 0x80

    ; Convert totalFee into ASCII digits
    mov eax, [totalFee]
    mov ebx, 10
    mov edi, numberBuffer
    add edi, 11

    mov byte [edi], 10
    mov dword [foodCount], 1

convert_total:
    xor edx, edx
    div ebx

    add dl, '0'
    dec edi
    mov [edi], dl

    inc dword [foodCount]

    cmp eax, 0
    jne convert_total

    ; Write converted total to receipt
    mov eax, 4
    mov ebx, [fileDescriptor]
    mov ecx, edi
    mov edx, [foodCount]
    int 0x80

    ; Close receipt file
    mov eax, 6
    mov ebx, [fileDescriptor]
    int 0x80
    


print_proc:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret






