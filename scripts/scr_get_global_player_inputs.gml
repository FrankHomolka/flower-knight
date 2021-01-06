//scr_get_global_player_inputs
if(keyboard_check_pressed(ord('B'))) {
    with(obj_player) {
        instance_destroy();
    }
    ds_list_clear(global.equippedItemsList);
    for(var k = 0; k < ds_list_size(global.itemList); k++) {
        item = global.itemList[| k];
        ds_map_replace( item, 'numBought', 0);
    }
    ds_list_clear(obj_focus_controller.playerHitFocusList);
    ds_list_clear(obj_focus_controller.playerAttackFocusList);
    ds_list_clear(obj_focus_controller.playerDashFocusList);
    ds_list_clear(obj_focus_controller.playerDashingFocusList);
    ds_list_clear(obj_focus_controller.playerHitEnemyFocusList);
    instance_create(x,y,obj_player);
    obj_quest_controller.gold = 0;
    room_goto(rm_shop);
}

if(keyboard_check_pressed(ord('T'))) {
    if(obj_gui_controller.drawDebug == true) {
        obj_gui_controller.drawDebug = false;
    } else {
        obj_gui_controller.drawDebug = true;
    }
}

if(global.developerMode) {
    if(keyboard_check_pressed(ord('O'))) {
        if(godMode == true) {
            maxHp = 100;
            hp = maxHp;
            attackDamage = 10;
            godMode = false;
        } else {
            maxHp = 100000;
            hp = maxHp;
            attackDamage = 25;
            godMode = true;
        }
    }
    
    if(keyboard_check_pressed(ord('N'))) {
        goToNextRoom = true;
        obj_gui_controller.loading = true;
        if(instance_exists(obj_level_generator)) {
            if(ds_exists(obj_level_generator.mapGrid, ds_type_grid))
                ds_grid_destroy(obj_level_generator.mapGrid);
                
            if(ds_exists(global.grid, ds_type_grid)) 
                ds_grid_destroy(global.grid);
            
            if(ds_exists(global.foundRoomsGrid, ds_type_grid))
                ds_grid_destroy(global.foundRoomsGrid);
        }
    }
    
    if(keyboard_check_pressed(ord('U'))) {
        obj_quest_controller.gold+=100000;
    }
}

if(obj_gui_controller.drawingLoadingScreen && goToNextRoom) {
    if(instance_exists(obj_level_generator)) {
        if(ds_exists(obj_level_generator.mapGrid, ds_type_grid))
            ds_grid_destroy(obj_level_generator.mapGrid);
            
        if(ds_exists(global.grid, ds_type_grid)) 
            ds_grid_destroy(global.grid);
        show_debug_message("destroyed");
    }
    if(room == rm_procedural) {
        room_goto(rm_loading);
    } else {
        room_goto(rm_procedural);
    }
    goToNextRoom = false;
}
