//scr_focus_attack_speed

scr_find_item('ZOOM ZOOM');
if(obj_player.basicAttackLength > 2) {
    if(obj_player.basicAttackLength > 5) {
        obj_player.basicAttackLength--;
    } else {
        obj_player.basicAttackLength -= 0.5;
    }
}

obj_player.basicAttackCounter = obj_player.basicAttackLength;
