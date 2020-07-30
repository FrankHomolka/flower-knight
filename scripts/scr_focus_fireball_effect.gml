///scr_focus_fireball_effect

scr_find_item('FIREBALL');

fireballDamage = 0;

for(var j = 0; j < item[? 'numBought']; j++) {
    fireballDamage += ((obj_player.attackDamage / 4) / (j+1));
}

with(instance_create(x,y,obj_blank)) {
    attackDamage = other.fireballDamage;
    instance_change(obj_player_fireball, true);
}

