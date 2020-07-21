//scr_enemy_walk

/* Face player */
if(x < obj_player.x) {
    image_xscale = -1;
} else {
    image_xscale = 1;
}

if(obj_player.y > y) {
    sprite_index = walkSprite;
} else {
    sprite_index = walkUpSprite;
}

image_speed = walkAnimationSpeed;
if(customWalk == false) {
    scr_basic_enemy_walk();
}

scr_check_pit_enemy();
