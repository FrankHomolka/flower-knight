///scr_boss_1_execute_state
switch(state) {
    case states.idle: 
        scr_boss_1_idle_state();
        break;
    case states.walk:
        scr_boss_1_chase_state();
        break;
    case states.attack:
        scr_boss_1_attack_state();
        break;
    case states.hit:
        scr_boss_1_hit_state();
        scr_boss_1_attack_state();
        break; 
    case states.chooseAttack:
        scr_boss_1_choose_attack_state();
        break; 
    case states.stunned:
        scr_boss_1_stunned_state();
        break; 
    case states.death:
        scr_boss_1_death_state();
        break; 
    default:
        scr_boss_1_idle_state();
        break;
    
}
