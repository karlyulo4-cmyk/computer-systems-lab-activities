section .data
    Namestudent      db "Enter student name: ", 0
    Namestudent_len    equ $ - Namestudent
    
    student_id        db "Enter student ID: ", 0
    student_id_len     equ $ - student_id
    
    GradeStudent    db "Enter grade: ", 0
    GradeStudent_len  equ $ - GradeStudent

    Namestudent2     db "Student Name: ", 0
    Namestudent2_len    equ $ - Namestudent2
    
    student_id2        db "Student ID: ", 0
    student_id2_len     equ $ - student_id2
    
    GradeStudent2     db "Grade: ", 0
    GradeStudent2_len  equ $ - GradeStudent2
    
    class_student     db "Classification: ", 0
    class_student_len   equ $ - class_student

    student_excellent db "Excellent", 10, 0
    student_excellent_len equ $ - student_excellent
    
    student_veryGood db "Very Good", 10, 0
    student_veryGood_len equ $ - student_veryGood
    
    student_Good      db "Good", 10, 0
   student_Good_len     equ $ - student_Good
    
    student_Passed    db "Passed", 10, 0
    student_Passed_len    equ $ - student_Passed
    
    student_Failed    db "Failed", 10, 0
    student_Failed_len    equ $ - student_Failed
    
    invalid db "INVALID",0
    msg_invalid_len equ $ - invalid

    newline     db 10

section .bss
    Name        resb 100
    Name_len    resd 1
    
    ID          resb 50
    ID_len      resd 1
    
    GRADE_str   resb 10
    GRADE_len   resd 1
    
    GRADE_val   resd 1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, Namestudent
    mov edx, Namestudent_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, Name
    mov edx, 100
    int 0x80

    cmp eax, 0
    jle .save_Name
    dec eax
    cmp byte [Name + eax], 10
    je .save_Name
    inc eax
.save_Name:
    mov [Name_len], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, student_id
    mov edx, student_id_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, ID
    mov edx, 50
    int 0x80

    cmp eax, 0
    jle .save_ID
    dec eax
    cmp byte [ID + eax], 10
    je .save_ID
    inc eax
.save_ID:
    mov [ID_len], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, GradeStudent
    mov edx, GradeStudent_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, GRADE_str
    mov edx, 10
    int 0x80

    cmp eax, 0
    jle .save_Gstr
    dec eax
    cmp byte [GRADE_str + eax], 10
    je .save_Gstr
    inc eax
.save_Gstr:
    mov [GRADE_len], eax

    mov ecx, [GRADE_len]
    cmp ecx, 0
    je .set_invalid
    
    xor eax, eax
    xor edx, edx
    mov esi, GRADE_str
.atoi_loop:

    mov dl, [esi]
    cmp dl, '0'

    jl .set_invalid
    cmp dl, '9'

    jg .set_invalid
    sub dl, '0'
    
    imul eax, 10
    add eax, edx
    inc esi
    loop .atoi_loop
    
    cmp eax, 100
    jg .set_invalid
    mov [GRADE_val], eax
    jmp .print_output

.set_invalid:
    mov dword [GRADE_val], -1

.print_output:
    mov eax, 4
    mov ebx, 1
    mov ecx, Namestudent2 
    mov edx, Namestudent2_len 
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

    mov eax, 4
    mov ebx, 1
    mov ecx, student_id2
    mov edx, student_id2_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ID
    mov edx, [ID_len]
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, GradeStudent2
    mov edx, GradeStudent2_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, GRADE_str
    mov edx, [GRADE_len]
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, class_student
    mov edx, class_student_len
    int 0x80

    mov eax, [GRADE_val]
    cmp eax, -1
    je .invalid_label

    cmp eax, 90
    jge .excellent_label

   
    cmp eax, 85
    jl .check_good
    cmp eax, 89
    jle .very_good_label

.check_good:
    ; Good: 80–84
    cmp eax, 80
    jl .check_passed
    cmp eax, 84
    jle .good_label

.check_passed:
    ; Passed: 75–79
    cmp eax, 75
    jl .failed_label
    cmp eax, 79
    jle .passed_label


.excellent_label:
    mov ecx, student_excellent
    mov edx, student_excellent_len
    jmp .do_print_class

.very_good_label:
    mov ecx, student_veryGood
    mov edx, student_veryGood_len
    jmp .do_print_class

.good_label:
    mov ecx, student_Good
    mov edx, student_Good_len
    jmp .do_print_class

.passed_label:
    mov ecx, student_Passed
    mov edx, student_Passed_len
    jmp .do_print_class

.failed_label:
    mov ecx, student_Failed
    mov edx, student_Failed_len
    jmp .do_print_class

.invalid_label:
    mov ecx, invalid
    mov edx, msg_invalid_len

.do_print_class:
    mov eax, 4
    mov ebx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80