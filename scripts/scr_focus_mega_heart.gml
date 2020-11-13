//scr_focus_mega_heart

scr_find_item('MEGA HEART');
show_debug_message(item[? 'numBought']);
obj_player.spawnBigHeartChance = item[? 'numBought'] * 0.1;
