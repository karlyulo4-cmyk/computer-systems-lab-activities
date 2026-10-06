section .data

  title db "WOLF", 10
    titleLen equ $ - title
 
    line1 db "        _", 10
    line1Len equ $ -  line1
 
    line2 db "       / \      _-'", 10
    line2Len equ $ - line2
 
    line3 db "__-' { |          \", 10
    line3Len equ $ - line3
 
    line4 db "    /             \", 10
    line4Len equ $ - line4
 
    line5 db '    /       "#.  |# }', 10
    line5Len equ $ - line5
 
   line6 db "    |            \ ;", 10
    line6Len equ $ - line6
 

    line7 db "                  ',", 10
   line7Len equ $ - line7
 
  line8 db "       \_         __\", 10
    line8Len equ $ - line8

  line9 db "         ''-_    \.//", 10
     line9Len equ $ -  line9

   line10 db "           / '-____'", 10
    line10Len equ $ - line10
    

    line11 db "         /", 10
    line11Len equ $ - line11

     line12 db "        _'", 10
    line12Len equ $ - line12

  line13 db "      _-'", 10
    line13Len equ $ - line13

newLine db 10


 section .text
 
    global  _start
 
_start:
 ; -------------------------------
    ; pritns title "wolf"
    ; -------------------------------
   
    mov ecx, title
    mov edx, titleLen
    call printString


 ; -------------------------------
    ; Print newline
    ; Using a loop
    ; -------------------------------

   mov esi, 2          ; print spaces 2 times
 
spaceLoop:
 
    call printSpaces
 
    dec esi
    jnz spaceLoop
 
    

    ; -------------------------------
    ; pritns wolf head
    ; -------------------------------

    mov ecx, line1
    mov edx, line1Len
    call printString
 
    mov ecx, line2
    mov edx, line2Len
    call printString
 
    mov ecx, line3
    mov edx, line3Len
    call printString
 
    mov ecx, line4
    mov edx, line4Len
    call printString
 
    mov ecx, line5
    mov edx, line5Len
    call printString

    mov ecx, line6
    mov edx, line6Len
    call printString
   

   
    mov ecx, line7
    mov edx, line7Len
    call printString
   
     mov ecx, line8
    mov edx, line8Len
    call printString

 mov ecx, line9
    mov edx, line9Len
    call printString

     mov ecx, line10
    mov edx, line10Len
    call printString

     mov ecx, line11
    mov edx, line11Len
    call printString

    mov ecx, line12
    mov edx, line12Len
    call printString

    mov ecx, line13
    mov edx, line13Len
    call printString


mov eax, 1        
    mov ebx, 0
    int 0x80


printString:
 
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    int 0x80


    ret

printSpaces:

mov edi, 2

spaceprintLoop:
 
    push edi
 
    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, 1
    int 0x80
 
    pop edi
 
    dec edi
    jnz spaceprintLoop
 
    ret
