//scr_focus_bomb

scr_find_item('BOMB');

ds_list_add(obj_focus_controller.playerDashFocusList, global.itemList[| index]);
