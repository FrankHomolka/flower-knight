//scr_boss_2_choose_attack_state


sprite_index = spr_boss_2;

attackCooldownCounter = attackCooldown;
attacking = true;
path_end();

if(currentAttack == "artillery") {
    currentAttack = "chase";
    attackLength = chaseAttackLength;
} else if(currentAttack == "chase") {
    currentAttack = "artillery";
    attackLength = artilleryAttackLength;
}   

