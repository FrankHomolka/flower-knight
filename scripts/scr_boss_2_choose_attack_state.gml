//scr_boss_2_choose_attack_state


sprite_index = spr_boss_2;

attackCooldownCounter = attackCooldown;
attacking = true;
path_end();

if(currentAttack == "artillery") {
    sprite_index = spr_boss_2_chase;
    currentAttack = "chase";
    attackLength = chaseAttackLength;
} else if(currentAttack == "chase") {
    sprite_index = spr_boss_2_artillery;
    currentAttack = "artillery";
    attackLength = artilleryAttackLength;
}   

