///scr_draw_minimap

/* Done on room change */
if(findMapStart) {
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
    findMapStart = false;
    
    // Set vars
    scaledRoomWidth = (minimapRoomWidth * minimapScale * scaleFactor);
    scaledRoomHeight = (minimapRoomHeight * minimapScale * scaleFactor);
    minimapScaleFactored = minimapScale * scaleFactor;
    mapFadingIn = true;
    draw_set_alpha(1);
}

/* Lets player enlarge map */
if(enlargeMap) {
    draw_set_alpha(0.4);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_color(c_white);
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    draw_set_alpha(spriteAlpha);
    draw_text_transformed(gw / 2 , vertBlock, 'Dungeon Map', 6 * scaleFactor, 6 * scaleFactor, 0);
}

/* Fade in and out */
if(mapFadingIn) {
    if(instance_exists(obj_fade_controller)) {
        draw_set_alpha(1 - obj_fade_controller.drawAlpha);
    } else {
        mapFadingIn = false;
    }
}

// Draw the rooms
for(xx = 0; xx < mapWidth; xx++) {
    for(yy = 0; yy < mapHeight; yy++) {
        baseX = ((xx + minimapX - smallestX + 1) * scaledRoomWidth);
        baseY = ((vertBlock * 6)) + ((yy + minimapY - smallestY + 1) * scaledRoomHeight);
        
        tempMapSprite = ds_grid_get(obj_level_generator.mapGrid, xx, yy);
        
        /* Set minimap sprite */
        // WORKING HERE THIS IS VERY SLOW ON CPU
        /*if(global.foundRoomsGrid[# xx, yy] == 'found') {
            switch(tempMapSprite) {
                case "roomExists": 
                    minimapSprite = spr_gui_room;
                    break;
                case "spawn":
                    minimapSprite = spr_gui_start_room;
                    break;
                case "boss":
                    minimapSprite = spr_gui_boss_room;
                    break;
                default:
                    break;
            }
                
        }*/

        
        if(tempMapSprite == "spawn") {
            minimapSprite = spr_gui_start_room;
        } else if(tempMapSprite == "boss" && global.showBossRoom) {
            minimapSprite = spr_gui_boss_room;
        } else if(tempMapSprite != 0) {
            // Dont show bomb room
            if(tempMapSprite == "bomb") {
                minimapSprite = false;
            } else if(global.foundRoomsGrid[# xx, yy] == 'found') {
                minimapSprite = spr_gui_room;
                // Show shop after finding
                if(tempMapSprite == "shop") {
                    minimapSprite = spr_gui_shop_room;
                } else if(tempMapSprite == "boss") {
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
            // Draws room sprite
            draw_sprite_ext(minimapSprite, 0, baseX, 
                       baseY, minimapScaleFactored, minimapScaleFactored,0,c_white,spriteAlpha);
            // Draw doors 
            // Left
            if(xx - 1 >= 0) {
                if(ds_grid_get(obj_level_generator.mapGrid, xx - 1, yy) != 0 && global.foundRoomsGrid[# xx - 1, yy] != 'found') {
                    draw_sprite_ext(spr_undiscovered_room, 0, baseX - scaledRoomWidth, 
                       baseY,minimapScaleFactored,minimapScaleFactored,0,c_white,spriteAlpha);
                }
            }
            
            // Right
            if(xx + 1 < mapWidth) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx + 1, yy) != 0 && global.foundRoomsGrid[# xx + 1, yy] != 'found') {
                    draw_sprite_ext(spr_undiscovered_room, 0, baseX + scaledRoomWidth, 
                       baseY,minimapScaleFactored,minimapScaleFactored,0,c_white,spriteAlpha);
                }
            }  
            
            // Up
            if(yy - 1 >= 0) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx, yy - 1) != 0 && global.foundRoomsGrid[# xx, yy - 1] != 'found') {
                    draw_sprite_ext(spr_undiscovered_room, 0, baseX, 
                       baseY - scaledRoomHeight,minimapScaleFactored,minimapScaleFactored,0,c_white,spriteAlpha);
                }
            }     
            
            // Down
            if(yy + 1 < mapHeight) { 
                if(ds_grid_get(obj_level_generator.mapGrid, xx, yy + 1) != 0 && global.foundRoomsGrid[# xx, yy + 1] != 'found') {
                    draw_sprite_ext(spr_undiscovered_room, 0, baseX, 
                       baseY + scaledRoomHeight,minimapScaleFactored,minimapScaleFactored,0,c_white,spriteAlpha);
                }
            }       
        }
        
        // Gets the position of left & right of room
        leftSide = (xx * minimapRoomWidth * 16);
        rightSide = leftSide + (minimapRoomWidth * 16);
                
        // Gets the position of top & bottom of room
        topSide = (yy * minimapRoomHeight * 16);
        bottomSide = topSide + (minimapRoomHeight * 16);
        
        /* If player within room, set bounds & set room to found */
        if(leftSide <= obj_player.x && obj_player.x <= rightSide &&
           topSide <= obj_player.y && obj_player.y <= bottomSide) {
            
            // Draw the player position
            currWidth = rightSide - leftSide;
            playerX = obj_player.x - leftSide;
            xPercent = playerX / currWidth;
            
            currHeight = bottomSide - topSide;
            playerY = obj_player.y - topSide;
            yPercent = playerY / currHeight;
           
            // Set curr room
            currRoomX = baseX;
            currRoomY = baseY;
            
            // Set room to found
            if(global.foundRoomsGrid[# xx, yy] != 'found') 
                 global.foundRoomsGrid[# xx, yy] = 'found';    
        }
    }
}

draw_sprite_ext(spr_current_room, 0, currRoomX - (scaledRoomWidth / 2) + (scaledRoomWidth * xPercent), 
            currRoomY + (scaledRoomHeight * yPercent),minimapScaleFactored,minimapScaleFactored,0,c_white,spriteAlpha);

draw_set_alpha(1);
