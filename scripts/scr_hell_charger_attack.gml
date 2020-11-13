//scr_hell_charger_attack

/* Face player */
if(obj_player.y + 32 < y) {
    sprite_index = attackUpSprite;
} else {
    sprite_index = attackSprite;
}
image_index = floor(sprite_get_number(attackSprite) * (1 - (attackCounter / attackTime)));

/* happens once */
if(attackCounter == attackTime) {
    
    slideDir = point_direction(x, y, obj_player.x, obj_player.y);
    slideDist = 25;
    slideSpeed = 2.5;
    slideAttackDist = 12;
    
    /* Face player */
    if(x < obj_player.x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }
    attackCooldownCounter = attackCooldownMax;
    spawnedAttack = false;
    if(attackPause) {
        path_end();
    }
}

attackX = x + lengthdir_x(slideDist, slideDir);
attackY = y + lengthdir_y(slideDist, slideDir);


if(image_index == 7 || image_index == 10 || image_index = 13) speed = 0;

if(image_index == 5 && !spawnedAttack) {
    if(!collision_line(x,y,attackX, attackY, obj_wall, false, false) && distance_to_point(attackX, attackY) > 16) {
        move_towards_point(attackX, attackY, slideSpeed);
    } else {
        speed = 0;
    }
    
    audio_play_sound_on(myEmitter, attackSound, false, 1);
    attackProjectile = instance_create(x + lengthdir_x(slideAttackDist, slideDir), y + lengthdir_y(slideAttackDist, slideDir), attackObject);
    with(attackProjectile) {
        image_angle = other.slideDir;
        source = other;
        attackDamage = other.attackDamage;
    }
    spawnedAttack = true;
}

if(image_index == 8 && spawnedAttack) {
    if(!collision_line(x,y,attackX, attackY, obj_wall, false, false) && distance_to_point(attackX, attackY) > 16) {
        move_towards_point(attackX, attackY, slideSpeed);
    } else {
        speed = 0;
    }
    audio_play_sound_on(myEmitter, attackSound, false, 1);
    attackProjectile = instance_create(x + lengthdir_x(slideAttackDist, slideDir), y + lengthdir_y(slideAttackDist, slideDir), attackObject);
    with(attackProjectile) {
        image_angle = other.slideDir;
        source = other;
        attackDamage = other.attackDamage;
    }
    spawnedAttack = false;
}

if(image_index == 11 && !spawnedAttack) {
    if(!collision_line(x,y,attackX, attackY, obj_wall, false, false) && distance_to_point(attackX, attackY) > 16) {
        move_towards_point(attackX, attackY, slideSpeed);
    } else {
        speed = 0;
    }
    audio_play_sound_on(myEmitter, attackSound, false, 1);
    attackProjectile = instance_create(x + lengthdir_x(slideAttackDist, slideDir), y + lengthdir_y(slideAttackDist, slideDir), attackObject);
    with(attackProjectile) {
        image_angle = other.slideDir;
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
    attackCounter = attackTime;
    state = states.idle;
}
