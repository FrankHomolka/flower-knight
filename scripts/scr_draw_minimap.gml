///scr_draw_minimap

/* Done on room change */
if(findMapStart) {
    show_debug_message('set smallest x & y');
    smallestX = 100;
    smallestY = 100;
    
    /* Determine map start */
    for(var xx = 0; xx < ds_grid_width(obj_level_generator.mapGrid); xx++) {
        for(var yy = 0; yy < ds_grid_height(obj_level_generator.mapGrid); yy++) {
            if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) != 0) {
                if(xx < smallestX)
                    smallestX = xx;
                if(yy < smallestY)
                    smallestY = yy;
            }
        }
    }
    
    mapWidth = ds_grid_width(global.foundRoomsGrid);
    mapHeight = ds_grid_height(global.foundRoomsGrid);
    
    show_debug_message('smallestX = ' + string(smallestX));
    show_debug_message('smallestY = ' + string(smallestY));
    findMapStart = false;
}


if(enlargeMap) {
    draw_set_alpha(0.4);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_color(c_white);
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    draw_set_alpha(1);
    draw_text_transformed(gw / 2 , vertBlock, 'Dungeon Map', 6 * scaleFactor, 6 * scaleFactor, 0);
}
draw_set_alpha(1);

/* Draw minimap rooms */
for(xx = 0; xx < mapWidth; xx++) {
    for(yy = 0; yy < mapHeight; yy++) {
        draw_set_color(c_black);
        baseX = ((xx + minimapX - smallestX + 1) * minimapRoomWidth * minimapScale * scaleFactor);
        baseY = ((vertBlock * 6)) + ((yy + minimapY - smallestY + 1)* minimapRoomHeight * minimapScale * scaleFactor);
        
        /* Set minimap sprite */
        if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) == "spawn") {
            minimapSprite = spr_gui_start_room;
        } else if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) == "boss" && global.showBossRoom) {
            minimapSprite = spr_gui_boss_room;
        } else if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) != 0) {
            if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) == "bomb") {
                minimapSprite = false;
            } else if(global.foundRoomsGrid[# xx, yy] == 'found') {
                minimapSprite = spr_gui_room;
                if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) == "boss") {
                    minimapSprite = spr_gui_boss_room;
                }
            } else {
                minimapSprite = false;
            }
        } else {
            minimapSprite = false;
        }
        
        /* Draw room */
        if(minimapSprite != false) {
            doorScale = (minimapScale* scaleFactor) * 0.7;
            draw_sprite_ext(minimapSprite, 0, baseX, 
                       baseY,minimapScale* scaleFactor,minimapScale* scaleFactor,0,c_white,1);
            // FINISH REPLACING LONG CODE
            // Draw doors 
            // Left
            if(xx - 1 >= 0) {
                if(ds_grid_get(obj_level_generator.mapGrid, xx - 1, yy) != 0 && global.foundRoomsGrid[# xx - 1, yy] != 'found') {
                    draw_sprite_ext(spr_door, 0, baseX, 
                           baseY + ((minimapRoomHeight * minimapScale * scaleFactor)/2),doorScale,doorScale,0,c_white,1); 
                }
            }
            
            // Right
            if(xx + 1 < mapWidth) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx + 1, yy) != 0 && global.foundRoomsGrid[# xx + 1, yy] != 'found') {
                    draw_sprite_ext(spr_door, 0, ((xx + minimapX - smallestX + 1) * minimapRoomWidth * minimapScale * scaleFactor) + (minimapRoomWidth * minimapScale * scaleFactor), 
                           ((vertBlock * 6)) + ((yy + minimapY - smallestY + 1)* minimapRoomHeight * minimapScale * scaleFactor) + ((minimapRoomHeight * minimapScale * scaleFactor)/2),doorScale,doorScale,0,c_white,1); 
                }
            }  
            
            // Up
            if(yy - 1 >= 0) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx, yy - 1) != 0 && global.foundRoomsGrid[# xx, yy - 1] != 'found') {
                    draw_sprite_ext(spr_door, 0, ((xx + minimapX - smallestX + 1) * minimapRoomWidth * minimapScale * scaleFactor) + ((minimapRoomWidth * minimapScale * scaleFactor)/2), 
                           ((vertBlock * 6)) + ((yy + minimapY - smallestY + 1)* minimapRoomHeight * minimapScale * scaleFactor),doorScale,doorScale,0,c_white,1); 
                }
            }     
            
            // Down
            if(yy + 1 < mapHeight) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx, yy + 1) != 0 && global.foundRoomsGrid[# xx, yy + 1] != 'found') {
                    draw_sprite_ext(spr_door, 0, ((xx + minimapX - smallestX + 1) * minimapRoomWidth * minimapScale * scaleFactor) + ((minimapRoomWidth * minimapScale * scaleFactor)/2), 
                           ((vertBlock * 6)) + ((yy + minimapY - smallestY + 1)* minimapRoomHeight * minimapScale * scaleFactor) +(minimapRoomHeight * minimapScale * scaleFactor),doorScale,doorScale,0,c_white,1); 
                }
            }       
        }
                       
        /* Draw player minimap dot */
        if((xx * minimapRoomWidth * 16) <= obj_player.x && obj_player.x <= (xx * minimapRoomWidth * 16) + (minimapRoomWidth * 16) &&
           (yy * minimapRoomHeight * 16) <= obj_player.y && obj_player.y <= (yy * minimapRoomHeight * 16) + (minimapRoomHeight * 16)) {
           
           // Set room to found
           if(global.foundRoomsGrid[# xx, yy] != 'found') {
                global.foundRoomsGrid[# xx, yy] = 'found';
           }
            
            if(dotRadius > dotRadiusMax) {
                dotRadiusIncrement = -dotRadiusIncrement;
            }
            if(dotRadius < dotRadiusMin) {
                dotRadiusIncrement = abs(dotRadiusIncrement);
            }
            
            dotRadius += dotRadiusIncrement;
            draw_sprite_ext(spr_map_selected, 0, ((xx + minimapX - smallestX + 1) * minimapRoomWidth * minimapScale * scaleFactor), 
                       ((vertBlock * 6)) + ((yy + minimapY - smallestY + 1)* minimapRoomHeight * minimapScale * scaleFactor),minimapScale* scaleFactor,minimapScale* scaleFactor,0,c_white,1);
            draw_sprite_ext(spr_current_room, 0, ((xx + minimapX - smallestX + 1) * minimapRoomWidth * minimapScale * scaleFactor), 
                       ((vertBlock * 6)) + ((yy + minimapY - smallestY + 1)* minimapRoomHeight * minimapScale * scaleFactor) + (dotRadius*2),minimapScale* scaleFactor,minimapScale* scaleFactor,0,c_white,1);
           
        }
    }
}
