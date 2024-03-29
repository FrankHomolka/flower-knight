//scr_enemy_death

if(!dead) {
    //show_debug_message("KILLED ENEMY id = " + string(id));
    path_end();
    dead = true;
    obj_player.enemiesKilled++;
    if(lastDamageSource == obj_fire) {
        if(instance_exists(obj_quest_controller)) {
            obj_quest_controller.enemiesBurned++;
        }
    }
    image_xscale = 1;
    goldLeft = goldDropOnDeath * goldMultiplier;
    for(var i = 0; i < goldLeft; i++) {
        if(goldLeft > 50) {
            instance_create(x,y,obj_gold_bag);
            goldLeft -= 50;   
        } else {
            instance_create(x,y,obj_enemy_drop);
        }
    }
    if(random(1) < chanceToDropHeart) {
        instance_create(x,y + 20,obj_heart_pickup);
    }
    if(!pit) {
        part_type_direction(enemyHitParticle, point_direction(x, y, obj_player.x, obj_player.y) - 50, point_direction(x, y, obj_player.x, obj_player.y) + 50, 0, 0.2);
        part_emitter_region(enemyHit, enemyHitEmitter, x, x,  y, y, ps_shape_ellipse, ps_distr_linear);
        part_emitter_burst(enemyHit, enemyHitEmitter, enemyHitParticle, random_range(10, 20));
    }
    
}

scr_enemy_knockback();
if(pit) {
    if(image_xscale > 0){
        image_angle += 10;
        image_xscale -= 1/150;
        image_yscale -= 1/150;
    } else {
        instance_destroy();
    }
} else {
    if(image_index > deathSpriteLength) {
        if(destroyOnDeath) {
            if(image_alpha > 0) {
                image_alpha -= 1/200;
            } else {
                instance_destroy();
            }
        }
        image_speed = 0;
    } else {
        image_index = 5 * (1 - (deathCounter / deathTime));
    }

}

deathCounter--;
