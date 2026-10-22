section .data

;ascii art
MENU_ART        db"=======================================",0xA
                db"       DUNGEON OF THE LOST KING",0xA
                db"=======================================",0xA
                db"              |>>>>",0xA
                db"              |",0xA
                db"          _  _|_  _",0xA
                db"         |;|_|;|_|;|",0xA
                db"          \.    .  /",0xA
                db"           \:  .  /",0xA
                db"            ||:   |",0xA
                db"            ||:.  |",0xA
                db"            ||:  .|",0xA
                db"       ENTER IF YOU DARE!",0xA
                db"=======================================",0xA
MENU_ART_LEN equ $ - MENU_ART


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
                     db "          /_________/|", 0xA
                     db "         |  _____  | |", 0xA
                     db "         | |  ?  | | |",0xA
                     db "         | |_____| | /",0XA
                     db "         |_________|/",0xA
                     db "[1] Open Chest  [2] Leave Chest",0xA
   CHEST_LEN         equ $ - CHEST_ART

DRAGON_ART            db "               / \  //\", 0xA
                     db "      |\___/|      \", 0xA
                     db "      /0  0  \      |", 0xA
                     db "     /   ^    \    /",0xA
                     db "    /  \___/   \  /",0XA
                     db "    \___________\/",0xA
                     db "THE DRAGON AWAKENS!",0xA
                     db "[1] Attack  [2] Defend",0xA
                     db "[3] Use Potion  [4] Run",0xA
   DRAGON_LEN         equ $ - DRAGON_ART

;player prompts

 NAME_PROMPT db "Enter your hero name: "

 NAME_LEN equ $ - NAME_PROMPT

 CLASS_MENU db 10, "Choose your character:", 10
               db "[1] Warrior", 10
               db "[2] Mage", 10
               db "[3] Archer", 10
               db "Enter choice: "
    CLASS_LEN equ $ - CLASS_MENU

    INVALID_MSG db "Invalid selection. Try again.", 10
    INVALID_LEN equ $ - INVALID_MSG

    WELCOME_PREFIX db "Welcome, "
    WELCOME_PREFIX_LEN equ $ - WELCOME_PREFIX

    CLASS_WARRIOR_MSG db "Warrior selected.", 10
    CLASS_WARRIOR_LEN equ $ - CLASS_WARRIOR_MSG
    CLASS_MAGE_MSG db "Mage selected.", 10
    CLASS_MAGE_LEN equ $ - CLASS_MAGE_MSG
    CLASS_ARCHER_MSG db "Archer selected.", 10
    CLASS_ARCHER_LEN equ $ - CLASS_ARCHER_MSG


    MAIN_MENU db 10, "===== MAIN MENU =====", 10
              db "[1] Explore Dungeon", 10
              db "[2] View Character Status", 10
              db "[3] Use Health Potion", 10
              db "[4] View Inventory", 10
              db "[5] Exit Game", 10
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
    ROOM_LABEL db "Current room: "
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
                  db "The dungeon remains undefeated.", 10
                  db "BETTER LUCK NEXT TIME!", 10
    GAME_OVER_LEN equ $ - GAME_OVER_MSG

    VICTORY_MSG db 10, "VICTORY!", 10
                db "Congratulations, hero!", 10
                db "You defeated the dragon and escaped!", 10
                db "Final Gold: "

    VICTORY_PREFIX_LEN equ $ - VICTORY_MSG

    HEALTH_RESULT_MSG db "Remaining Health: "
    HEALTH_RESULT_LEN equ $ - HEALTH_RESULT_MSG

    HERO_WIN_MSG db "YOU ARE A HERO!", 10
    HERO_WIN_LEN equ $ - HERO_WIN_MSG

    GOODBYE_MSG db "Thank you for playing!", 10
    GOODBYE_LEN equ $ - GOODBYE_MSG

    NEWLINE db 10

section .bss
    hero_name resb 32
    hero_name_len resd 1

    class_choice resb 2
    menu_choice resb 2
    combat_choice resb 2
    chest_choice resb 2

    player_health resd 1
    max_health resd 1
    player_attack resd 1
    player_potions resd 1
    player_gold resd 1

    enemy_health resd 1
    room_number resd 1
    defending resd 1
    enemy_damage resd 1

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
    call display_main_menu

; =====================================
; EXIT PROGRAM
; =====================================
exit_program:
    mov eax, 4
    mov ebx, 1
    mov ecx, GOODBYE_MSG
    mov edx, GOODBYE_LEN
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

; =====================================
; DISPLAY WELCOME SCREEN
; =====================================
display_welcome:
    mov eax, 4
    mov ebx, 1
    mov ecx, MENU_ART
    mov edx, MENU_ART_LEN
    int 0x80
    ret

; =====================================
; GET PLAYER NAME AND CLASS
; =====================================
get_player_info:
    mov eax, 4
    mov ebx, 1
    mov ecx, NAME_PROMPT
    mov edx, NAME_LEN
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, hero_name
    mov edx, 32
    int 0x80
    mov [hero_name_len], eax

get_class:
    mov eax, 4
    mov ebx, 1
    mov ecx, CLASS_MENU
    mov edx, CLASS_LEN
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, class_choice
    mov edx, 2
    int 0x80

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
    je initialize_warrior
    cmp al, '2'
    je initialize_mage
    cmp al, '3'
    je initialize_archer
    ret

initialize_warrior:
    mov dword [player_health], 100
    mov dword [max_health], 100
    mov dword [player_attack], 20
    mov dword [player_potions], 2
    jmp character_initialized

initialize_mage:
    mov dword [player_health], 70
    mov dword [max_health], 70
    mov dword [player_attack], 30
    mov dword [player_potions], 3
    jmp character_initialized

initialize_archer:
    mov dword [player_health], 85
    mov dword [max_health], 85
    mov dword [player_attack], 25
    mov dword [player_potions], 2

character_initialized:
    mov dword [player_gold], 0
    mov dword [room_number], 1
    mov dword [defending], 0

    mov eax, 4
    mov ebx, 1
    mov ecx, WELCOME_PREFIX
    mov edx, WELCOME_PREFIX_LEN
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, hero_name
    mov edx, [hero_name_len]
    int 0x80

    mov al, [class_choice]
    cmp al, '1'
    je print_warrior_class
    cmp al, '2'
    je print_mage_class

    mov eax, 4
    mov ebx, 1
    mov ecx, CLASS_ARCHER_MSG
    mov edx, CLASS_ARCHER_LEN
    int 0x80
    ret

print_warrior_class:
    mov eax, 4
    mov ebx, 1
    mov ecx, CLASS_WARRIOR_MSG
    mov edx, CLASS_WARRIOR_LEN
    int 0x80
    ret

print_mage_class:
    mov eax, 4
    mov ebx, 1
    mov ecx, CLASS_MAGE_MSG
    mov edx, CLASS_MAGE_LEN
    int 0x80
    ret

; =====================================
; MAIN MENU LOOP
; =====================================
display_main_menu:
menu_loop:
    mov eax, 4
    mov ebx, 1
    mov ecx, MAIN_MENU
    mov edx, MAIN_MENU_LEN
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, menu_choice
    mov edx, 2
    int 0x80

    mov al, [menu_choice]

    cmp al, '1'
    je explore_dungeon
    cmp al, '2'
    je display_status
    cmp al, '3'
    je main_use_potion
    cmp al, '4'
    je display_inventory
    cmp al, '5'
    je exit_program

    call show_invalid
    jmp menu_loop

; =====================================
; EXPLORE THE CURRENT ROOM
; Room 1 = Goblin, Room 2 = Chest,
; Room 3 = Dragon
; =====================================
explore_dungeon:
    cmp dword [room_number], 1
    je explore_goblin
    cmp dword [room_number], 2
    je explore_chest
    cmp dword [room_number], 3
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

    mov eax, 4
    mov ebx, 1
    mov ecx, CHEST_PROMPT
    mov edx, CHEST_PROMPT_LEN
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, chest_choice
    mov edx, 2
    int 0x80

    mov al, [chest_choice]
    cmp al, '1'
    je open_chest
    cmp al, '2'
    je leave_chest

    call show_invalid
    jmp chest_choice_loop

open_chest:
    add dword [player_gold], 50

    mov eax, 4
    mov ebx, 1
    mov ecx, CHEST_OPEN_MSG
    mov edx, CHEST_OPEN_LEN
    int 0x80

    mov dword [room_number], 3
    jmp menu_loop

leave_chest:
    mov eax, 4
    mov ebx, 1
    mov ecx, CHEST_LEAVE_MSG
    mov edx, CHEST_LEAVE_LEN
    int 0x80

    mov dword [room_number], 3
    jmp menu_loop

explore_dragon:
    mov dword [enemy_health], 60
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
    mov eax, 4
    mov ebx, 1
    mov ecx, GOBLIN_ART
    mov edx, GOBLIN_LEN
    int 0x80
    ret

display_chest:
    mov eax, 4
    mov ebx, 1
    mov ecx, CHEST_ART
    mov edx, CHEST_LEN
    int 0x80
    ret

display_dragon:
    mov eax, 4
    mov ebx, 1
    mov ecx, DRAGON_ART
    mov edx, DRAGON_LEN
    int 0x80
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
    mov eax, 4
    mov ebx, 1
    mov ecx, COMBAT_PROMPT
    mov edx, COMBAT_PROMPT_LEN
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, combat_choice
    mov edx, 2
    int 0x80

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
    mov eax, 4
    mov ebx, 1
    mov ecx, ATTACK_MSG
    mov edx, ATTACK_MSG_LEN
    int 0x80

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

    mov eax, 4
    mov ebx, 1
    mov ecx, DEFEND_MSG
    mov edx, DEFEND_MSG_LEN
    int 0x80

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
    mov eax, 4
    mov ebx, 1
    mov ecx, RUN_MSG
    mov edx, RUN_LEN
    int 0x80

    mov eax, 2
    ret

enemy_retaliates:
    mov eax, 4
    mov ebx, 1
    mov ecx, ENEMY_ATTACK_MSG
    mov edx, ENEMY_ATTACK_LEN
    int 0x80

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
    mov eax, 4
    mov ebx, 1
    mov ecx, ENEMY_DEFEATED_MSG
    mov edx, ENEMY_DEFEATED_LEN
    int 0x80

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

    mov eax, 4
    mov ebx, 1
    mov ecx, POTION_USED_MSG
    mov edx, POTION_USED_LEN
    int 0x80

    mov eax, [player_health]
    cmp eax, [max_health]
    jge potion_at_full_health

    add eax, 20
    cmp eax, [max_health]
    jle save_potion_health

    mov eax, [max_health]

save_potion_health:
    mov [player_health], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, HEALTH_RESTORED_MSG
    mov edx, HEALTH_RESTORED_LEN
    int 0x80
    jmp potion_done

potion_at_full_health:
    mov eax, 4
    mov ebx, 1
    mov ecx, HEALTH_FULL_MSG
    mov edx, HEALTH_FULL_LEN
    int 0x80

potion_done:
    ; Return to the caller. Combat and the main menu
    ; decide where execution continues.
    ret

no_potions:
    mov eax, 4
    mov ebx, 1
    mov ecx, NO_POTIONS_MSG
    mov edx, NO_POTIONS_LEN
    int 0x80
    ret

; =====================================
; DISPLAY CHARACTER STATUS
; =====================================
display_status:
    mov eax, 4
    mov ebx, 1
    mov ecx, STATUS_TITLE
    mov edx, STATUS_TITLE_LEN
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, HERO_LABEL
    mov edx, HERO_LABEL_LEN
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, hero_name
    mov edx, [hero_name_len]
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, HEALTH_LABEL
    mov edx, HEALTH_LABEL_LEN
    int 0x80
    mov eax, [player_health]
    call print_uint
    call print_newline

    mov eax, 4
    mov ebx, 1
    mov ecx, MAX_HEALTH_LABEL
    mov edx, MAX_HEALTH_LABEL_LEN
    int 0x80
    mov eax, [max_health]
    call print_uint
    call print_newline

    mov eax, 4
    mov ebx, 1
    mov ecx, ATTACK_LABEL
    mov edx, ATTACK_LABEL_LEN
    int 0x80
    mov eax, [player_attack]
    call print_uint
    call print_newline

    mov eax, 4
    mov ebx, 1
    mov ecx, POTION_LABEL
    mov edx, POTION_LABEL_LEN
    int 0x80
    mov eax, [player_potions]
    call print_uint
    call print_newline

    mov eax, 4
    mov ebx, 1
    mov ecx, GOLD_LABEL
    mov edx, GOLD_LABEL_LEN
    int 0x80
    mov eax, [player_gold]
    call print_uint
    call print_newline

    mov eax, 4
    mov ebx, 1
    mov ecx, ROOM_LABEL
    mov edx, ROOM_LABEL_LEN
    int 0x80
    mov eax, [room_number]
    call print_uint
    call print_newline

    jmp menu_loop

; =====================================
; DISPLAY INVENTORY
; =====================================
display_inventory:
    mov eax, 4
    mov ebx, 1
    mov ecx, INVENTORY_TITLE
    mov edx, INVENTORY_TITLE_LEN
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, POTION_LABEL
    mov edx, POTION_LABEL_LEN
    int 0x80
    mov eax, [player_potions]
    call print_uint
    call print_newline

    mov eax, 4
    mov ebx, 1
    mov ecx, GOLD_LABEL
    mov edx, GOLD_LABEL_LEN
    int 0x80
    mov eax, [player_gold]
    call print_uint
    call print_newline

    jmp menu_loop

; =====================================
; DISPLAY GAME RESULT
; =====================================
game_over:
    mov eax, 4
    mov ebx, 1
    mov ecx, GAME_OVER_MSG
    mov edx, GAME_OVER_LEN
    int 0x80
    jmp exit_program

victory:
    mov eax, 4
    mov ebx, 1
    mov ecx, VICTORY_MSG
    mov edx, VICTORY_PREFIX_LEN
    int 0x80

    mov eax, [player_gold]
    call print_uint
    call print_newline

    mov eax, 4
    mov ebx, 1
    mov ecx, HEALTH_RESULT_MSG
    mov edx, HEALTH_RESULT_LEN
    int 0x80

    mov eax, [player_health]
    call print_uint
    call print_newline

    mov eax, 4
    mov ebx, 1
    mov ecx, HERO_WIN_MSG
    mov edx, HERO_WIN_LEN
    int 0x80
    jmp exit_program

; =====================================
; PRINT INVALID INPUT MESSAGE
; =====================================
show_invalid:
    mov eax, 4
    mov ebx, 1
    mov ecx, INVALID_MSG
    mov edx, INVALID_LEN
    int 0x80
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

print_newline:
    mov eax, 4
    mov ebx, 1
    mov ecx, NEWLINE
    mov edx, 1
    int 0x80
    ret