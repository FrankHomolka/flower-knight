///scr_focus_shadow_effect

scr_find_item('SHADOW');

obj_player.speedAltered = true;
obj_player.alteredMoveSpeed = 1;
for(var j = 0; j < item[? 'numBought']; j++) {
    show_debug_message(j);
    obj_player.alteredMoveSpeed += ((1 * 0.2) / (j+1));
}
obj_player.drawColor = c_gray;

show_debug_message('altered move sped = ' + string(obj_player.alteredMoveSpeed));
instance_create(x,y,obj_shadow_timer);
