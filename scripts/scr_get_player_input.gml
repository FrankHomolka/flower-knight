///scr_get_player_input
up = keyboard_check(keyUp);
down = keyboard_check(keyDown);
left = keyboard_check(keyLeft);
right = keyboard_check(keyRight);
attack = keyboard_check_pressed(keyAttack);
potion = keyboard_check_pressed(keyPotion);
dodge = keyboard_check_pressed(keyDodge);
interact = keyboard_check_pressed(keyInteract);
restart = keyboard_check_pressed(keyRestart);
close = keyboard_check_pressed(keyClose);

// Store direction of player
scr_get_player_direction();
