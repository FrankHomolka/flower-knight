///scr_focus_freeze_enemy

scr_find_item('FREEZE');

ds_list_add(obj_focus_controller.playerHitEnemyFocusList, global.itemList[| index]);
