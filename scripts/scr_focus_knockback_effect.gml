///scr_focus_knockback_effect
scr_find_item('WHACK');

for(var j = 0; j < item[? 'numBought']; j++) {
    // FIX ME
    obj_player.knockbackMultiplier = 1 + (1 / item[? 'numBought']);
}
