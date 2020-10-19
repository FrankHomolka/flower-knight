//scr_focus_missile_effect

scr_find_item('MISSILE');

for(var j = 0; j < item[? 'numBought']; j++) {
    instance_create(x,y,obj_player_missile);
}
