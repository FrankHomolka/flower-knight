//scr_generate_room(startX, startY, room)

surface_set_target(surface);
roomSprite = draw_sprite(argument2, 0, 0, 0);
surface_reset_target();
startX = argument0;
startY = argument1;

for(genX = 0; genX < 24; genX++) {//20
    for(genY = 0; genY < 16; genY++) {//14
        color = surface_getpixel(surface, genX, genY);
        
        switch(color) {
            // Background
            case $ffffff:
                tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                break;
            // Wall
            case $000000:
                instance_create(startX + (genX * 16), startY + (genY * 16), obj_wall);
                tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 16, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                break;
            // Roof
            case $808080:
                // Bottom Row
                if(genY + 1 == 16) {
                    // If left or right corner
                    if(genX == 0 || genX == 23) {
                        tile_add(tileSheet, 16 * 3, 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001); 
                    } else if(doorDown) {
                        tile_add(tileSheet, (16*choose(0,1,2)), 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);
                    } else {
                        tile_add(tileSheet, 16 * 3, 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);   
                    }
                } else if(genY + 1 < 16) {
                    colorBelow = surface_getpixel(surface, genX, genY + 1);
                    if(colorBelow == $808080) {
                        // No edge
                        tile_add(tileSheet, 16 * 3, 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);   
                    } else {
                        // Edge bottom
                        tile_add(tileSheet, (16*choose(0,1,2)), 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);
                    }
                } else {
                    tile_add(tileSheet, (16*choose(0,1,2)), 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);
                }
                instance_create(startX + (genX * 16), startY + (genY * 16), obj_wall);
                break;
            // Make pit
            case $ff00ff:
                if(tile_layer_find(1000002, startX + (genX * 16), startY + (genY * 16) - 16) == -1) {
                    tile_add(tileSheet, 16, 48, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000002);
                } else {
                    tile_add(tileSheet, 0, 48, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000002);
                }
                instance_create(startX + (genX * 16), startY + (genY * 16), obj_pit);
                break;
            // Destructible
            case $00ff00: {
                tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                instance_create(startX + (genX * 16), startY + (genY * 16), obj_destructible);
                break;
            }
            // Enemy Random
            case $0000ff:
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                enemyChoice = floor(random(ds_list_size(enemyList)));
                instance_create(startX + (genX * 16), startY + (genY * 16), enemyList[| enemyChoice]);
                break; 
            // Level enemy 1 R:200
            case $0000c8:
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                instance_create(startX + (genX * 16), startY + (genY * 16), enemyList[| 0]);
                break; 
            // Level enemy 2 R:150
            case $000096:
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                instance_create(startX + (genX * 16), startY + (genY * 16), enemyList[| 1]);
                break; 
            // Level enemy 3 R:100
            case $000064:
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                instance_create(startX + (genX * 16), startY + (genY * 16), enemyList[| 2]);
                break; 
            //Boss
            case $ffff00:
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                instance_create(startX + (genX * 16), startY + (genY * 16), boss);
                break;
            // Torch
            case $ff0099:
                instance_create(startX + (genX * 16), startY + (genY * 16), obj_torch);
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                break;
            // Treasure
            case $000040:
                instance_create(startX + (genX * 16), startY + (genY * 16), obj_treasure);
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                break;
            // Door
            case $00ffff:
                instance_create(startX + (genX * 16), startY + (genY * 16), obj_next_room);
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                break;
            // Player spawn
            case $ff0000:
                tile_add(tileSheet, 0, 32, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000000);
                obj_player.x = startX + (genX * 16);
                obj_player.y = startY + (genY * 16);
                instance_create(startX + (genX * 16),startY + (genY * 16),obj_pit_respawn);
                instance_create(startX + (genX * 16),startY + (genY * 16),obj_dungeon_shop);
                break;
            default:
                break;
        }
        
        /* Generate walls if not adjacent */
        if(numDoors < 4) {
            tile = tile_layer_find(1000001, startX + (genX * 16), startY + (genY * 16));
            /* Left Side */
            if(genX == 0 && !doorLeft) {
                if(genY >= 4 && genY < 10) {
                    instance_create(startX + (genX * 16), startY + (genY * 16), obj_wall);
                    if(tile != -1) {
                        tile_delete(tile);
                    }
                    tile_add(tileSheet, 16 * 3, 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);
                }
            /* Right Side */
            } else if(genX == 24 - 1 && !doorRight) {
                if(genY >= 4 && genY < 10) {
                    instance_create(startX + (genX * 16), startY + (genY * 16), obj_wall);
                    if(tile != -1) {
                        tile_delete(tile);
                    }
                    tile_add(tileSheet, 16 * 3, 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);
                }
            }
            /* Up side */
            if(genY == 0 && !doorUp) {
                if(genX >= 10 && genX < 14) {
                    instance_create(startX + (genX * 16), startY + (genY * 16), obj_wall);
                    if(tile != -1) {
                        tile_delete(tile);
                    }
                    tile_add(tileSheet, 0 + (16*choose(0,1,2,3)), 16, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);
                }
            /* Down Side */
            } else if(genY == 16 - 1 && !doorDown) {
                if(genX >= 10 && genX < 14) {
                    instance_create(startX + (genX * 16), startY + (genY * 16), obj_wall);
                    if(tile != -1) {
                        tile_delete(tile);
                    }
                    tile_add(tileSheet, 16 * 3, 0, 16, 16, startX + (genX * 16), startY + (genY * 16), 1000001);
                }
            }
        }
        
        // If boss room
        if(argument2 == spr_room_boss_map) {
            if(genX == 0 && doorLeft) {
                if(genY >= 5 && genY < 10) {
                    with(instance_create(startX + (genX * 16), startY + (genY * 16), obj_boss_wall)) {
                        boss = other.boss;
                    }
                }
            /* Right Side */
            } else if(genX == 24 - 1 && doorRight) {
                if(genY >= 5 && genY < 10) {
                    with(instance_create(startX + (genX * 16), startY + (genY * 16), obj_boss_wall)) {
                        boss = other.boss;
                    }
                }
            }
            /* Up side */
            if(genY == 0 && doorUp) {
                if(genX >= 10 && genX < 14) {
                    with(instance_create(startX + (genX * 16), startY + (genY * 16), obj_boss_wall)) {
                        boss = other.boss;
                    }
                }
            /* Down Side */
            } else if(genY == 16 - 1 && doorDown) {
                if(genX >= 10 && genX < 14) {
                    with(instance_create(startX + (genX * 16), startY + (genY * 16), obj_boss_wall)) {
                        boss = other.boss;
                    }
                }
            }
        }
    }
}

roomSprite = draw_clear(argument0);
