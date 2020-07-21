//scr_boss_1_choose_attack_state


sprite_index = spr_boss_1;

show_debug_message("choosing attack");

attackCooldownCounter = attackCooldown;
attacking = true;
path_end();

if(currentAttack == "spin") {
    currentAttack = "shockwave";
    attackLength = shockwaveAttackLength;
} else if(currentAttack == "shockwave") {
    currentAttack = "spin";
    attackLength = spinAttackLength;
}   
