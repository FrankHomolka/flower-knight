//scr_boss_2_head_chase_state

/* Face player */

sprite_index = spr_boss_2_top;
speed = 2.5;

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
