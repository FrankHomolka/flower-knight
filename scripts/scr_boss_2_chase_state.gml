//scr_boss_2_chase_state

/* Face player */

if(attackLength == chaseAttackLength) {
    sprite_index = spr_boss_2_chase;
    image_speed = 0.1;
    direction = point_direction(x,y,obj_player.x,obj_player.y);
    speed = 2.5;
}

attackLength--;

/* Spawn Slime */
if(attackLength % 5 == 0) {
    with(instance_create(x,y,obj_boss_2_slime)) {
        image_angle = other.direction + 90;
    }
}

//Horizontal bounce
if(place_meeting(x + hspeed, y, obj_wall))
    direction = -direction + 180;

//Vertical bounce
if(place_meeting(x, y + vspeed, obj_wall))
    direction = -direction;
    
/* EXIT STATE */
if(attackLength < 0) {
    speed = 0;
    attacking = false;
    attackCooldownCounter = attackCooldown;
    state = states.idle;
}
