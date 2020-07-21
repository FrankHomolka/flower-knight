//scr_miniboss_1_attack

/* Face player */

attackCooldownCounter = attackCooldownMax;
sprite_index = attackSprite;
image_index = floor(sprite_get_number(attackSprite) * (1 - (attackCounter / attackTime)));

/* happens once */
if(attackCounter == attackTime) {
    spawnedAttack = false;
    if(attackPause) {
        path_end();
    }
    burstCounter++;
}

if(image_index == attackFrame && !spawnedAttack) {

    /* Face player */
    if(x < obj_player.x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }
    audio_play_sound(attackSound, 10, false);
    with(instance_create(x + lengthdir_x(5, image_angle), y + lengthdir_y(5, image_angle), attackObject)) {
        source = other;
        attackDamage = other.attackDamage;
    }
    spawnedAttack = true;
}

attackCounter--;

/* state end */
if(attackCounter < 0) {
    attacking = false;
    canAttack = false;
    if(burstCounter == burstNumber) {
        attackCooldownCounter = attackCooldownMax * 6;  
        burstCounter = 0;
    } else {
        attackCooldownCounter = attackCooldownMax;  
    }
    attackCounter = attackTime;
    state = states.idle;
}
