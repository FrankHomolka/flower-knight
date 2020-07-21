//scr_enemy_melee_attack


attackCooldownCounter = attackCooldownMax;
sprite_index = attackSprite;
image_index = floor((sprite_get_number(sprite_index) * (1 - (attackCounter / attackTime))) - 0.5);

/* happens once */
if(attackCounter == attackTime) {
    path_end();
    if(x < obj_player.x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }
    playedSound = false;
}

/* Play attack sound */
if(image_index == attackFrame && !playedSound) {
    playedSound = true;
    audio_play_sound(attackSound, 10, false);
}

/* Try and hit player */
if(place_meeting(x, y, obj_player) && image_index == attackFrame) {
    scr_try_hit_player(attackDamage, id);
}

attackCounter--;

/* state end */
if(attackCounter < 0) {
    attacking = false;
    canAttack = false;
    attackCounter = attackTime;
    state = states.idle;
}
