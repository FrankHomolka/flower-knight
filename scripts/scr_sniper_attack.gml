//scr_sniper_attack
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
    
    if(!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false)) 
        instance_create(x,y,obj_sniper_shot);
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
