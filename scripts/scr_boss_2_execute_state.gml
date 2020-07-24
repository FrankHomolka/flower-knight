///scr_boss_2_execute_state

/* Execute State */
switch(state) {
    case states.idle: 
        scr_boss_2_idle_state();
        break;
    case states.attack:
        scr_boss_2_attack_state();
        break;
    case states.chooseAttack:
        scr_boss_2_choose_attack_state();
        break; 
    case states.hit:
        scr_boss_2_hit_state();
        scr_boss_2_attack_state();
        break; 
    case states.death:
        scr_boss_2_death_state();
        break; 
    default:
        scr_boss_2_idle_state();
        break;
}
