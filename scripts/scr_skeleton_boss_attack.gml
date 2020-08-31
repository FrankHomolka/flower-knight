//scr_skeleton_boss_attack

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
    spawnCounter++;

    /* Face player */
    if(x < obj_player.x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }
    audio_play_sound_on(myEmitter, attackSound, false, 1);
    attackProjectile = instance_create(x + lengthdir_x(5, image_angle), y + lengthdir_y(5, image_angle), attackObject);
    with(attackProjectile) {
        if(other.spawnCounter == 3) {
            spawnMinion = true;
        } else {
            spawnMinion = false;
        }
        source = other;
        attackDamage = other.attackDamage;
    }
    if(spawnCounter == 3) spawnCounter = 0;
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
