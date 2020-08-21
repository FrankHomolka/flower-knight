///scr_quest_unlock_item
ds_list_add(global.itemsUnlocked, item);
scr_save_item_list();
ds_list_delete(questList, ds_list_find_index(questList, item));
if(instance_exists(obj_dungeon_shop)) {
    obj_dungeon_shop.spawnedItems = false;
}
if(instance_exists(obj_quest_display_controller)) {
    ds_queue_enqueue(obj_quest_display_controller.unlockedItemQueue, item);
}
