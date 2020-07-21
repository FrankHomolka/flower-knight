//scr_get_global_player_inputs
if(keyboard_check_pressed(ord('B'))) {
    game_restart();
}

/* ONLY FOR TESTING REMOVE ME */
if(keyboard_check_pressed(ord('K'))) {
    scr_clear_save();
}

if(keyboard_check_pressed(ord('P'))) {
    if(obj_gui_controller.drawDebug == true) {
        obj_gui_controller.drawDebug = false;
    } else {
        obj_gui_controller.drawDebug = true;
    }
}

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
    obj_money_controller.money+=10;
    obj_money_controller.coins+=100;
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
        room_goto(rm_choose_focus);
    } else {
        room_goto(rm_procedural);
    }
    goToNextRoom = false;
}
