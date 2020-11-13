//scr_burst_turret_attack
/* Face player */
if(obj_player.y + 32 < y) {
    sprite_index = attackUpSprite;
} else {
    sprite_index = attackSprite;
}
image_index = floor(sprite_get_number(attackSprite) * (1 - (attackCounter / attackTime)));

/* happens once */
if(attackCounter == attackTime) {
    attackCooldownCounter = attackCooldownMax;
    spawnedAttack = false;
    if(attackPause) {
        path_end();
    }
}

if(image_index == attackFrame && !spawnedAttack) {
    audio_play_sound_on(myEmitter, attackSound, false, 1);
    
    for(k = 0; k < 20; k++) {
        with(instance_create(x, y , obj_blank)) {
            image_angle = (360 / 20) * other.k;
            xTarget = x + lengthdir_x(20, image_angle);
            yTarget = y + lengthdir_y(20, image_angle);
            source = other;
            attackDamage = other.attackDamage;
            instance_change(other.attackObject, true);
        }
    }
    spawnedAttack = true;
}

attackCounter--;

/* state end */
if(attackCounter < 0) {
    attacking = false;
    canAttack = false;
    attackCounter = attackTime;
    state = states.idle;
}
