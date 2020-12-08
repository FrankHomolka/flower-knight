//scr_focus_heart_seeker

scr_find_item('HEART SEEKER');
show_debug_message(item[? 'numBought']);
obj_player.heartSpawnChance = 0.2 + (item[? 'numBought'] * 0.1);
