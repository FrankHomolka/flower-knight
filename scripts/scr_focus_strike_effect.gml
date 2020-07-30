///scr_focus_strike_effect

scr_find_item('STRIKE');

for(var j = 0; j < item[? 'numBought']; j++) {
    if(random(100) > 80) {
        instance_create(x + random_range(-75, 75),y + random_range(-75, 75),obj_player_strike);
    }
}

