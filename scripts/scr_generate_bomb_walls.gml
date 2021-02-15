///scr_generate_bomb_walls(roomType)

if(argument0 == spr_bomb_room) {
    /* Left side */
    if(genX == 0 && doorLeft) {
        if(genY >= 5 && genY < 10) {
            tile1 = tile_layer_find(1000000, startX + ((genX - 1) * 16), startY + (genY * 16));
            tile2 = tile_layer_find(1000000, currRoomX, currRoomY);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            tile1 = tile_layer_find(1000001, startX + ((genX - 1) * 16), currRoomY);
            tile2 = tile_layer_find(1000001, currRoomX, currRoomY);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, 1000001); 
            tile_add(tileSheet, 16 * 3, 0, 16, 16, startX + ((genX - 1) * 16), currRoomY, 1000001);
            with(instance_create(startX + ((genX - 1) * 16), currRoomY, obj_bombable_wall)) {
                tileSheet = other.tileSheet;
                image_index = 1;
            }
        }
    /* Right Side */
    } else if(genX == 24 - 1 && doorRight) {
        if(genY >= 5 && genY < 10) {
            tile1 = tile_layer_find(1000000, startX + ((genX + 1) * 16), currRoomY);
            tile2 = tile_layer_find(1000000, currRoomX, currRoomY);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            tile1 = tile_layer_find(1000001, startX + ((genX + 1) * 16), currRoomY);
            tile2 = tile_layer_find(1000001, currRoomX, currRoomY);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, 1000001); 
            tile_add(tileSheet, 16 * 3, 0, 16, 16, startX + ((genX + 1) * 16), currRoomY, 1000001); 
            with(instance_create(startX + ((genX + 1) * 16), currRoomY, obj_bombable_wall)) {
                tileSheet = other.tileSheet;
                image_index = 3;
            }
        }
    }
    /* Up side */
    if(genY == 0 && doorUp) {
        if(genX >= 10 && genX < 14) {
            tile1 = tile_layer_find(1000000, currRoomX, startY + ((genY - 1) * 16));
            tile2 = tile_layer_find(1000000, currRoomX, currRoomY);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            tile1 = tile_layer_find(1000001, currRoomX, startY + ((genY - 1) * 16));
            tile2 = tile_layer_find(1000001, currRoomX, currRoomY);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, startY + ((genY - 1) * 16), 1000001);
            tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, 1000001); 
            with(instance_create(currRoomX, startY + ((genY - 1) * 16), obj_bombable_wall)) {
                tileSheet = other.tileSheet;
                image_index = 2;
            }
        }
    /* Down Side */
    } else if(genY == 16 - 1 && doorDown) {
        if(genX >= 10 && genX < 14) {
            tile1 = tile_layer_find(1000000, currRoomX, startY + ((genY + 1) * 16));
            tile2 = tile_layer_find(1000000, currRoomX, currRoomY);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            tile1 = tile_layer_find(1000001, currRoomX, startY + ((genY + 1) * 16));
            tile2 = tile_layer_find(1000001, currRoomX, currRoomY);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 16, 16, 16, currRoomX, startY + ((genY + 1) * 16), 1000000);
            tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, 100000); 
            with(instance_create(currRoomX, startY + ((genY + 1) * 16), obj_bombable_wall)) {
                tileSheet = other.tileSheet;
                image_index = 0;
            }
        }
    }
}
