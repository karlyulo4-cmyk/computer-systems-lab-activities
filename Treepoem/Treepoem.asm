section .data


spaces times 40 db ' '

%macro print_spaces 1
    mov eax, 4
    mov ebx, 1
    mov ecx, spaces
    mov edx, %1
    int 0x80
%endmacro


%macro print_text 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro


text1 db "I",10
Text1Len equ $ - text1

text2 db "wrote",10
Text2Len equ $ - text2

text3 db "a poem",10
Text3Len equ $ - text3

text4 db "in the shape",10
Text4Len equ $ - text4

text5 db "of a Christmas",10
Text5Len equ $ - text5

text6 db "tree but then forgot",10
Text6Len equ $ - text6

text7 db "to water it and only a few",10
Text7Len equ $ - text7

text8 db "days",10
Text8Len equ $ - text8

text9 db "later",10
Text9Len equ $ - text9

text10 db 0x0A,0X0A,"there",10
Text10Len equ $ - text10


text11 db "were",10
Text11Len equ $ - text11

text12 db "                  words",10
Text12Len equ $ - text12

text13 db "           all",10
Text13Len equ $ - text13



text14 db "over",10
Text14Len equ $ - text14

text15 db "                      the                                           carpet",10
Text15Len equ $- text15

section .text
    
    global _start

  _start:

print_spaces 39
print_text text1, Text1Len

print_spaces 37
print_text text2, Text2Len

print_spaces 37
print_text text3, Text3Len

print_spaces 33
print_text text4, Text4Len


print_spaces 31
print_text text5, Text5Len

print_spaces 29
print_text text6, Text6Len

print_spaces 27
print_text text7, Text7Len

print_spaces 37
print_text text8, Text8Len
print_spaces 37

print_spaces 37
print_text text9, Text9Len

print_spaces 37
print_text text10, Text10Len


print_spaces 31
print_text text11, Text11Len

print_spaces 37
print_text text12, Text12Len

print_text text13, Text13Len

print_text text14, Text14Len

print_text text15, Text15Len

mov eax, 1
    xor ebx, ebx
    int 0x80