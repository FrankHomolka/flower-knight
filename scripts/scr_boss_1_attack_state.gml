///scr_boss_1_execute_attack_state
if(attacking) {
    if(currentAttack == "spin" ) {
        scr_boss_1_spin_state();
    } else if(currentAttack == "shockwave" ) {
        scr_boss_1_shockwave_state();
    }
}
