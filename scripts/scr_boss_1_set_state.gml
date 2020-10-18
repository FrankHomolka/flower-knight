///scr_boss_1_set_state

/* Death State */
if(hp <= 0) {
    state = states.death;
} else if(foundPlayer) {
    
    /* Chase state */
    state = states.walk;
    
    /* Choose attack State */
    if(attackCooldownCounter < 0) {
        slashAttack = false;
        state = states.chooseAttack;
    }
    
    /* Stunned state */
    if(stunned) {
        state = states.stunned;
    }
    
    if(attacking) {
        state = states.attack;
    }
    
    /* Hit state */
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
        if(state == states.walk || state == states.hit) {
            attackCooldownCounter--;
        }
    }
}
