///scr_instance_from_pixel(color, roomType)
switch(argument0) {
    // Background
    case $ffffff:
        if(argument1 == spr_bomb_room) {
            tile_add(bck_treasure_room, 0 + (16*choose(0,1,2,3)), 32, 16, 16, currRoomX, currRoomY, 1000000);
        } else {
            tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 32, 16, 16, currRoomX, currRoomY, 1000000);
        }
        // Floor decoration
        if(random(1) > 0.93) {
            tile_add(bck_area_1_decoration, 0 + (16*choose(0,1,2,3)), 0 + (16*choose(0,1,2,3)), 16, 16, currRoomX, currRoomY, 1000000);
        }
        
        break;
    // Wall
    case $000000:
        instance_create(currRoomX, currRoomY, obj_wall);
        tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 16, 16, 16, currRoomX, currRoomY, 1000000);
        break;
    // Roof
    case $808080:
        // Bottom Row
        if(genY + 1 == 16) {
            // If left or right corner
            if(genX == 0 || genX == 23) {
                tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, -currRoomY - 28); 
            } else if(doorDown) {
                tile_add(tileSheet, (16*choose(0,1,2)), 0, 16, 16, currRoomX, currRoomY, -currRoomY - 28);
            } else {
                tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, -currRoomY - 28);   
            }
        } else if(genY + 1 < 16) {
            colorBelow = surface_getpixel(surface, genX, genY + 1);
            if(colorBelow == $808080) {
                // No edge
                tile_add(tileSheet, 16 * 3, 0, 16, 16, currRoomX, currRoomY, -currRoomY - 28);   
            } else {
                // Edge bottom
                tile_add(tileSheet, (16*choose(0,1,2)), 0, 16, 16, currRoomX, currRoomY, -currRoomY - 28);
            }
        } else {
            tile_add(tileSheet, (16*choose(0,1,2)), 0, 16, 16, currRoomX, currRoomY, -currRoomY - 28);
        }
        instance_create(currRoomX, currRoomY, obj_wall);
        break;
    // Make pit
    case $ff00ff:
        if(tile_layer_find(1000002, currRoomX, currRoomY - 16) == -1) {
            tile_add(tileSheet, 16, 48, 16, 16, currRoomX, currRoomY, -currRoomY + 1000);
        } else {
            tile_add(tileSheet, 0, 48, 16, 16, currRoomX, currRoomY, -currRoomY + 1000);
        }
        instance_create(currRoomX, currRoomY, obj_pit);
        break;
    // Destructible
    case $00ff00: 
        tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, obj_destructible);
        break;
    // Level enemy 1 R:200
    case $0000c8:
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, enemyList[| 0]);
        break; 
    // Level enemy 2 R:150
    case $000096:
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, enemyList[| 1]);
        break; 
    // Level enemy 3 R:100
    case $000064:
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, enemyList[| 2]);
        break; 
    // Level enemy 4 R:75
    case $00004b:
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, enemyList[| 3]);
        break; 
    // Level enemy 5 R:50
    case $000032:
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, enemyList[| 4]);
        break; 
    // Enemy Random R:255
    case $0000ff:
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        enemyChoice = floor(random(ds_list_size(enemyList)));
        instance_create(currRoomX, currRoomY, enemyList[| enemyChoice]);
        break; 
    // Torch
    case $ff0099:
        if(argument1 == spr_bomb_room) {
            tile_add(bck_treasure_room, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        } else {
            tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        }
        instance_create(currRoomX, currRoomY, obj_torch);
        break;
    // Spikes
    case $3c3204:
        tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, obj_spikes);
        break;
    // Crossbow
    case $1235ad:
        tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, obj_crossbow_trap);
        break;
    // Boss
    case $ffff00:
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        instance_create(currRoomX, currRoomY, boss);
        break;
    // Treasure
    case $000040:
        if(argument1 == spr_bomb_room) {
            tile_add(bck_treasure_room, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        } else {
            tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        }
        instance_create(currRoomX, currRoomY, obj_treasure);
        break;
    // Door
    case $00ffff:
        instance_create(currRoomX, currRoomY, obj_next_room);
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        break;
    // Shop spawn
    case $e21d98:
        instance_create(currRoomX, currRoomY, obj_dungeon_shop);
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        break;
    // Bomb room 
    case $d5db64: 
        if(argument1 == spr_bomb_room) {
            tile_add(bck_treasure_room, 0 + (16*choose(0,1,2,3)), 32, 16, 16, currRoomX, currRoomY, 1000000);
        } else {
            tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 32, 16, 16, currRoomX, currRoomY, 1000000);
        }
        instance_create(currRoomX, currRoomY, obj_bomb_room);
        break;
    // Player spawn
    case $ff0000:
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        obj_player.x = currRoomX;
        obj_player.y = currRoomY;
        instance_create(currRoomX, currRoomY,obj_pit_respawn);
        break;
    // Key spawn
    case $5b5b00:
        instance_create(currRoomX, currRoomY, obj_dungeon_key);
        tile_add(tileSheet, 0, 32, 16, 16, currRoomX, currRoomY, 1000000);
        break;
    default:
        break;
}
