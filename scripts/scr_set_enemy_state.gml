//scr_set_enemy_state

/* Death state */
if(hp <= 0) {
    state = states.death;
} else {
    if(state != states.hit) {
    
        /* Chase state */
        if(distance_to_point(obj_player.x, obj_player.y) < chaseDistance &&
           !collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false)) {
            state = states.walk;
        } else if(state != states.walk){
            /* Idle state */
            state = states.idle;
        }
        
        /* Attack state */
        if(distance_to_point(obj_player.x, obj_player.y) < attackDistance && canAttack &&
        !collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false) && !attacking) {
            attacking = true;
        }
        
        if(attacking) {
            state = states.attack;
        }   
        
        /* Cant immediately attack again */
        if(attackCooldownCounter < 0) {
            canAttack = true;
        }
    }
    
    if(state != states.attack)
        attackCooldownCounter--;
    
    /* Hit state */
    if(tryHit) {
        if(!hit) {
            if(effect) {
                for(i = 0; i < ds_list_size(obj_focus_controller.playerHitEnemyFocusList); i++) {
                    var item = obj_focus_controller.playerHitEnemyFocusList[| i];
                    script_execute(item[? 'effectScript']);
                }
                part_type_direction(enemyHitParticle, point_direction(x, y, obj_player.x, obj_player.y) - 50, point_direction(x, y, obj_player.x, obj_player.y) + 50, 0, 0.2);
                part_emitter_region(enemyHit, enemyHitEmitter, x, x,  y, y, ps_shape_ellipse, ps_distr_linear);
                part_emitter_burst(enemyHit, enemyHitEmitter, enemyHitParticle, random_range(2, 6));
            }
            hit = true;
            currentHp = hp;
        } else {
            damageSource = false;
            tryHit = false;
        }
    }
    
    if(hit) {
        state = states.hit;
    }
    
    /* Forget about player if too far */
    if((distance_to_object(obj_player) > chaseDistance + 10) && state == states.walk) {
        path_end();
        state = states.idle;
    }
    
    /* Player Dead State */
    if(obj_player.state == states.death) {
        path_end();
        state = states.idle;
    } 
} 
