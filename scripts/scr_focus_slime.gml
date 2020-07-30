//scr_focus_slime

scr_find_item('SLIME');

ds_list_add(obj_focus_controller.playerDashingFocusList, global.itemList[| index]);
