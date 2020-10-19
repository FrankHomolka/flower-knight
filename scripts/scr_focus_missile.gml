//scr_focus_missile
 
scr_find_item('MISSILE');

ds_list_add(obj_focus_controller.playerHitFocusList, global.itemList[| index]);
