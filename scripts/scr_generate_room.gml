//scr_generate_room(startX, startY, room, subimg)

surface_set_target(surface);
roomSprite = draw_sprite(argument2, argument3, 0, 0);
surface_reset_target();
startX = argument0;
startY = argument1;
roomType = argument2;
temp = tileSheet;
if(roomType == spr_room_boss_map) {
    switch(area) {
        case 1:
            tileSheet = bck_area_1_boss;
            break;
    }
}
for(genX = 0; genX < 24; genX++) {//20
    for(genY = 0; genY < 16; genY++) {//14
        color = surface_getpixel(surface, genX, genY);
        
        currRoomX = startX + (genX * 16);
        currRoomY = startY + (genY * 16);
        
        // Creates instances from each pixel of the room
        scr_instance_from_pixel(color, roomType);
        
        /* Generate walls if not adjacent */
        scr_generate_room_walls();
        
        /* Generate boss walls if boss room */
        scr_generate_boss_walls(roomType);
        
        /* Generate bomb walls if bomb room */
        scr_generate_bomb_walls(roomType);
    }
}
tileSheet = temp;

roomSprite = draw_clear(argument0);
