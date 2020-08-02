///scr_focus_vampire_effect

scr_find_item('VAMPIRE');

healValue = 0;
for(var j = 0; j < item[? 'numBought']; j++) {
    healValue += ((obj_player.attackDamage / 4) / (j + 1));
}
scr_show_damage_number(healValue, c_green, obj_player);
scr_heal_player(healValue);
