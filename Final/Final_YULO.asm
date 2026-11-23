section .data

filename db 'Certificate.txt', 0


;ascii art
MENU_ART        db"=======================================",0xA
                db"          FANTASY ADVENTURE",0xA
                db"=======================================",0xA
                db".-------------------------.",0xA
                db"|`.                       |A",0xA
                db"|  `.       /\         *  |D",0xA
                db"|    `.     ||            |V",0xA
                db"|      `. Sssssss      *  |E",0xA
                db"|        `|||             |N",0xA
                db"|          ``ss.       *  |T",0xA
                db"|  *           `b         |U",0xA
                db"|        `s.__.s'         |R",0xA
                db"|  *      *_||_*`.        |E",0xA
                db"|           ||    `.      |",0xA
                db"|  *         |      `.    |",0xA
                db"|            *        `.  |",0xA
                db"|            *        `.  |",0xA
                db"|                       `.|",0xA
                db"`...                   ...'",0xA
                db"    ``````.......''''''.",0xA
                
MENU_ART_LEN equ $ - MENU_ART


SHOP_ART db "   ___           ", 0xA
         db " _|___|_  ", 0xA
         db "  `o-o'     ", 0xA
         db "  ( - )  ", 0xA
         db "  _ - _  ", 0xA
         db ".'#-H-#`", 0xA
         db" wanna buy a potion??"
         db"potion for 15 gold?"
         db"[P] pay or [N] no thanks"
SHOP_ART_LEN equ $ - SHOP_ART

SHOP_SUCCESS db"THANK YOU!!!"

SHOP_SUCCESS_LEN equ $ - SHOP_SUCCESS

SHOP_LEAVE db"THANK YOU COME AGAIN!!!"

SHOP_LEAVE_LEN equ $ - SHOP_LEAVE
KING_ART db"°   O   °       °\°/°",0xA
         db"|\_/-\_/|        |+|",0xA
         db"\+__+__+/       @@@@@",0xA     
         db"@  (.).)       (.).)@@@",0xA
         db" \ ,  >\        <   @@@",0xA
         db"  \\__ /         q   @@",0xA
         db"   \ .|          \   /G",0xA
         db" __|   \__        | |",0xA
         db"/  \\  // \      /°°°\",0xA
         db"    \\//        /°°°°°\",0xA
         db"     \/",0xA
         db"Hello Legendary adventurer will you accept this noble quest",0xA
         db"to slay the ancient evil that plagues the land?",0xA



         
   KING_ART_LEN equ $ - KING_ART   

             

GOBLIN_ART            db "          ,      ,", 0xA
                     db '         /(.-""-.)\', 0xA
                     db "     |\  \/      \/  /|", 0xA
                     db "     | \ / =.  .= \ / |",0xA
                     db "      \  \   ^    /  /",0XA
                     db "       \  '-----'  /~",0xA
                     db "A GOBLIN APPEARS!",0xA
                     db "[1] Attack  [2] Defend",0xA
                     db "[3] Use Potion  [4] Run",0xA
   GOBLIN_LEN         equ $ - GOBLIN_ART


CHEST_ART            db "           __________", 0xA
                     db "          /__!!_____/|", 0xA
                     db "         |  _____  | |", 0xA
                     db "         | |  ?  | | |",0xA
                     db "         | |_____| | /",0XA
                     db "         |_________|/",0xA
                     db "[1] Open Chest  [2] Leave Chest",0xA
   CHEST_LEN         equ $ - CHEST_ART

CENTAUR_ART db " <=======]}======",0xA
          db "    --.   /|",0xA
          db '   _\"/_.' ,0xA
          db "  .'._._,.'",0xA
          db "  :/ \{}/",0xA
          db " (L  /--',----._",0xA
          db "     |          \\",0xA
          db "    : /-\ .'-'\ / |",0xA
          db "     \\, ||    \|",0xA
          db "      \/ ||    ||",0xA
          db "YOU ENCOUNTERED A CENTAUR!!",0xA
          db "[1] Attack  [2] Defend",0xA
          db "[3] Use Potion  [4] Run",0xA
CENTAUR_ART_LEN equ $ - CENTAUR_ART


DRAGON_ART          db "        ,     \    /      ,",0xA        
                    db "       / \    )\__/(     / \",0xA        
                    db "      /   \  (_\  /_)   /   \",0xA       
                    db " ____/_____\__\@  @/___/_____\____",0xA  
                    db "|             |\../|              |",0xA 
                    db "|              \VV/               |",0xA
                    db "|        ----------------         |",0xA
                    db "|_________________________________|",0xA
                    db "|    /\ /      \\       \ /\    |  ",0xA
                    db "|  /   V        ))       V   \  |  ",0xA
                    db "|/     `       //        '     \|  ",0xA
                    db "`              V                '  ",0xA

                     db "THE ANCIENT EVIL AWAKENS!",0xA
                     db "[1] Attack  [2] Defend",0xA
                     db "[3] Use Potion  [4] Run",0xA
   DRAGON_LEN         equ $ - DRAGON_ART


ENDING db "__________        _____                    .__    ___________           .___.__                ", 0xA
     db "\______   \ _____/ ____\_ __  ___________  |  |   \_   _____/ ____    __| _/|__| ____    ____  ", 0xA
     db " |       _// __ \   __\  |  \/  ___/\__  \ |  |    |    __)_ /    \  / __ | |  |/    \  / ___\ ", 0xA
     db " |    |   \  ___/|  | |  |  /\___ \  / __ \|  |__  |        \   |  \/ /_/ | |  |   |  \/ /_/  >", 0xA
     db " |____|_  /\___  >__| |____//____  >(____  /____/ /_______  /___|  /\____ | |__|___|  /\___  / ", 0xA
     db "        \/     \/                \/      \/               \/     \/      \/         \//_____/  ", 0xA
     db "I guess your way over your head, best leave it to some other adventurer.... right?",0xA
ENDINGLEN equ $ - ENDING

ENDING2 db "___________                      ___________           .___.__                ", 0xA
      db "\__    ___/______ __ __   ____   \_   _____/ ____    __| _/|__| ____    ____  ", 0xA
      db "  |    |  \_  __ \  |  \_/ __ \   |    __)_ /    \  / __ | |  |/    \  / ___\ ", 0xA
      db "  |    |   |  | \/  |  /\  ___/   |        \   |  \/ /_/ | |  |   |  \/ /_/  >", 0xA
      db "  |____|   |__|  |____/  \___  > /_______  /___|  /\____ | |__|___|  /\___  / ", 0xA
      db "                             \/          \/     \/      \/         \//_____/  ", 0xA
      db " Congratulations you Have completed your quest and brought peace between the once ancient evil to turn a new leaf",0xA

ENDING2LEN equ $ - ENDING2



;player prompts

Accept_dialogue db "then you shall travel through the land through encounters to defeat the evil",0xA

Accept_dialogue_len equ $ - Accept_dialogue

 NAME_PROMPT db "Enter your hero name: "

 NAME_LEN equ $ - NAME_PROMPT

 CLASS_MENU db 10, "Choose your character:", 10
               db "[1] Barbarian", 10
               db "[2] Arch Mage", 10
               db "[3] Legendary Archer", 10
               db "Enter choice: "
    CLASS_LEN equ $ - CLASS_MENU

    INVALID_MSG db "Invalid selection. Try again.", 10
    INVALID_LEN equ $ - INVALID_MSG

    WELCOME_PREFIX db "Welcome, "
    WELCOME_PREFIX_LEN equ $ - WELCOME_PREFIX

    CLASS_BARBARIAN_MSG db "BARBARIAN selected.", 10
    CLASS_BARBARIAN_LEN equ $ - CLASS_BARBARIAN_MSG
    CLASS_ARCHMAGE_MSG db "Mage selected.", 10
    CLASS_ARCHMAGE_LEN equ $ - CLASS_ARCHMAGE_MSG
    CLASS_LEGENDARYARCHER_MSG db "Archer selected.", 10
    CLASS_LEGENDARYARCHER_LEN equ $ - CLASS_LEGENDARYARCHER_MSG


    MAIN_MENU db 10, "===== MAIN MENU =====", 10
              db "[1] Go further into your quest", 10
              db "[2] View Character Status", 10
              db "[3] Use Health Potion", 10
              db "[4] View Inventory", 10
              db"[5] Visit Shop", 10
              db "[6] Exit Game", 10
              db "Enter choice: "
    MAIN_MENU_LEN equ $ - MAIN_MENU

    STATUS_MSG db 10, "Character Status", 10
    STATUS_LEN equ $ - STATUS_MSG

    INVENTORY_MSG db 10, "Inventory", 10
    INVENTORY_LEN equ $ - INVENTORY_MSG

    EXIT_MSG db "Thank you for playing!", 10
    EXIT_LEN equ $ - EXIT_MSG

STATUS_TITLE db 10, "===== CHARACTER STATUS =====", 10
    STATUS_TITLE_LEN equ $ - STATUS_TITLE

    HERO_LABEL db "Hero: "
    HERO_LABEL_LEN equ $ - HERO_LABEL

    HEALTH_LABEL db "Health: "
    HEALTH_LABEL_LEN equ $ - HEALTH_LABEL
    ATTACK_LABEL db "Attack: "

    ATTACK_LABEL_LEN equ $ - ATTACK_LABEL
    POTION_LABEL db "Potions: "

    POTION_LABEL_LEN equ $ - POTION_LABEL
    GOLD_LABEL db "Gold: "

    GOLD_LABEL_LEN equ $ - GOLD_LABEL
    ROOM_LABEL db "Current Stage of the quest: "
    ROOM_LABEL_LEN equ $ - ROOM_LABEL
    
    MAX_HEALTH_LABEL db "Maximum health: "
    MAX_HEALTH_LABEL_LEN equ $ - MAX_HEALTH_LABEL

    INVENTORY_TITLE db 10, "===== INVENTORY =====", 10
    INVENTORY_TITLE_LEN equ $ - INVENTORY_TITLE

    POTION_USED_MSG db "You used a health potion.", 10
    POTION_USED_LEN equ $ - POTION_USED_MSG
    NO_POTIONS_MSG db "You have no potions remaining!", 10
    NO_POTIONS_LEN equ $ - NO_POTIONS_MSG
    HEALTH_FULL_MSG db "Your health is already full. Potion consumed.", 10
    HEALTH_FULL_LEN equ $ - HEALTH_FULL_MSG
    HEALTH_RESTORED_MSG db "Your health has been restored.", 10
    HEALTH_RESTORED_LEN equ $ - HEALTH_RESTORED_MSG

    ATTACK_MSG db "You attack the enemy!", 10
    ATTACK_MSG_LEN equ $ - ATTACK_MSG

    DEFEND_MSG db "You defend against the enemy!", 10
    DEFEND_MSG_LEN equ $ - DEFEND_MSG

    ENEMY_ATTACK_MSG db "The enemy attacks you!", 10
    ENEMY_ATTACK_LEN equ $ - ENEMY_ATTACK_MSG

    ENEMY_DEFEATED_MSG db "Enemy defeated!", 10
    ENEMY_DEFEATED_LEN equ $ - ENEMY_DEFEATED_MSG

    RUN_MSG db "You retreat to the main menu.", 10
    RUN_LEN equ $ - RUN_MSG

    CHEST_OPEN_MSG db "You found 50 gold!", 10
    CHEST_OPEN_LEN equ $ - CHEST_OPEN_MSG

    CHEST_LEAVE_MSG db "You leave the treasure chest.", 10
    CHEST_LEAVE_LEN equ $ - CHEST_LEAVE_MSG

    CHEST_PROMPT db "Enter choice: "
    CHEST_PROMPT_LEN equ $ - CHEST_PROMPT

    COMBAT_PROMPT db "Choose action: "
    COMBAT_PROMPT_LEN equ $ - COMBAT_PROMPT

    GAME_OVER_MSG db 10, "GAME OVER", 10
                  db "Your hero has fallen.", 10
                  db "The Ancient evil remains undefeated.", 10
                  db "BETTER LUCK NEXT TIME!", 10
    GAME_OVER_LEN equ $ - GAME_OVER_MSG

    VICTORY_MSG db 10, "VICTORY!", 10
                db "Congratulations, LEGENDARY hero!", 10
                db "You defeated the dragon and saved the land", 10
                db "Final Gold: "

    VICTORY_PREFIX_LEN equ $ - VICTORY_MSG

    HEALTH_RESULT_MSG db "Remaining Health: "
    HEALTH_RESULT_LEN equ $ - HEALTH_RESULT_MSG

    HERO_WIN_MSG db "YOU ARE A HERO!", 10
    HERO_WIN_LEN equ $ - HERO_WIN_MSG

    GOODBYE_MSG db "Thank you for playing!", 10
    GOODBYE_LEN equ $ - GOODBYE_MSG

   choice_request db "[Y]Yes    [N]No thanks",10
   choice_request_LEN equ $ - choice_request 

    NEWLINE db 10

FILE_SUCCESS db "Certificate saved successfully!", 0xA
FILE_SUCCESS_LEN equ $ - FILE_SUCCESS

FILE_ERROR db "Error: Unable to save certificate.", 0xA
FILE_ERROR_LEN equ $ - FILE_ERROR


READ_TITLE db 10, "===== YOUR CERTIFICATE =====", 10
READ_TITLE_LEN equ $ - READ_TITLE

SHOP_NOT_ENOUGH db "You don't have enough gold!", 0xA
SHOP_NOT_ENOUGH_LEN equ $ - SHOP_NOT_ENOUGH

;macros

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

%macro write_file 2
    mov eax, 4
    mov ebx, [EndingDescriptor]
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .bss
   EndingDescriptor resd 1
    hero_name resb 32
    hero_name_len resd 1
    
    intro_choice resb 2
    class_choice resb 2
    menu_choice resb 2
    combat_choice resb 2
    chest_choice resb 2
    shop_choice resb 2

    player_health resd 1
    max_health resd 1
    player_attack resd 1
    player_potions resd 1
    player_gold resd 1

    enemy_health resd 1
    room_number resd 1
    defending resd 1
    enemy_damage resd 1
   
   certificate_buffer resb 1024
   certificate_len resd 1

    number_buffer resb 12

section .text
    global _start

; =====================================
; PROGRAM ENTRY
; =====================================
_start:
    call display_welcome
    call get_player_info
    call initialize_character
    call display_Royal
    call display_main_menu

; =====================================
; EXIT PROGRAM
; =====================================
exit_program:
    print_text GOODBYE_MSG, GOODBYE_LEN

    mov eax, 1
    xor ebx, ebx
    int 0x80

; =====================================
; DISPLAY WELCOME SCREEN
; =====================================
display_welcome:
    print_text MENU_ART, MENU_ART_LEN
    ret




 
; =====================================
; GET PLAYER NAME AND CLASS
; =====================================
get_player_info:
    print_text NAME_PROMPT, NAME_LEN

    mov eax, 3
    mov ebx, 0
    mov ecx, hero_name
    mov edx, 32
    int 0x80
    mov [hero_name_len], eax

get_class:
    print_text CLASS_MENU, CLASS_LEN

    print_choice class_choice

    mov al, [class_choice]
    cmp al, '1'
    je class_input_valid
    cmp al, '2'
    je class_input_valid
    cmp al, '3'
    je class_input_valid

    call show_invalid
    jmp get_class

class_input_valid:
    ret

; =====================================
; INITIALIZE CHARACTER STATISTICS
; =====================================
initialize_character:
    mov al, [class_choice]

    cmp al, '1'
    je initialize_Barbarian
    cmp al, '2'
    je initialize_Arch_Mage
    cmp al, '3'
    je initialize_Legendary_Archer
    ret

initialize_Barbarian:
    mov dword [player_health], 100
    mov dword [max_health], 100
    mov dword [player_attack], 20
    mov dword [player_potions], 2
    jmp character_initialized

initialize_Arch_Mage:
    mov dword [player_health], 70
    mov dword [max_health], 70
    mov dword [player_attack], 30
    mov dword [player_potions], 3
    jmp character_initialized

initialize_Legendary_Archer:
    mov dword [player_health], 85
    mov dword [max_health], 85
    mov dword [player_attack], 25
    mov dword [player_potions], 2

character_initialized:
    mov dword [player_gold], 0
    mov dword [room_number], 1
    mov dword [defending], 0

    print_text WELCOME_PREFIX, WELCOME_PREFIX_LEN

    print_text hero_name, [hero_name_len]

    mov al, [class_choice]
    cmp al, '1'
    je print_barbarian_class
    cmp al, '2'
    je print_mage_class

    print_text CLASS_LEGENDARYARCHER_MSG, CLASS_LEGENDARYARCHER_LEN
    ret

print_barbarian_class:
    print_text CLASS_BARBARIAN_MSG, CLASS_BARBARIAN_LEN
    ret

print_mage_class:
    print_text CLASS_ARCHMAGE_MSG, CLASS_ARCHMAGE_LEN
    ret
display_shop:
print_text SHOP_ART, SHOP_ART_LEN


    print_choice shop_choice

    mov al, [shop_choice]

    cmp al, 'P'
    je purchase_potion

    cmp al, 'p'
    je purchase_potion

    cmp al, 'N'
    je leave_shop

    cmp al, 'n'
    je leave_shop

    call show_invalid
    jmp display_shop

ret

 


; =====================================
; leaving shop
; =====================================
leave_shop:
print_text SHOP_LEAVE, SHOP_LEAVE_LEN
jmp menu_loop


; =====================================
; DISPLAY ROYAL ROOM and confirmation
; =====================================
display_Royal:
 print_text KING_ART,KING_ART_LEN

    print_text choice_request, choice_request_LEN

    print_choice intro_choice

    mov al, [intro_choice]

    cmp al, 'Y'
    je accept_quest

    cmp al, 'y'
    je accept_quest

    cmp al, 'N'
    je decline_quest

    cmp al, 'n'
    je decline_quest

    call show_invalid
    jmp display_Royal


 accept_quest:
    print_text Accept_dialogue, Accept_dialogue_len
    ret


decline_quest:
      call save_decline
    jmp exit_program
    


file_error:
    print_text FILE_ERROR, FILE_ERROR_LEN
    ret

; =====================================
; MAIN MENU LOOP
; =====================================
display_main_menu:
menu_loop:
    print_text MAIN_MENU, MAIN_MENU_LEN

    print_choice menu_choice

    mov al, [menu_choice]

    cmp al, '1'
    je explore_dungeon
    cmp al, '2'
    je display_status
    cmp al, '3'
    je main_use_potion
    cmp al, '4'
    je display_inventory
    cmp al,'5'
    je display_shop
    cmp al, '6'
    je exit_program

    call show_invalid
    jmp menu_loop

; =====================================
; EXPLORE THE CURRENT ROOM
; stage 1 =Royal room , Stage 2 = Fighting a goblin,
; stage 3 = chest , stage 4 centaur ,stage 5 dragon
; =====================================
explore_dungeon:
    cmp dword [room_number], 1
    je explore_goblin
    cmp dword [room_number], 2
    je explore_chest
     cmp dword [room_number], 3
    je explore_centaur
    cmp dword [room_number], 4
    je explore_dragon

    jmp menu_loop

explore_goblin:
    mov dword [enemy_health], 30
    mov dword [enemy_damage], 10
    call display_goblin
    call battle_enemy

    cmp eax, 0
    je game_over
    cmp eax, 2
    je menu_loop

    mov dword [room_number], 2
    jmp menu_loop

explore_chest:
chest_choice_loop:
    call display_chest

    print_text CHEST_PROMPT, CHEST_PROMPT_LEN

    print_choice chest_choice

    mov al, [chest_choice]
    cmp al, '1'
    je open_chest
    cmp al, '2'
    je leave_chest

    call show_invalid
    jmp chest_choice_loop

open_chest:
    add dword [player_gold], 50

    print_text CHEST_OPEN_MSG, CHEST_OPEN_LEN

    mov dword [room_number], 3
    jmp menu_loop

leave_chest:
    print_text CHEST_LEAVE_MSG, CHEST_LEAVE_LEN

    mov dword [room_number], 3
    jmp menu_loop


explore_centaur:
    mov dword [enemy_health], 70
    mov dword [enemy_damage], 12
    call display_centaur
    call battle_enemy

    cmp eax, 0
    je game_over
    cmp eax, 2
    je menu_loop

    mov dword [room_number], 4
    jmp menu_loop

explore_dragon:
    mov dword [enemy_health], 110
    mov dword [enemy_damage], 15
    call display_dragon
    call battle_enemy

    cmp eax, 0
    je game_over
    cmp eax, 2
    je menu_loop
     
    jmp victory 
    

; =====================================
; DISPLAY ROOM ART
; =====================================
display_goblin:
    print_text GOBLIN_ART, GOBLIN_LEN
    ret

display_chest:
    print_text CHEST_ART, CHEST_LEN
    ret

display_dragon:
    print_text DRAGON_ART, DRAGON_LEN
    ret

display_centaur:
print_text CENTAUR_ART, CENTAUR_ART_LEN
     ret

; =====================================
; BATTLE ENEMY
; Return EAX:
; 0 = player defeated
; 1 = enemy defeated
; 2 = player ran away
; =====================================
battle_enemy:
combat_loop:
    print_text COMBAT_PROMPT, COMBAT_PROMPT_LEN

    print_choice combat_choice

    mov al, [combat_choice]

    cmp al, '1'
    je combat_attack
    cmp al, '2'
    je combat_defend
    cmp al, '3'
    je combat_potion
    cmp al, '4'
    je combat_run

    call show_invalid
    jmp combat_loop

combat_attack:
    print_text ATTACK_MSG, ATTACK_MSG_LEN

    mov eax, [player_attack]
    sub [enemy_health], eax

    cmp dword [enemy_health], 0
    jle enemy_defeated

    ; A living enemy retaliates after an attack.
    call enemy_retaliates
    cmp dword [player_health], 0
    jle player_defeated

    jmp combat_loop

combat_defend:
    mov dword [defending], 1

    print_text DEFEND_MSG, DEFEND_MSG_LEN

    ; Defend reduces the next attack by 5.
    call enemy_retaliates
    cmp dword [player_health], 0
    jle player_defeated

    jmp combat_loop

combat_potion:
    call use_potion
    cmp dword [player_health], 0
    jle player_defeated
    ; The assignment specifies enemy retaliation after
    ; Attack or Defend, so potion use does not trigger it.
    jmp combat_loop

combat_run:
    print_text RUN_MSG, RUN_LEN

    mov eax, 2
    ret

enemy_retaliates:
    print_text ENEMY_ATTACK_MSG, ENEMY_ATTACK_LEN

    mov eax, [enemy_damage]

    cmp dword [defending], 1
    jne apply_enemy_damage

    sub eax, 5
    cmp eax, 0
    jge apply_enemy_damage
    xor eax, eax

apply_enemy_damage:
    mov dword [defending], 0
    sub [player_health], eax

    cmp dword [player_health], 0
    jg enemy_attack_done
    mov dword [player_health], 0

enemy_attack_done:
    ret

enemy_defeated:
    print_text ENEMY_DEFEATED_MSG, ENEMY_DEFEATED_LEN

    mov eax, 1
    ret

player_defeated:
    mov dword [player_health], 0
    xor eax, eax
    ret

; Main-menu potion option: use potion, then return to menu.
main_use_potion:
    call use_potion
    jmp menu_loop

; =====================================
; USE HEALTH POTION
; Restores 20 health, capped at maximum.
; Consumes a potion even at full health.
; =====================================
use_potion:
    cmp dword [player_potions], 0
    jle no_potions

    dec dword [player_potions]

    print_text POTION_USED_MSG, POTION_USED_LEN

    mov eax, [player_health]
    cmp eax, [max_health]
    jge potion_at_full_health

    add eax, 20
    cmp eax, [max_health]
    jle save_potion_health

    mov eax, [max_health]

save_potion_health:
    mov [player_health], eax

    print_text HEALTH_RESTORED_MSG, HEALTH_RESTORED_LEN
    jmp potion_done

potion_at_full_health:
    print_text HEALTH_FULL_MSG, HEALTH_FULL_LEN

potion_done:
    ; Return to the caller. Combat and the main menu
    ; decide where execution continues.
    ret

no_potions:
    print_text NO_POTIONS_MSG, NO_POTIONS_LEN
    ret

; =====================================
; DISPLAY CHARACTER STATUS
; =====================================
display_status:
    print_text STATUS_TITLE, STATUS_TITLE_LEN

    print_text HERO_LABEL, HERO_LABEL_LEN

    print_text hero_name, [hero_name_len]

    print_text HEALTH_LABEL, HEALTH_LABEL_LEN
    mov eax, [player_health]
    call print_uint
    call print_newline

    print_text MAX_HEALTH_LABEL, MAX_HEALTH_LABEL_LEN
    mov eax, [max_health]
    call print_uint
    call print_newline

    print_text ATTACK_LABEL, ATTACK_LABEL_LEN
    mov eax, [player_attack]
    call print_uint
    call print_newline

    print_text POTION_LABEL, POTION_LABEL_LEN
    mov eax, [player_potions]
    call print_uint
    call print_newline

    print_text GOLD_LABEL, GOLD_LABEL_LEN
    mov eax, [player_gold]
    call print_uint
    call print_newline

    print_text ROOM_LABEL, ROOM_LABEL_LEN
    mov eax, [room_number]
    call print_uint
    call print_newline

    jmp menu_loop

; =====================================
; DISPLAY INVENTORY
; =====================================
display_inventory:
    print_text INVENTORY_TITLE, INVENTORY_TITLE_LEN

    print_text POTION_LABEL, POTION_LABEL_LEN
    mov eax, [player_potions]
    call print_uint
    call print_newline

    print_text GOLD_LABEL, GOLD_LABEL_LEN
    mov eax, [player_gold]
    call print_uint
    call print_newline

    jmp menu_loop

; =====================================
; DISPLAY GAME RESULT
; =====================================
game_over:
    print_text GAME_OVER_MSG, GAME_OVER_LEN
    jmp exit_program

victory:
    print_text VICTORY_MSG, VICTORY_PREFIX_LEN

    mov eax, [player_gold]
    call print_uint
    call print_newline

    print_text HEALTH_RESULT_MSG, HEALTH_RESULT_LEN

    mov eax, [player_health]
    call print_uint
    call print_newline

    print_text HERO_WIN_MSG, HERO_WIN_LEN
    call True_Ending
    jmp exit_program

; =====================================
; PRINT INVALID INPUT MESSAGE
; =====================================
show_invalid:
    print_text INVALID_MSG, INVALID_LEN
    ret

; =====================================
; PRINT UNSIGNED INTEGER IN EAX
; Preserves registers with PUSHAD/POPAD.
; =====================================
print_uint:
    pushad

    mov edi, number_buffer
    add edi, 11
    mov byte [edi], 0
    mov ecx, 0

    mov ebx, 10
    cmp eax, 0
    jne convert_number

    dec edi
    mov byte [edi], '0'
    mov ecx, 1
    jmp output_number

convert_number:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    inc ecx
    test eax, eax
    jnz convert_number



output_number:
    mov eax, 4
    mov ebx, 1
    mov edx, ecx
    mov ecx, edi
    int 0x80

    popad
    ret


save_decline:
    

    ; Open or create Certificate.txt
    mov eax, 5
    mov ebx, filename
    mov ecx, 577
    mov edx, 420
    int 0x80

    ; Check if opening failed
    cmp eax, 0
    jl file_error

    ; Store file descriptor
    mov [EndingDescriptor], eax

    ; Write ENDING
    mov eax, 4
    mov ebx, [EndingDescriptor]
    mov ecx, ENDING
    mov edx, ENDINGLEN
    int 0x80

    ; Check if writing failed
    cmp eax, 0
    jl write_error_close

    ; Close file
    mov eax, 6
    mov ebx, [EndingDescriptor]
    int 0x80

    call read_certificate
    ret

read_error_close:
    mov eax, 6
    mov ebx, [EndingDescriptor]
    int 0x80

read_error:
    print_text FILE_ERROR, FILE_ERROR_LEN
    ret

empty_certificate:
    print_text FILE_ERROR, FILE_ERROR_LEN
    ret

write_error_close:
    mov eax, 6
    mov ebx, [EndingDescriptor]
    int 0x80

write_error:
    print_text FILE_ERROR, FILE_ERROR_LEN
    ret

True_Ending:
    
    mov eax, 5
    mov ebx, filename
    mov ecx, 577
    mov edx, 420
    int 0x80

    ; Check if file opened successfully
    cmp eax, 0
    jl file_error

    mov [EndingDescriptor], eax

    write_file ENDING2, ENDING2LEN

    ; Check if writing failed
    cmp eax, 0
    jl write_error_close
  ;call character status
  call status_ending
  

    ; Close file
    mov eax, 6
    mov ebx, [EndingDescriptor]
    int 0x80

    call read_certificate
     
    ret

status_ending:

write_file STATUS_TITLE, STATUS_TITLE_LEN

    write_file HERO_LABEL, HERO_LABEL_LEN
    write_file hero_name, [hero_name_len]

    ; Health
    write_file HEALTH_LABEL, HEALTH_LABEL_LEN
    mov eax, [player_health]
    call convert_and_write
    

    ; Maximum health
    write_file MAX_HEALTH_LABEL, MAX_HEALTH_LABEL_LEN
    mov eax, [max_health]
    call convert_and_write

    ; Attack
    write_file ATTACK_LABEL, ATTACK_LABEL_LEN
    mov eax, [player_attack]
    call convert_and_write

    ; Potions
    write_file POTION_LABEL, POTION_LABEL_LEN
    mov eax, [player_potions]
   call convert_and_write

    ; Gold
    write_file GOLD_LABEL, GOLD_LABEL_LEN
    mov eax, [player_gold]
    call convert_and_write

    ret

convert_and_write:
    pushad

    mov ebx, 10
    mov edi, number_buffer
    add edi, 11

    mov byte [edi], 10
    mov ecx, 1

convert_loop:
    xor edx, edx
    div ebx

    add dl, '0'
    dec edi
    mov [edi], dl

    inc ecx

    cmp eax, 0
    jne convert_loop

    mov eax, 4
    mov ebx, [EndingDescriptor]
    mov edx, ecx
    mov ecx, edi
    int 0x80

    popad
    ret

purchase_potion:
    ; Check if player has enough gold
    cmp dword [player_gold], 15
    jl insufficient_gold

    ; Deduct 15 gold
    sub dword [player_gold], 15

    ; Add one health potion
    inc dword [player_potions]

    print_text SHOP_SUCCESS, SHOP_SUCCESS_LEN

    jmp display_shop


insufficient_gold:
    print_text SHOP_NOT_ENOUGH, SHOP_NOT_ENOUGH_LEN

    jmp display_shop


read_certificate:

    ; Open Certificate.txt
    mov eax, 5
    mov ebx, filename
    mov ecx, 0
    mov edx, 0
    int 0x80

   

    ; Check if opening failed
    cmp eax, 0
    jl read_error

    mov [EndingDescriptor], eax

    ; Read the file
    mov eax, 3
    mov ebx, [EndingDescriptor]
    mov ecx, certificate_buffer
    mov edx, 1024
    int 0x80

    ; Check if reading failed
    cmp eax, 0
    jl read_error_close

    ; Store the number of bytes read
    mov [certificate_len], eax

    ; Close the file
    mov eax, 6
    mov ebx, [EndingDescriptor]
    int 0x80

    ; Display certificate title
    print_text READ_TITLE, READ_TITLE_LEN

    ; Check if file is empty
    cmp dword [certificate_len], 0
    je empty_certificate

    ; Display certificate contents
    mov eax, 4
    mov ebx, 1
    mov ecx, certificate_buffer
    mov edx, [certificate_len]
    int 0x80

    ret

print_newline:
    print_text NEWLINE, 1
    ret

print_proc:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

