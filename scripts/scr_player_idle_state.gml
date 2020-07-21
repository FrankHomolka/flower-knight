//scr_player_idle_state

/* Set sprite based on direction */
switch(direction_facing) {
    case facing.left:
        sprite_index = spr_player_left_idle;
        break;
    case facing.upLeft:
        sprite_index = spr_player_left_idle;
        break;
    case facing.right:
        sprite_index = spr_player_right_idle;
        break;
    case facing.up:
        sprite_index = spr_player_up_idle;
        break;
    case facing.upRight:
        sprite_index = spr_player_right_idle;
        break;
    case facing.down:
        sprite_index = spr_player_down_idle;
        break;
    case facing.downLeft:
        sprite_index = spr_player_left_idle;
        break;
    case facing.downRight:
        sprite_index = spr_player_right_idle;
        break;
}

moveSpeedCounter = moveSpeedStart;

image_speed = idleAnimationSpeed;

scr_get_global_player_inputs();

scr_player_basic_attack();
