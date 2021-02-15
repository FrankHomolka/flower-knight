///scr_generate_boss_walls(roomType)

if(argument0 == spr_room_boss_map) {
    if(genX == 0 && doorLeft) {
        if(genY >= 5 && genY < 10) {
            if(random(1) > 0.4)
                tile_add(bck_boss_room, 0 + (16*choose(0,1)),0 + (16*choose(0,1)), 16, 16, startX + ((genX - 1) * 16), currRoomY, 1000002);
            with(instance_create(currRoomX, currRoomY, obj_boss_wall)) {
                boss = other.boss;
            }
            with(instance_create(currRoomX + 16, currRoomY, obj_boss_activator)) {
                boss = other.boss;
            }
        }
    /* Right Side */
    } else if(genX == 24 - 1 && doorRight) {
        if(genY >= 5 && genY < 10) {
            if(random(1) > 0.4)
                tile_add(bck_boss_room, 0 + (16*choose(0,1)),0 + (16*choose(0,1)), 16, 16, startX + ((genX + 1) * 16), currRoomY, 1000002);
            with(instance_create(currRoomX, currRoomY, obj_boss_wall)) {
                boss = other.boss;
            }
            with(instance_create(currRoomX - 16, currRoomY, obj_boss_activator)) {
                boss = other.boss;
            }
        }
    }
    /* Up side */
    if(genY == 0 && doorUp) {
        if(genX >= 10 && genX < 14) {
            if(random(1) > 0.4)
                tile_add(bck_boss_room, 0 + (16*choose(0,1)),0 + (16*choose(0,1)), 16, 16, currRoomX, startY + ((genY - 1) * 16), 1000002);
            with(instance_create(currRoomX, currRoomY, obj_boss_wall)) {
                boss = other.boss;
            }
            with(instance_create(currRoomX, currRoomY + 16, obj_boss_activator)) {
                boss = other.boss;
            }
        }
    /* Down Side */
    } else if(genY == 16 - 1 && doorDown) {
        if(genX >= 10 && genX < 14) {
            if(random(1) > 0.4)
                tile_add(bck_boss_room, 0 + (16*choose(0,1)),0 + (16*choose(0,1)), 16, 16, currRoomX, startY + ((genY + 1) * 16), 1000002);
            with(instance_create(currRoomX, currRoomY, obj_boss_wall)) {
                boss = other.boss;
            }
            with(instance_create(currRoomX, currRoomY - 16, obj_boss_activator)) {
                boss = other.boss;
            }
        }
    }
}
