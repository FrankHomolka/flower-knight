///scr_boss_2_set_state

/* Death State */
if(hp <= 0) {
    state = states.death;
} else if(foundPlayer) {
    
    /* Idle State */
    state = states.idle;
    
    /* Choose attack State */
    if(attackCooldownCounter < 0) 
        state = states.chooseAttack;
    
    if(attacking) {
        state = states.attack;
    }
    
    /* Hit state */
    if(sprite_index != spr_boss_2)
        tryHit = false;
    if(tryHit) {
        if(!hit) {
            previousState = state;
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
    
    /* Cooldown between attacks */
    if(!attacking) {
        if(state == states.idle || state == states.hit) {
            attackCooldownCounter--;
        }
    }
}

