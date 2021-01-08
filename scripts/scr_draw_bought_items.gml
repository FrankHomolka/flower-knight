///scr_draw_bought_items
itemScale = 3;
textScale = 3;
itemSpacing = 60;
for(i = 0; i < ds_list_size(global.equippedItemsList); i++) {
    if(i >= 36) {
        xOffset = -300;
        yOffset =  -(36 * itemSpacing);
    } else if(i >= 24) {
        xOffset = -200;
        yOffset =  -(24 * itemSpacing);
    } else if(i >= 12) {
        xOffset = -100;
        yOffset =  -(12 * itemSpacing);
    } else {
        xOffset = 0;
        yOffset = 0;;
    }
    draw_sprite_ext(ds_map_find_value(global.equippedItemsList[| i], "sprite"), 0, gw - horBlock + xOffset, itemSpacing + (i * itemSpacing) + yOffset,itemScale,itemScale,0,c_white,1);
    draw_set_color(c_black);
    draw_text_transformed(gw - horBlock + 25 + xOffset, itemSpacing + (i * itemSpacing) + 25 + yOffset, ds_map_find_value(global.equippedItemsList[| i], "numBought"), textScale + 0.5, textScale + 0.5,0);
    draw_set_color(c_white);
    draw_text_transformed(gw - horBlock + 25 + xOffset, itemSpacing + (i * itemSpacing) + 25 + yOffset, ds_map_find_value(global.equippedItemsList[| i], "numBought"), textScale, textScale,0);
}
