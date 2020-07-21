//scr_player_pit_state

/* Check global inputs */
scr_get_global_player_inputs();

speed = 0;

sprite_index = spr_player_pit;
if(image_xscale > 0){
    image_angle += 10;
    image_xscale -= 1/150;
    image_yscale -= 1/150;
} else {
    x = obj_pit_respawn.x;
    y = obj_pit_respawn.y;
    image_xscale = 1;
    image_yscale = 1;
    image_angle = 0;
    
    state = states.idle;
}
