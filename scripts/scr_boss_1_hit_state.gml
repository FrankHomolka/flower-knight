///scr_boss_1_hit_state
if(stunned) {
    sprite_index = spr_boss_1_stunned;
    image_speed = 0.2;
    stunCounter--;
}

scr_set_health(hitDamage, obj_player);
