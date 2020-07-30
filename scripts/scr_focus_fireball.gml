///scr_focus_fireball

scr_find_item('FIREBALL');

ds_list_add(obj_focus_controller.playerAttackFocusList, global.itemList[| index]);
