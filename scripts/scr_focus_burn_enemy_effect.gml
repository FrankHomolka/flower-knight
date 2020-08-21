///scr_focus_burn_enemy_effect

scr_find_item('BURN BABY BURN');
show_debug_message('BURN BABY BURN effect');
fireHitDamage = 0;
for(var j = 0; j < item[? 'numBought']; j++) {
    fireHitDamage += ((obj_player.attackDamage / 2) / (j + 1));
}
with(instance_create(x, y, obj_fire)) {
    hitDamage = other.fireHitDamage;
    target = other;
}
