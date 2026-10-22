; Module 5 - Machine Problem 1: Zodiac Horoscope and Fortune Teller
; NASM x86 32-bit Linux using int 0x80
; Build: nasm -f elf32 MP1_Zodiac_Horoscope.asm -o MP1_Zodiac_Horoscope.o
; Link:  ld -m elf_i386 MP1_Zodiac_Horoscope.o -o MP1_Zodiac_Horoscope
; Run:   ./MP1_Zodiac_Horoscope

BITS 32
GLOBAL _start

SECTION .data
welcome db 10,'=======================================',10
        db '       THE MYSTIC ZODIAC ORACLE',10
        db '=======================================',10
        db '               *       *',10
        db '           *      /\      *',10
        db '                 /  \',10
        db '         *      /____\    *',10
        db '                 |  |',10
        db '             *   |__|   *',10
        db '       DISCOVER YOUR DESTINY!',10
        db '=======================================',10,0
ask_name db 'Enter your name: ',0
ask_month db 'Enter birth month (1-12): ',0
ask_day db 'Enter birth day (1-31): ',0
bad_name db 'Please enter a name (max 63 characters).',10,0
bad_month db 'Invalid month. Please enter a number from 1 to 12.',10,0
bad_day db 'Invalid date for that month. Please try again.',10,0
hello db 10,'Welcome, ',0
bang db '!',10,0
zodiac_header db 10,'=======================================',10
              db '         YOUR ZODIAC SIGN',10
              db '=======================================',10,0
sign_label db 'Zodiac Sign: ',0
element_label db 'Element: ',0
symbol_label db 'Symbol: ',0
personality_label db 'Personality: ',0
menu db 10,'============== HOROSCOPE MENU ==============',10
     db '[1] Love and Relationships',10
     db '[2] Career and Studies',10
     db '[3] Health and Wellness',10
     db '[4] Lucky Number and Color',10
     db '[5] View Zodiac Information',10
     db '[6] Exit',10
     db 'Enter your choice: ',0
invalid_choice db 'Invalid selection. Choose 1 to 6.',10,0
return_prompt db 10,'Return to menu? (Y/N): ',0
invalid_yesno db 'Invalid response. Enter Y or N.',10,0
bye db 10,'Thank you for visiting the Mystic Zodiac Oracle!',10,0
love_head db 10,'--- LOVE AND RELATIONSHIPS ---',10,0
career_head db 10,'--- CAREER AND STUDIES ---',10,0
health_head db 10,'--- HEALTH AND WELLNESS ---',10,0
lucky_head db 10,'--- LUCKY NUMBER AND COLOR ---',10,0
lucky_number_label db 'Lucky Number: ',0
lucky_color_label db 'Lucky Color: ',0
nl db 10,0

; January to December number of days (non-leap year; February 29 rejected).
month_days db 31,28,31,30,31,30,31,31,30,31,30,31
; First day of the SECOND zodiac sign in each calendar month.
cutoff_days db 20,19,21,20,21,21,23,23,23,23,22,22
; Zodiac index: 0 Aries, 1 Taurus, 2 Gemini, 3 Cancer, 4 Leo,
; 5 Virgo, 6 Libra, 7 Scorpio, 8 Sagittarius, 9 Capricorn,
; 10 Aquarius, 11 Pisces.
before_sign db 9,10,11,0,1,2,3,4,5,6,7,8
after_sign  db 10,11,0,1,2,3,4,5,6,7,8,9

s0 db 'ARIES',0
s1 db 'TAURUS',0
s2 db 'GEMINI',0
s3 db 'CANCER',0
s4 db 'LEO',0
s5 db 'VIRGO',0
s6 db 'LIBRA',0
s7 db 'SCORPIO',0
s8 db 'SAGITTARIUS',0
s9 db 'CAPRICORN',0
s10 db 'AQUARIUS',0
s11 db 'PISCES',0
sign_names dd s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11

fire db 'Fire',0
earth db 'Earth',0
air db 'Air',0
water db 'Water',0
elements dd fire,earth,air,water,fire,earth,air,water,fire,earth,air,water
sy0 db 'Ram',0
sy1 db 'Bull',0
sy2 db 'Twins',0
sy3 db 'Crab',0
sy4 db 'Lion',0
sy5 db 'Maiden',0
sy6 db 'Scales',0
sy7 db 'Scorpion',0
sy8 db 'Archer',0
sy9 db 'Sea-Goat',0
sy10 db 'Water Bearer',0
sy11 db 'Fish',0
symbols dd sy0,sy1,sy2,sy3,sy4,sy5,sy6,sy7,sy8,sy9,sy10,sy11
p0 db 'Bold, energetic, adventurous.',0
p1 db 'Patient, loyal, dependable.',0
p2 db 'Curious, adaptable, expressive.',0
p3 db 'Caring, intuitive, protective.',0
p4 db 'Confident, creative, courageous.',0
p5 db 'Thoughtful, practical, observant.',0
p6 db 'Fair, friendly, diplomatic.',0
p7 db 'Passionate, determined, perceptive.',0
p8 db 'Optimistic, independent, adventurous.',0
p9 db 'Disciplined, ambitious, responsible.',0
p10 db 'Original, open-minded, imaginative.',0
p11 db 'Compassionate, artistic, sensitive.',0
personalities dd p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11

art0 db '      /\   /\',10,'     /  \_/  \',10,'       (RAM)',10,0
art1 db '     /\_____ /\',10,'    (  o   o  )',10,'     \__ ^ __/',10,0
art2 db '      O     O',10,'     /|\   /|\',10,'     / \   / \',10,0
art3 db '      \  |  /',10,'    --( o o )--',10,'      /  |  \',10,0
art4 db '       /\_/\',10,'      ( o.o )',10,'       > ^ <',10,0
art5 db '        O',10,'       /|\',10,'       / \',10,0
art6 db '    ___     ___',10,'       \___/',10,'        | |',10,'      __|_|__',10,0
art7 db '      /\__/\',10,'     (  ..  )---<',10,'      \/  \/',10,0
art8 db '       /\',10,'   ----->',10,'       \/    (ARROW)',10,0
art9 db '       /\ /\',10,'      (  V  )',10,'       \___/~~',10,0
art10 db '     __[___]__',10,'       \___/  ~~~',10,'        | |  ~~~',10,0
art11 db '      ><((((',10,'    (((()><',10,'      ><((((',10,0
arts dd art0,art1,art2,art3,art4,art5,art6,art7,art8,art9,art10,art11

; Fictional horoscopes: one prediction for every sign/category combination.
l0 db 'Aries, an honest conversation may spark a new connection.',10,0
l1 db 'Taurus, your steady kindness will make someone feel valued.',10,0
l2 db 'Gemini, a thoughtful message could brighten a relationship.',10,0
l3 db 'Cancer, trust your heart while giving others room to speak.',10,0
l4 db 'Leo, your warmth will help a special friendship grow.',10,0
l5 db 'Virgo, a small act of care can speak louder than words.',10,0
l6 db 'Libra, listening carefully may bring harmony to your day.',10,0
l7 db 'Scorpio, openness can build trust with someone important.',10,0
l8 db 'Sagittarius, share an adventure with someone you cherish.',10,0
l9 db 'Capricorn, making time for loved ones will feel rewarding.',10,0
l10 db 'Aquarius, an unexpected conversation may inspire you.',10,0
l11 db 'Pisces, your empathy can deepen a meaningful bond.',10,0
loves dd l0,l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11
c0 db 'Aries, take initiative on a challenging task today.',10,0
c1 db 'Taurus, patient progress will lead to a satisfying result.',10,0
c2 db 'Gemini, your curiosity may unlock a clever solution.',10,0
c3 db 'Cancer, teamwork will help you tackle a difficult lesson.',10,0
c4 db 'Leo, your creativity will help solve a difficult problem.',10,'Stay focused and confident!',10,0
c5 db 'Virgo, careful planning will make your workload easier.',10,0
c6 db 'Libra, collaboration can bring a fresh perspective.',10,0
c7 db 'Scorpio, persistence will pay off on an important project.',10,0
c8 db 'Sagittarius, learning something new will open a door.',10,0
c9 db 'Capricorn, your discipline will impress your teammates.',10,0
c10 db 'Aquarius, a creative idea deserves a chance to shine.',10,0
c11 db 'Pisces, imagination can make an ordinary task special.',10,0
careers dd c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11
h0 db 'Aries, balance your energy with time to rest.',10,0
h1 db 'Taurus, a gentle walk may refresh your mood.',10,0
h2 db 'Gemini, take a screen break and clear your mind.',10,0
h3 db 'Cancer, make time for calm and restorative activities.',10,0
h4 db 'Leo, enjoy some movement and remember to hydrate.',10,0
h5 db 'Virgo, a simple routine may help you feel centered.',10,0
h6 db 'Libra, seek balance between activity and relaxation.',10,0
h7 db 'Scorpio, a peaceful moment may restore your focus.',10,0
h8 db 'Sagittarius, outdoor time can lift your spirits.',10,0
h9 db 'Capricorn, remember that breaks support productivity.',10,0
h10 db 'Aquarius, try a relaxing hobby after your work.',10,0
h11 db 'Pisces, spend a little time on creative self-care.',10,0
healths dd h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11
lucky_numbers db 9,6,5,2,1,7,8,4,3,10,11,12
co0 db 'Red',0
co1 db 'Green',0
co2 db 'Yellow',0
co3 db 'Silver',0
co4 db 'Gold',0
co5 db 'Navy Blue',0
co6 db 'Pink',0
co7 db 'Maroon',0
co8 db 'Purple',0
co9 db 'Brown',0
co10 db 'Turquoise',0
co11 db 'Sea Green',0
colors dd co0,co1,co2,co3,co4,co5,co6,co7,co8,co9,co10,co11

SECTION .bss
name_buf resb 64
input_buf resb 128
birth_month resd 1
birth_day resd 1
zodiac_index resd 1
menu_choice resd 1
num_buf resb 12

SECTION .text
_start:
    call display_welcome
    call get_user_info
    call determine_zodiac
    call display_zodiac_art
.menu_loop:
    call display_menu
    call read_line
    call parse_uint
    jc .invalid_menu
    cmp eax,1
    jl .invalid_menu
    cmp eax,6
    jg .invalid_menu
    mov [menu_choice],eax
    cmp eax,6
    je exit_program
    cmp eax,5
    je .view_zodiac
    call show_horoscope
    jmp .ask_again
.view_zodiac:
    call display_zodiac_art
.ask_again:
    call ask_return
    cmp eax,1
    je .menu_loop
    jmp exit_program
.invalid_menu:
    mov ecx,invalid_choice
    call print_string
    jmp .menu_loop

; Display the first ASCII art design.
display_welcome:
    mov ecx,welcome
    call print_string
    ret

; Read a nonempty name and two numeric inputs.
get_user_info:
.name_again:
    mov ecx,ask_name
    call print_string
    call read_line
    cmp eax,0
    je .invalid_name
    cmp eax,63
    jg .invalid_name
    mov esi,input_buf
    mov edi,name_buf
    mov ecx,eax
    rep movsb
    mov byte [edi],0
    jmp .month_again
.invalid_name:
    mov ecx,bad_name
    call print_string
    jmp .name_again
.month_again:
    mov ecx,ask_month
    call print_string
    call read_line
    call parse_uint
    jc .invalid_month
    cmp eax,1
    jl .invalid_month
    cmp eax,12
    jg .invalid_month
    mov [birth_month],eax
    jmp .day_again
.invalid_month:
    mov ecx,bad_month
    call print_string
    jmp .month_again
.day_again:
    mov ecx,ask_day
    call print_string
    call read_line
    call parse_uint
    jc .invalid_day
    mov [birth_day],eax
    call validate_birthdate
    jc .invalid_day
    mov ecx,hello
    call print_string
    mov ecx,name_buf
    call print_string
    mov ecx,bang
    call print_string
    ret
.invalid_day:
    mov ecx,bad_day
    call print_string
    jmp .day_again

; Output CF=0 if date is valid; CF=1 otherwise.
validate_birthdate:
    mov eax,[birth_month]
    cmp eax,1
    jl .bad
    cmp eax,12
    jg .bad
    mov ebx,[birth_day]
    cmp ebx,1
    jl .bad
    movzx edx,byte [month_days+eax-1]
    cmp ebx,edx
    jg .bad
    clc
    ret
.bad:
    stc
    ret

; Find correct zodiac using monthly cutoff plus signed comparisons.
determine_zodiac:
    mov eax,[birth_month]
    dec eax
    mov ebx,[birth_day]
    movzx edx,byte [cutoff_days+eax]
    cmp ebx,edx
    jge .after
    movzx ecx,byte [before_sign+eax]
    jmp .store
.after:
    movzx ecx,byte [after_sign+eax]
.store:
    mov [zodiac_index],ecx
    ret

; Display sign-specific ASCII art and all requested sign details.
display_zodiac_art:
    push ebx
    mov ebx,[zodiac_index]
    mov ecx,zodiac_header
    call print_string
    mov ecx,[arts+ebx*4]
    call print_string
    mov ecx,sign_label
    call print_string
    mov ecx,[sign_names+ebx*4]
    call print_line
    mov ecx,element_label
    call print_string
    mov ecx,[elements+ebx*4]
    call print_line
    mov ecx,symbol_label
    call print_string
    mov ecx,[symbols+ebx*4]
    call print_line
    mov ecx,personality_label
    call print_string
    mov ecx,[personalities+ebx*4]
    call print_line
    pop ebx
    ret

display_menu:
    mov ecx,menu
    call print_string
    ret

; Uses selected menu option and zodiac index to show fictional predictions.
show_horoscope:
    push ebx
    mov ebx,[zodiac_index]
    mov eax,[menu_choice]
    cmp eax,1
    je .love
    cmp eax,2
    je .career
    cmp eax,3
    je .health
    cmp eax,4
    je .lucky
    jmp .done
.love:
    mov ecx,love_head
    call print_string
    mov ecx,[loves+ebx*4]
    call print_string
    jmp .done
.career:
    mov ecx,career_head
    call print_string
    mov ecx,[careers+ebx*4]
    call print_string
    jmp .done
.health:
    mov ecx,health_head
    call print_string
    mov ecx,[healths+ebx*4]
    call print_string
    jmp .done
.lucky:
    mov ecx,lucky_head
    call print_string
    mov ecx,lucky_number_label
    call print_string
    movzx eax,byte [lucky_numbers+ebx]
    call print_uint
    mov ecx,nl
    call print_string
    mov ecx,lucky_color_label
    call print_string
    mov ecx,[colors+ebx*4]
    call print_line
.done:
    pop ebx
    ret

; Accept Y/y or N/n. Returns EAX=1 for Y, 0 for N.
ask_return:
.again:
    mov ecx,return_prompt
    call print_string
    call read_line
    cmp eax,1
    jne .bad
    mov al,[input_buf]
    cmp al,'Y'
    je .yes
    cmp al,'y'
    je .yes
    cmp al,'N'
    je .no
    cmp al,'n'
    je .no
.bad:
    mov ecx,invalid_yesno
    call print_string
    jmp .again
.yes:
    mov eax,1
    ret
.no:
    xor eax,eax
    ret

exit_program:
    mov ecx,bye
    call print_string
    mov eax,1
    xor ebx,ebx
    int 0x80

; Utility: write null-terminated string at ECX to stdout.
; Preserves all caller registers.
print_string:
    pushad
    mov edi,ecx
    xor edx,edx
.count:
    cmp byte [edi+edx],0
    je .write
    inc edx
    jmp .count
.write:
    mov eax,4
    mov ebx,1
    int 0x80
    popad
    ret

print_line:
    call print_string
    mov ecx,nl
    call print_string
    ret

; Read a line of text, strip its newline, and return length in EAX.
; One byte is read at a time to avoid mixing consecutive input lines.
read_line:
    push ebx
    push ecx
    push edx
    push esi
    xor esi,esi
.loop:
    mov eax,3
    mov ebx,0
    mov ecx,input_buf
    add ecx,esi
    mov edx,1
    int 0x80
    cmp eax,1
    jne .finish
    mov al,[input_buf+esi]
    cmp al,10
    je .finish
    cmp al,13
    je .finish
    cmp esi,126
    jae .discard
    inc esi
    jmp .loop
.discard:
    ; Consume remaining characters without writing outside the buffer.
    mov eax,3
    xor ebx,ebx
    mov ecx,input_buf+127
    mov edx,1
    int 0x80
    cmp eax,1
    jne .finish
    cmp byte [input_buf+127],10
    jne .discard
.finish:
    mov byte [input_buf+esi],0
    mov eax,esi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret

; Strict unsigned decimal conversion. Returns CF=1 if empty/non-digit/overflow.
parse_uint:
    push esi
    push ebx
    mov esi,input_buf
    xor eax,eax
    cmp byte [esi],0
    je .error
.loop:
    movzx ebx,byte [esi]
    test ebx,ebx
    jz .ok
    cmp ebx,'0'
    jb .error
    cmp ebx,'9'
    ja .error
    sub ebx,'0'
    cmp eax,429496729
    ja .error
    jne .multiply
    cmp ebx,5
    ja .error
.multiply:
    imul eax,eax,10
    add eax,ebx
    inc esi
    jmp .loop
.ok:
    clc
    jmp .end
.error:
    stc
.end:
    pop ebx
    pop esi
    ret

; Print unsigned number in EAX (for lucky number).
print_uint:
    pushad
    mov edi,num_buf+11
    mov byte [edi],0
    mov ebx,10
.convert:
    xor edx,edx
    div ebx
    add dl,'0'
    dec edi
    mov [edi],dl
    test eax,eax
    jnz .convert
    mov ecx,edi
    call print_string
    popad
    ret
