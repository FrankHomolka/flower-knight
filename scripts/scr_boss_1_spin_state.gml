//scr_boss_1_spin_state


/* Done Once */
if(attackLength == spinAttackLength) {
    image_speed = 0.1;
    sprite_index = spr_boss_1_spin;
    attackObject = instance_create(x, y, obj_boss_1_spin);
    with(attackObject) {
        critChance = other.critChance;
    }   
    
    /* Find player position */
    xdiff = abs(obj_player.x - x);
    ydiff = abs(obj_player.y - y);
    
    if(xdiff > ydiff && xdiff > 0) {
        bigger = xdiff;
    } else if(ydiff > xdiff && ydiff > 0) {
        bigger = ydiff;
    } else if(xdiff == ydiff && xdiff > 0) {
        bigger = xdiff;
    } else {
        bigger =  1;
    }
    
    xmove = xdiff / bigger;
    ymove = ydiff / bigger;
    if(x > obj_player.x) {
        xmove *= -1;
    }
    if(y > obj_player.y) {
        ymove *= -1;
    }
}

attackLength--;
attackObject.image_angle += 10;

/* Stop at pit / wall */

if(place_meeting(x + xmove, y + ymove, obj_wall) 
|| place_meeting(x + xmove, y + ymove, obj_pit)) {
    with(attackObject) {
        instance_destroy();
    }
    /* EXIT STATE */
    attacking = false;
    stunned = true;
}

/* Move towards player */
x += xmove * 1.5;
y += ymove * 1.5;

/* EXIT STATE */
if(attackLength < 0) {
    with(attackObject) {
        instance_destroy();
    }
    attacking = false;
    state = states.idle;
}
