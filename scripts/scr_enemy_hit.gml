//scr_enemy_hit

/* Face player */
if(x < obj_player.x) {
    image_xscale = -1;
} else {
    image_xscale = 1;
}

/* Knockback */
scr_enemy_knockback();

scr_set_health(hitDamage, obj_player); // CHANGE THISSSSSSSSSSSS

scr_check_pit_enemy();
