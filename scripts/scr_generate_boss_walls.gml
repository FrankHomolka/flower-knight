///scr_generate_boss_walls(roomType)

if(argument0 == spr_room_boss_map) {
    if(genX == 0 && doorLeft) {
        if(genY >= 5 && genY < 10) {
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
            with(instance_create(currRoomX, currRoomY, obj_boss_wall)) {
                boss = other.boss;
            }
            with(instance_create(currRoomX, currRoomY - 16, obj_boss_activator)) {
                boss = other.boss;
            }
        }
    }
}
