//scr_focus_rhino_effect

scr_find_item('RHINO');

rhinoDamage = 0;

for(var j = 0; j < item[? 'numBought']; j++) {
    rhinoDamage += ((obj_player.attackDamage / 3) / (j + 1));
}

with(obj_enemy_general_parent) {
    if(place_meeting(x,y,other) && state != states.hit) {
        scr_try_hit_enemy(other.rhinoDamage, self, true);
    }
}
