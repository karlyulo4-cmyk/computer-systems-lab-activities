
%define MAX_SUBJECTS 10

section .data
    header db "===== TUITION FEE COR =====", 10
    headerLen equ $ - header

    newline db 10
    newlineLen equ $ - newline

    subjectPrompt db "Enter subject name: "
    subjectPromptLen equ $ - subjectPrompt

    coursePrompt db "Enter course code: "
    coursePromptLen equ $ - coursePrompt

    sectionPrompt db "Enter section: "
    sectionPromptLen equ $ - sectionPrompt

    daysPrompt db "Enter assigned days: "
    daysPromptLen equ $ - daysPrompt

    timePrompt db "Enter class time: "
    timePromptLen equ $ - timePrompt

    typePrompt db "Subject type (C/N/G): "
    typePromptLen equ $ - typePrompt

    typeChoices db "C = Computer Laboratory", 10
                db "N = Normal Subject", 10
                db "G = General/Science Laboratory", 10
    typeChoicesLen equ $ - typeChoices

    unitsPrompt db "Enter number of units: "
    unitsPromptLen equ $ - unitsPrompt

    continuePrompt db "Add another subject? (Y/N): "
    continuePromptLen equ $ - continuePrompt

    tuition_rate dd 2108
    computerlab dd 4008
    sciencelab dd 4104
    Idvalidate dd 80

    detailsTitle db 10, "========== ALL SUBJECTS ==========", 10
    detailsTitleLen equ $ - detailsTitle

    subjectLabel db 10, "Subject #"
    subjectLabelLen equ $ - subjectLabel

    nameLabel db "Subject name: "
    nameLabelLen equ $ - nameLabel

    codeLabel db "Course code: "
    codeLabelLen equ $ - codeLabel

    sectionLabel db "Section: "
    sectionLabelLen equ $ - sectionLabel

    daysLabel db "Days: "
    daysLabelLen equ $ - daysLabel

    timeLabel db "Time: "
    timeLabelLen equ $ - timeLabel

    typeLabel db "Type: "
    typeLabelLen equ $ - typeLabel

    unitsLabel db "Units: "
    unitsLabelLen equ $ - unitsLabel

    tuitionLabel db "Tuition fee: "
    tuitionLabelLen equ $ - tuitionLabel

    labLabel db "Laboratory fee: "
    labLabelLen equ $ - labLabel

    summaryTitle db 10, "========== ACCUMULATED TOTAL ==========", 10
    summaryTitleLen equ $ - summaryTitle

    totalUnitsLabel db "Total units: "
    totalUnitsLabelLen equ $ - totalUnitsLabel

    totalTuitionLabel db "Total tuition fees: "
    totalTuitionLabelLen equ $ - totalTuitionLabel

    totalComputerLabel db "Total computer laboratory fees: "
    totalComputerLabelLen equ $ - totalComputerLabel

    totalScienceLabel db "Total science laboratory fees: "
    totalScienceLabelLen equ $ - totalScienceLabel

    idLabel db "ID validation fee: "
    idLabelLen equ $ - idLabel

    grandLabel db "GRAND TOTAL: "
    grandLabelLen equ $ - grandLabel


; Print a string using its address and length.
%macro print_text 2
    mov ecx, %1
    mov edx, %2
    call print_proc
%endmacro


; Read one input into the selected subject's buffer.
; Arguments: prompt, prompt length, buffer, slot size, read size.
%macro read_field 5
    print_text %1, %2

    mov eax, esi
    imul eax, %4
    mov ecx, %3
    add ecx, eax

    mov eax, 3
    mov ebx, 0
    mov edx, %5
    int 0x80
%endmacro


; Display one stored string for the selected subject.
%macro display_field 4
    print_text %1, %2

    mov eax, esi
    imul eax, %4
    mov ecx, %3
    add ecx, eax
    call print_input

    print_text newline, newlineLen
%endmacro


section .bss
    ; Ten subject-name slots, 40 bytes each.
    subjectname resb 400

    ; Ten course-code slots, 40 bytes each.
    subjectCode resb 400

    ; Ten section slots, 20 bytes each.
    sectioncode resb 200

    ; Ten days slots, 40 bytes each.
    daysInput resb 400

    ; Ten time slots, 40 bytes each.
    timeInput resb 400

    ; Four bytes per subject for the type input.
    subjectType resb 40

    ; Twelve bytes per subject for unit input.
    unitsInput resb 120

    continueInput resb 4

    ; Numerical data for each subject.
    units resd MAX_SUBJECTS
    tuitionFee resd MAX_SUBJECTS
    labFee resd MAX_SUBJECTS

    ; Accumulated totals.
    subjectCount resd 1
    totalUnits resd 1
    totalTuition resd 1
    totalComputerLab resd 1
    totalScienceLab resd 1
    totalFee resd 1

    numberBuffer resb 12


global _start
section .text

_start:
    print_text header, headerLen

    ; Initialize accumulated totals.
    mov dword [subjectCount], 0
    mov dword [totalUnits], 0
    mov dword [totalTuition], 0
    mov dword [totalComputerLab], 0
    mov dword [totalScienceLab], 0
    mov dword [totalFee], 0

    ; ESI is the current subject index, starting at zero.
    xor esi, esi


; ========================================
; INPUT ONE SUBJECT
; ========================================
subject_loop:

    read_field subjectPrompt, subjectPromptLen, subjectname, 40, 40

    read_field coursePrompt, coursePromptLen, subjectCode, 40, 40

    read_field sectionPrompt, sectionPromptLen, sectioncode, 20, 20

    read_field daysPrompt, daysPromptLen, daysInput, 40, 40

    read_field timePrompt, timePromptLen, timeInput, 40, 40

    print_text typeChoices, typeChoicesLen
    read_field typePrompt, typePromptLen, subjectType, 4, 4

    read_field unitsPrompt, unitsPromptLen, unitsInput, 12, 12


; ========================================
; CONVERT UNITS INPUT TO AN INTEGER
; ========================================
    mov eax, esi
    imul eax, 12
    mov edi, unitsInput
    add edi, eax

    xor eax, eax

parse_units:
    movzx ebx, byte [edi]

    cmp bl, 10
    je units_parsed

    cmp bl, 0
    je units_parsed

    cmp bl, '0'
    jb units_parsed

    cmp bl, '9'
    ja units_parsed

    imul eax, eax, 10
    sub ebx, '0'
    add eax, ebx

    inc edi
    jmp parse_units

units_parsed:
    mov [units + esi*4], eax

    ; Calculate this subject's tuition fee.
    imul eax, dword [tuition_rate]
    mov [tuitionFee + esi*4], eax

    ; Accumulate total units and tuition.
    mov eax, [totalUnits]
    add eax, [units + esi*4]
    mov [totalUnits], eax

    mov eax, [totalTuition]
    add eax, [tuitionFee + esi*4]
    mov [totalTuition], eax


; ========================================
; CALCULATE THIS SUBJECT'S LAB FEE
; ========================================
    mov dword [labFee + esi*4], 0

    mov eax, esi
    imul eax, 4
    mov edi, subjectType
    mov bl, [edi + eax]

    cmp bl, 'C'
    je calculate_computer_lab

    cmp bl, 'G'
    je calculate_science_lab

    ; Normal subject: no laboratory fee.
    jmp ask_another


calculate_computer_lab:
    mov eax, [computerlab]
    mov [labFee + esi*4], eax

    mov eax, [totalComputerLab]
    add eax, [labFee + esi*4]
    mov [totalComputerLab], eax

    jmp ask_another


calculate_science_lab:
    mov eax, [sciencelab]
    mov [labFee + esi*4], eax

    mov eax, [totalScienceLab]
    add eax, [labFee + esi*4]
    mov [totalScienceLab], eax


; ========================================
; ASK WHETHER TO ADD ANOTHER SUBJECT
; ========================================
ask_another:
    ; The number of entered subjects is index + 1.
    mov eax, esi
    inc eax
    mov [subjectCount], eax

    ; If all ten slots are used, show the COR.
    cmp eax, MAX_SUBJECTS
    jae display_all_subjects

    print_text continuePrompt, continuePromptLen

    mov eax, 3
    mov ebx, 0
    mov ecx, continueInput
    mov edx, 4
    int 0x80

    cmp byte [continueInput], 'Y'
    je add_next_subject

    cmp byte [continueInput], 'y'
    je add_next_subject

    jmp display_all_subjects


add_next_subject:
    inc esi
    jmp subject_loop


; ========================================
; DISPLAY EVERY SUBJECT AFTER INPUT ENDS
; ========================================
display_all_subjects:
    print_text detailsTitle, detailsTitleLen

    xor esi, esi

display_subject_loop:
    cmp esi, [subjectCount]
    jae display_totals

    ; Display subject number.
    print_text subjectLabel, subjectLabelLen

    mov eax, esi
    inc eax
    call print_number
    print_text newline, newlineLen

    ; Display all stored subject information.
    display_field nameLabel, nameLabelLen, subjectname, 40

    display_field codeLabel, codeLabelLen, subjectCode, 40

    display_field sectionLabel, sectionLabelLen, sectioncode, 20

    display_field daysLabel, daysLabelLen, daysInput, 40

    display_field timeLabel, timeLabelLen, timeInput, 40

    display_field typeLabel, typeLabelLen, subjectType, 4

    ; Display units.
    print_text unitsLabel, unitsLabelLen
    mov eax, [units + esi*4]
    call print_number
    print_text newline, newlineLen

    ; Display tuition fee.
    print_text tuitionLabel, tuitionLabelLen
    mov eax, [tuitionFee + esi*4]
    call print_number
    print_text newline, newlineLen

    ; Display laboratory fee.
    print_text labLabel, labLabelLen
    mov eax, [labFee + esi*4]
    call print_number
    print_text newline, newlineLen

    inc esi
    jmp display_subject_loop


; ========================================
; DISPLAY ACCUMULATED TOTALS
; ========================================
display_totals:
    print_text summaryTitle, summaryTitleLen

    print_text totalUnitsLabel, totalUnitsLabelLen
    mov eax, [totalUnits]
    call print_number
    print_text newline, newlineLen

    print_text totalTuitionLabel, totalTuitionLabelLen
    mov eax, [totalTuition]
    call print_number
    print_text newline, newlineLen

    print_text totalComputerLabel, totalComputerLabelLen
    mov eax, [totalComputerLab]
    call print_number
    print_text newline, newlineLen

    print_text totalScienceLabel, totalScienceLabelLen
    mov eax, [totalScienceLab]
    call print_number
    print_text newline, newlineLen

    ; Charge ID validation once for the entire COR.
    print_text idLabel, idLabelLen
    mov eax, [Idvalidate]
    call print_number
    print_text newline, newlineLen

    ; Calculate grand total.
    mov eax, [totalTuition]
    add eax, [totalComputerLab]
    add eax, [totalScienceLab]
    add eax, [Idvalidate]
    mov [totalFee], eax

    print_text grandLabel, grandLabelLen
    mov eax, [totalFee]
    call print_number
    print_text newline, newlineLen

    ; Exit Linux program.
    mov eax, 1
    xor ebx, ebx
    int 0x80


; ========================================
; PROCEDURE: PRINT STRING
; ECX = string address
; EDX = string length
; ========================================
print_proc:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret


; ========================================
; PROCEDURE: PRINT INPUT STRING
; ECX = buffer address
; Stops at newline or NUL.
; ========================================
print_input:
    mov edi, ecx
    xor edx, edx

scan_input:
    mov al, [edi + edx]

    cmp al, 10
    je input_ready

    cmp al, 0
    je input_ready

    inc edx
    jmp scan_input

input_ready:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret


; ========================================
; PROCEDURE: PRINT UNSIGNED INTEGER
; EAX = number to display
; ========================================
print_number:
    mov edi, numberBuffer
    add edi, 11

    mov byte [edi], 0
    dec edi

    cmp eax, 0
    jne convert_number

    mov byte [edi], '0'
    jmp number_ready

convert_number:
    xor edx, edx
    mov ebx, 10
    div ebx

    add dl, '0'
    mov [edi], dl
    dec edi

    test eax, eax
    jnz convert_number

    inc edi

number_ready:
    mov ecx, edi
    mov edx, numberBuffer
    add edx, 11
    sub edx, ecx

    mov eax, 4
    mov ebx, 1
    int 0x80
    ret
