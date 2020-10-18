//scr_boss_1_shockwave_state


if(attackLength == shockwaveAttackLength) {
    sprite_index = spr_boss_shock;
    image_speed = 0.15;
    path_end();
    spawnedShock = false;
}

if(floor(image_index) == 3 && !spawnedShock) {
    with(instance_create(x,y,obj_boss_1_shockwave)) {
        critChance = other.critChance;
    }
    audio_play_sound_on(myEmitter, snd_shockwave, false, 1);
    spawnedShock = true;
} else if(floor(image_index) == 0) {
    spawnedShock = false;
}

attackLength--;
if(attackLength < 0) {
    attacking = false;
    state = states.idle;
}
