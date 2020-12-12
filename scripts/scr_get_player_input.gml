///scr_get_player_input
up = keyboard_check(keyUp);
down = keyboard_check(keyDown);
left = keyboard_check(keyLeft);
right = keyboard_check(keyRight);
attack = keyboard_check_pressed(keyAttack);
dodge = keyboard_check_pressed(keyDodge);
interact = keyboard_check_pressed(keyInteract);
restart = keyboard_check_pressed(keyRestart);
close = keyboard_check_pressed(keyClose);
map = keyboard_check_pressed(keyMap);
quests = keyboard_check_pressed(keyQuests);

// Store direction of player
scr_get_player_direction();
