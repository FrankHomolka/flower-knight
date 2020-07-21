//scr_focus_thorns_effect

thornsDamage = attackDamage / 2;
if(damageSource != noone) {
    with(damageSource) {
        if(state != states.hit) {
            scr_try_hit_enemy(other.thornsDamage, self, false);
        }
    }
}
