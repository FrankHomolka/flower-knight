///scr_boss_2_set_state

/* Death State */
if(hp <= 0) {
    state = states.death;
} else if(foundPlayer) {
    
    state = states.idle;

    /* ---------------WORKING HERE ----------------*/
    
    if(state != states.attack && state != states.attack2) {
        attackCooldownCounter--;
        state = states.idle;
    }
    
    /* Choose attack State */
    if(attackCooldownCounter < 0) 
        state = states.chooseAttack;
        
    /* Hit state */
    if(hit) {
        state = states.hit;
    } else {
        previousState = state;
    }
        
    if(place_meeting(x,y,obj_player_attack) && sprite_index == spr_boss_2) 
        scr_try_hit_enemy(obj_player.attackDamage, self, false);
}

