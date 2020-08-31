///scr_boss_flash_white(object, xScale, yScale)

object = argument0;
xScale = argument1;
yScale = argument2;

/* Done once */
if(object.flashCounter == object.flashTime) {
    if(hp > 0) {
        audio_play_sound_on(myEmitter, object.hurtSound, false, 1);
    } else {
        audio_play_sound_on(myEmitter, object.deathSound, false, 1);
        sprite_index = deathSprite;
    }
}

object.flashCounter--;

/* Only draw flash for first half */
if(object.flashCounter > (object.flashTime / 2)) {
    shader_set(shd_white_hit);
    draw_sprite_ext(sprite_index,image_index,x,y,xScale,yScale,0,c_white,1);
    shader_reset();
}

if(object.flashCounter < 0) {
    hit = false;
    if(hp > 0) {
        object.flashCounter = object.flashTime;
    }
}
