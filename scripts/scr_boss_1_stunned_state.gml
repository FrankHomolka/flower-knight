//scr_boss_1_stunned_state

sprite_index = spr_boss_1_stunned;
image_speed = 0.2;
attacking = false;
stunCounter--;
if(stunCounter < 0) {
    stunCounter = stunLength;
    stunned = false;
}
