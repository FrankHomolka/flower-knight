//scr_boss_1_shockwave_state

sprite_index = spr_boss_1;

if(attackLength == shockwaveAttackLength) {
    path_end();
}

if(attackLength % 80 == 0) {
    with(instance_create(x,y,obj_boss_1_shockwave)) {
        critChance = other.critChance;
    }
}

attackLength--;
if(attackLength < 0) {
    attacking = false;
    state = states.idle;
}
