//scr_check_move_player

move_x = 0;
move_y = 0;
image_speed = 0;

if(speedAltered) {
    moveSpeed = alteredMoveSpeed;
} else {
    if(moveSpeed != baseMoveSpeed) {
        moveSpeed = baseMoveSpeed;
        moveSpeedCounter = moveSpeed;
    }   
}

if(moveSpeedCounter < moveSpeed) {
    moveSpeedCounter += 1/10;
}

if(right) {
    if(!place_meeting(x + moveSpeedCounter, y, obj_wall)) {
        move_x++;
    }
}

if(left) {
    if(!place_meeting(x - moveSpeedCounter, y, obj_wall)) {
        move_x--;
    }
}

if(up) {
    if(!place_meeting(x, y - moveSpeedCounter, obj_wall)) {
        move_y--;
    }
}

if(down) {
    if(!place_meeting(x, y + moveSpeedCounter, obj_wall)) {
        move_y++;
    }
}

/* Move the player */
if(move_x != 0 && move_y != 0) {
    x += (move_x * 1 * moveSpeedCounter);
    y += (move_y * 1 * moveSpeedCounter);
} else {
    x += move_x * moveSpeedCounter;
    y += move_y * moveSpeedCounter;
}

/* Set player sprite */
if(move_y == 1) {
    sprite_index = spr_player_down;
} else if(move_y == -1) {
    sprite_index = spr_player_up;
}

if(move_x == 1) {
    sprite_index = spr_player_right;
} else if(move_x == -1) {
    sprite_index = spr_player_left;
}

/* Do if moving */

if(move_y != 0 || move_x != 0) {
    part_emitter_region(walk, emitter, x , x ,  y + 7 , y + 7, ps_shape_ellipse, ps_distr_linear);
    part_emitter_burst(walk, emitter, walkParticle, -8);
    image_speed = walkAnimationSpeed;
} else {
    part_emitter_clear(walk, emitter);
}
