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

    /* Face player */
    if(x < obj_player.x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }
    audio_play_sound(attackSound, 10, false);
    
    with(instance_create(x,y,obj_blank)) {
        spawnOthers = true;
        source = other;
        attackDamage = other.attackDamage;
        x = other.x + lengthdir_x(5, image_angle);
        y = other.y + lengthdir_y(5, image_angle);
        targetX = obj_player.x;
        targetY = obj_player.y;
        instance_change(other.attackObject, true);
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
