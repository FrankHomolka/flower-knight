//scr_boss_2_artillery_state

if(attackLength == artilleryAttackLength) {
    path_end();
    xRange = 192;
    yRange = 128;
}

if(distance_to_point(spawnX,spawnY) > 2) {
    sprite_index = spr_boss_2_walk;
    move_towards_point(spawnX,spawnY,0.5);
} else {
    sprite_index = spr_boss_2_artillery;
    image_speed = 0.3;
    
    if(place_meeting(x,y,obj_player)) {
        scr_try_hit_player(spikeDamage, self);
    }

    speed = 0;
    if(attackLength % 5 == 0) {
    
        xOffset = random_range(-xRange,xRange);
        yOffset = random_range(-yRange,yRange);
        
        // If trying to shoot at least 10 pixels away
        if(abs(xOffset) > 10 && abs(yOffset) > 10) {
            target = instance_create(x + xOffset,y + yOffset,obj_boss_2_artillery);
            with(instance_create(x,y,obj_boss_2_missile)) {
                target = other.target;
                target_x = target.x;
                target_y = target.y;
            }
        }
    }
    
    attackLength--;
    if(attackLength < 0) {
        attackCooldownCounter = attackCooldown;
        state = states.idle;
        attacking = false;
    }
}
