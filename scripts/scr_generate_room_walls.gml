///scr_generate_room_walls

if(numDoors < 4) {
    tile1 = tile_layer_find(1000000, currRoomX, currRoomY,);
    tile2 = tile_layer_find(1000001, currRoomX, currRoomY,);
    tile3 = tile_layer_find(1000002, currRoomX, currRoomY,);
    /* Left Side */
    if(genX == 0 && !doorLeft) {
        if(genY >= 4 && genY < 10) {
            instance_create(currRoomX, currRoomY, obj_wall);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            if(tile3 != -1) {
                tile_delete(tile3);
            }
            tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, 1000000);
        }
    /* Right Side */
    } else if(genX == 24 - 1 && !doorRight) {
        if(genY >= 4 && genY < 10) {
            instance_create(currRoomX, currRoomY, obj_wall);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            if(tile3 != -1) {
                tile_delete(tile3);
            }
            tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, 1000000);
        }
    }
    /* Up side */
    if(genY == 0 && !doorUp) {
        if(genX >= 10 && genX < 14) {
            instance_create(currRoomX, currRoomY, obj_wall);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            if(tile3 != -1) {
                tile_delete(tile3);
            }
            tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 16, 16, 16, currRoomX, currRoomY, 1000000);
        }
    /* Down Side */
    } else if(genY == 16 - 1 && !doorDown) {
        if(genX >= 10 && genX < 14) {
            instance_create(currRoomX, currRoomY, obj_wall);
            if(tile1 != -1) {
                tile_delete(tile1);
            }
            if(tile2 != -1) {
                tile_delete(tile2);
            }
            if(tile3 != -1) {
                tile_delete(tile3);
            }
            tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, 1000000);
        }
    }
}
