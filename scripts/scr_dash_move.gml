//scr_dash_move


/* Do once */
if(dashCounter == dashTime) {
    audio_play_sound(snd_dash, 10, false);
    x_goal = obj_player_dash.x;
    y_goal = obj_player_dash.y;
    dashDirection = point_direction(x, y,x_goal,y_goal);
    effectCounterMax = 1;
    effectCounter = effectCounterMax;
}

/* Dash attack */
if(attack && dashAttack == false && (dashCounter > (dashTime * 0.8))) {
    dashAttack = true;
    dashAttackObject = instance_create(x,y,obj_player_basic_attack);
}

/* Done for duration of dash */
if(dashCounter > 1.3) {
    
    var xx = lengthdir_x(dashCounter, dashDirection);
    var yy = lengthdir_y(dashCounter, dashDirection);
    
    /* Particle */
    part_emitter_region(walk, emitter, x , x ,  y + 7 , y + 7, ps_shape_ellipse, ps_distr_linear);
    part_emitter_burst(walk, emitter, walkParticle, -2);
    
    /* Check for running into wall */
    if(!place_meeting(x + xx, y, obj_wall)) {
        x += xx;
    } else {
        /* Exit dash if hit wall */
        dashCounter = 0;
    }
    if(!place_meeting(x, y + yy, obj_wall)) {
        y += yy;
    } else {
        /* Exit dash if hit wall */
        dashCounter = 0;
    }
    
    if(instance_exists(dashAttackObject)) {
        with(dashAttackObject) {
            x = other.x;
            y = other.y;
        }
    }
    
    dashCounter -= 1/10;
    
    if(dashTime % 0.5 == 0) {
        with(instance_create(x,y,obj_dash_ghost)) {
            sprite = other.sprite_index;
            index = other.image_index;
        }
    }
    for(i = 0; i < ds_list_size(obj_focus_controller.playerDashingFocusList); i++) {
        var item = obj_focus_controller.playerDashingFocusList[| i];
        script_execute(item[? 'effectScript']);
    }
    
}

/* End State */
if(dashCounter <= 1.3) {
    if(instance_exists(dashAttackObject)) {
        with(dashAttackObject) {
            instance_destroy();
        }
    }
    dashAttack = false;
    isDashing = false;
    dashCounter = dashTime;
    showDodge = false;
    spawnedShowDodge = false;
    state = states.idle;
}
