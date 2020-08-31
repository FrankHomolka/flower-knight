//scr_player_basic_attack
if(isAttacking) {
        
    /* Done once */
    if(basicAttackCounter == basicAttackLength && !spawnedAttack) {
        audio_play_sound_on(myEmitter, snd_player_attack, false, 10);
        attackObject = instance_create(x, y, obj_player_basic_attack);
        attackFacing = direction_facing;
        spawnedAttack = true;
        image_speed = 0;
        image_index = 0;
    }
    
    if(image_index < image_number - 1) {
        image_index = image_number * (1 - (basicAttackCounter / basicAttackLength));
    }
    
    /* If player not moving */
    switch(attackFacing) {
        case facing.left:
            attackObject.x = x - attackDistance;
            attackObject.image_angle = 0;
            sprite_index = spr_player_attack_left;
            break;
        case facing.upLeft:
            attackObject.x = x - attackDistance;
            attackObject.image_angle = 0;
            sprite_index = spr_player_attack_left;
            break;
        case facing.up:
            attackObject.y = y - (attackDistance * 0.8);
            attackObject.image_angle = -90;
            sprite_index = spr_player_attack_up;
            break;
        case facing.upRight:
            attackObject.x = x + attackDistance;
            attackObject.image_xscale = -1;
            sprite_index = spr_player_attack_right;
            break;
        case facing.right:
            attackObject.x = x + attackDistance;
            attackObject.image_xscale = -1;
            sprite_index = spr_player_attack_right;
            break;
        case facing.downRight:
            attackObject.x = x + attackDistance;
            attackObject.image_xscale = -1;
            sprite_index = spr_player_attack_right;
            break;
        case facing.down:
            attackObject.y = y + (attackDistance * 0.8);
            attackObject.image_angle = 90;
            sprite_index = spr_player_attack_down;
            break;
        case facing.downLeft:
            attackObject.x = x - attackDistance;
            attackObject.image_angle = 0;
            sprite_index = spr_player_attack_left;
            break;
    }
    
    /* Animate weapon */
    basicAttackCounter--;
    
    /* End attack */
    if(basicAttackCounter < 0) {
        with(attackObject) {
            instance_destroy();
        }
        basicAttackCounter = basicAttackLength;
        isAttacking = false;
        spawnedAttack = false;
    }
}
