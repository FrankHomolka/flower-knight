//scr_save_item_list

/* Stores list of items */
var root_list = ds_list_create();

// For every instance make map
for(var i = 0; i < ds_list_size(global.itemsUnlocked) ; i++) { 
    ds_list_add(root_list,global.itemsUnlocked[| i]);
    ds_list_mark_as_map(root_list,ds_list_size(root_list)-1);
}

// Wrap the root list up in a map
var global.wrapper = ds_map_create();
ds_map_add_list(global.wrapper, "ROOT", root_list);

// Save all of this to string
var textString = json_encode(global.wrapper);
scr_save_string_to_file("savedgame.sav", textString);

show_debug_message("game saved");
