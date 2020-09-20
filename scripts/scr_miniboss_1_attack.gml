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
    
    /* Burst attack */
    if(currentAttack == 'burst') {
        burstCounter++;
    }
    /* Explosion attack */
}

if(image_index == attackFrame && !spawnedAttack) {

    /* Face player */
    if(x < obj_player.x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }
    audio_play_sound_on(myEmitter, attackSound, false, 1);
    if(currentAttack == 'burst') {
        with(instance_create(x + lengthdir_x(5, image_angle), y + lengthdir_y(5, image_angle), obj_blank)) {
            xTarget = obj_player.x;
            yTarget = obj_player.y;
            source = other;
            attackDamage = other.attackDamage;
            image_angle = point_direction(x, y, xTarget, yTarget);
            instance_change(other.attackObject, true);
        }
    } else {
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
    }
    spawnedAttack = true;
}

attackCounter--;

/* state end */
if(attackCounter < 0) {
    attacking = false;
    canAttack = false;
    if(currentAttack == 'burst') {
        if(burstCounter == burstNumber) {
            attackCooldownCounter = attackCooldownMax * 6;  
            burstCounter = 0;
            currentAttack = 'explosion';
        } else {
            attackCooldownCounter = attackCooldownMax;  
        }
    } else {
        attackCooldownCounter = attackCooldownMax * 6; 
        currentAttack = 'burst';
    }
    attackCounter = attackTime;
    state = states.idle;
}
