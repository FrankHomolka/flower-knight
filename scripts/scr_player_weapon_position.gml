//scr_player_weapon_position

if(state != states.attack) {
    obj_player_weapon.image_angle = 0;
}

/* Facing right */
if(direction_facing == facing.right ||
   direction_facing == facing.upRight ||
   direction_facing == facing.downRight) {
    obj_player_weapon.image_xscale = - 1;
    obj_player_weapon.x = x - 2;
    obj_player_weapon.y = y;
    obj_player_weapon.depth = depth - 1;
} else if(direction_facing == facing.up) {
    obj_player_weapon.depth = depth + 1;
    obj_player_weapon.x = x + 4;
    obj_player_weapon.y = y;
    obj_player_weapon.image_xscale = 1;
}  else if(direction_facing == facing.down) {
    obj_player_weapon.depth = depth - 1;
    obj_player_weapon.x = x - 4;
    obj_player_weapon.y = y;
    obj_player_weapon.image_xscale = 1;
}   else if(direction_facing == facing.left ||
direction_facing == facing.upLeft ||
direction_facing == facing.downLeft) {
    obj_player_weapon.depth = depth - 1;
    obj_player_weapon.image_xscale = 1;
    obj_player_weapon.x = x - 4;
    obj_player_weapon.y = y;
}

