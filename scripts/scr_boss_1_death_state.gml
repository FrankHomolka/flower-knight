//scr_boss_1_death_state

if(!dead) {
    part_type_direction(enemyHitParticle, point_direction(x, y, obj_player.x, obj_player.y) - 50, point_direction(x, y, obj_player.x, obj_player.y) + 50, 0, 0.2);
    part_emitter_region(enemyHit, enemyHitEmitter, x, x,  y, y, ps_shape_ellipse, ps_distr_linear);
    part_emitter_burst(enemyHit, enemyHitEmitter, enemyHitParticle, random_range(10, 20));
    dead = true;
    instance_create(x,y-15,obj_boss_1_head);
    instance_create(spawnX, spawnY, obj_next_room);
    inFight = false;
    sprite_index = spr_boss_1_death;
    image_speed = 0.05;
                if(instance_exists(obj_quest_controller)) obj_quest_controller.beatBoss1 = true;
    path_end();
    goldLeft = goldDropOnDeath * goldMultiplier;
    for(var i = 0; i < goldLeft; i++) {
        if(goldLeft > 50) {
            instance_create(x,y,obj_gold_bag);
            goldLeft -= 50;   
        } else {
            instance_create(x,y,obj_enemy_drop);
        }
    }
}

if(image_index > image_number - 1)   
    image_speed = 0;
