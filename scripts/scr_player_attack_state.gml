//scr_player_attack_state

scr_get_global_player_inputs();

if(basicAttackCounter < (0)) {
    scr_check_player_move();
} else {
    scr_player_basic_attack();
}
