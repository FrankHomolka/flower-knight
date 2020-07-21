///scr_draw_minimap

/* Done on room change */
if(room != currentRoom) {
    smallestX = 100;
    smallestY = 100;
    currentRoom = room;
    
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
    
    minimapX = -(smallestX * minimapRoomWidth);
    minimapY = -(smallestY * minimapRoomHeight);
}

draw_set_alpha(1);

/* Draw minimap rooms */
for(xx = 0; xx < mapWidth; xx++) {
    for(yy = 0; yy < mapHeight; yy++) {
        draw_set_color(c_black);
        
        /* Set minimap sprite */
        if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) == "spawn") {
            minimapSprite = spr_gui_start_room;
        } else if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) == "boss" && global.showBossRoom) {
            minimapSprite = spr_gui_boss_room;
        } else if(ds_grid_get(obj_level_generator.mapGrid, xx, yy) != 0) {
            if(global.foundRoomsGrid[# xx, yy] == 'found') {
                minimapSprite = spr_gui_room;
            } else {
                minimapSprite = false;
            }
        } else {
            minimapSprite = false;
        }
        
        /* Draw room */
        if(minimapSprite != false) {
            draw_sprite_ext(minimapSprite, 0, minimapX + (xx * minimapRoomWidth * minimapScale), 
                       (minimapY + (vertBlock * 2)) + (yy * minimapRoomHeight * minimapScale),minimapScale,minimapScale,0,c_white,1);
            /* Draw doors */
            // Left
            if(xx - 1 >= 0) {
                if(ds_grid_get(obj_level_generator.mapGrid, xx - 1, yy) != 0 && global.foundRoomsGrid[# xx - 1, yy] != 'found') {
                    draw_sprite_ext(spr_door, 0, minimapX + (xx * minimapRoomWidth * minimapScale), 
                           (minimapY + (minimapRoomHeight) + (vertBlock * 2)) + (yy * minimapRoomHeight * minimapScale),minimapScale,minimapScale,0,c_white,1); 
                }
            }
            
            // Right
            if(xx + 1 < mapWidth) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx + 1, yy) != 0 && global.foundRoomsGrid[# xx + 1, yy] != 'found') {
                    draw_sprite_ext(spr_door, 0, minimapX + (xx * minimapRoomWidth * minimapScale) + (minimapRoomWidth * 2), 
                           (minimapY + (minimapRoomHeight) + (vertBlock * 2)) + (yy * minimapRoomHeight * minimapScale),minimapScale,minimapScale,0,c_white,1); 
                }
            }  
            
            // Up
            if(yy - 1 >= 0) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx, yy - 1) != 0 && global.foundRoomsGrid[# xx, yy - 1] != 'found') {
                    draw_sprite_ext(spr_door, 0, minimapX + (xx * minimapRoomWidth * minimapScale) + minimapRoomWidth, 
                           (minimapY + (vertBlock * 2)) + (yy * minimapRoomHeight * minimapScale),minimapScale,minimapScale,0,c_white,1); 
                }
            }     
            
            // Down
            if(yy + 1 < mapHeight) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx, yy + 1) != 0 && global.foundRoomsGrid[# xx, yy + 1] != 'found') {
                    draw_sprite_ext(spr_door, 0, minimapX + (xx * minimapRoomWidth * minimapScale) + minimapRoomWidth, 
                           (minimapY + (minimapRoomHeight * 2) + (vertBlock * 2)) + (yy * minimapRoomHeight * minimapScale),minimapScale,minimapScale,0,c_white,1); 
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
           draw_set_color(c_red);
            
            if(dotRadius > dotRadiusMax) {
                dotRadiusIncrement = -1/10;
            }
            if(dotRadius < dotRadiusMin) {
                dotRadiusIncrement = 1/10;
            }
            
            dotRadius += dotRadiusIncrement;
            draw_sprite_ext(spr_map_selected, 0, minimapX + (xx * minimapRoomWidth * minimapScale), 
                       (minimapY + (vertBlock * 2)) + (yy * minimapRoomHeight * minimapScale),minimapScale,minimapScale,0,c_white,1);
            draw_circle(minimapX + (xx * minimapRoomWidth * minimapScale) + ((minimapRoomWidth * minimapScale) / 2), 
                        (minimapY + (vertBlock * 2)) + (yy * minimapRoomHeight * minimapScale) + ((minimapRoomHeight * minimapScale) / 2), dotRadius, false);
        
           
        }
    }
}
