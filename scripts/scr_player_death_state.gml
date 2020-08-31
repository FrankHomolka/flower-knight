//scr_player_death_state

/* Check global inputs */
scr_get_global_player_inputs();

speed = 0;

/*if(sprite_index == spr_player_pit) {
    dead = true;
    if(obj_player.image_xscale > 0){
        obj_player.image_angle += 10;
        obj_player.image_xscale -= 1/150;
        obj_player.image_yscale -= 1/150;
    }
} else {
    
}*/
image_speed = 0.1;
if(image_index > sprite_get_number(deathSprite) - 0.5) {
    dead = true;
    image_speed = 0;
}
