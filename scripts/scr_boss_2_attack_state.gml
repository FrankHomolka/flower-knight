///scr_boss_2_attack_state
if(attacking) {
    if(currentAttack == "chase" ) {
        scr_boss_2_chase_state();
    } else if(currentAttack == "artillery" ) {
        scr_boss_2_artillery_state();
    }
}
