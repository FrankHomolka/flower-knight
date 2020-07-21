//scr_boss_2_death_state

if(!dead) {
    with(instance_create(x,y-10,obj_boss_2_head)) {
        spawnX = other.spawnX;
        spawnY = other.spawnY;
    }
    path_end();
    dead = true;
    sprite_index = spr_boss_2_artillery;
    image_speed = 0.1;
    speed = 0;
    xRange = 192 / 2;
    yRange = 128 / 2;
    attackLength = artilleryAttackLength * 2;
}

if(place_meeting(x,y,obj_player) && attackLength > 0) {
    scr_try_hit_player(10, self);
}

if(attackLength % 4 == 0) {

    xOffset = random_range(-xRange,xRange);
    yOffset = random_range(-yRange,yRange);
    
    // If trying to shoot at least 10 pixels away
    target = instance_create(obj_player.x + xOffset,obj_player.y + yOffset,obj_boss_2_artillery);
    with(instance_create(x,y,obj_boss_2_missile)) {
        target = other.target;
        target_x = target.x;
        target_y = target.y;
    }
    
}

if(attackLength < 0) {
    sprite_index = spr_boss_2_death;
} else {
    attackLength--;
}
