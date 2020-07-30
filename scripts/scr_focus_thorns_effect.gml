//scr_focus_thorns_effect


tempDmg = attackDamage / 2;
thornsDamage = 0;

scr_find_item('THORNS');

for(var j = 0; j < item[? 'numBought']; j++) {
    thornsDamage += tempDmg;
    tempDmg = tempDmg / 2;
}

if(damageSource != noone) {
    with(damageSource) {
        if(state != states.hit) {
            scr_try_hit_enemy(other.thornsDamage, self, false);
        }
    }
}
