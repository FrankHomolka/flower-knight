///scr_draw_bought_items
for(i = 0; i < ds_list_size(global.equippedItemsList); i++) {
    if(i >= 24) {
        xOffset = -300;
        yOffset =  -(24 * 100);
        draw_sprite_ext(ds_map_find_value(global.equippedItemsList[| i], "sprite"), 0, gw - horBlock, 100 + (i * 100) + yOffset,5,5,0,c_white,1);
        
    } else if(i >= 16) {
        xOffset = -200;
        yOffset =  -(16 * 100);
        draw_sprite_ext(ds_map_find_value(global.equippedItemsList[| i], "sprite"), 0, gw - horBlock + xOffset, 100 + (i * 100) + yOffset,5,5,0,c_white,1);
        
    } else if(i >= 8) {
        xOffset = -100;
        yOffset =  -(8 * 100);
        draw_sprite_ext(ds_map_find_value(global.equippedItemsList[| i], "sprite"), 0, gw - horBlock + xOffset, 100 + (i * 100) + yOffset,5,5,0,c_white,1);
    } else {
        draw_sprite_ext(ds_map_find_value(global.equippedItemsList[| i], "sprite"), 0, gw - horBlock, 100 + (i * 100),5,5,0,c_white,1);
        draw_set_color(c_white);
        draw_text_transformed(gw - horBlock + 25, 100 + (i * 100) + 25, ds_map_find_value(global.equippedItemsList[| i], "numBought"), 3, 3,0);
    }
}
