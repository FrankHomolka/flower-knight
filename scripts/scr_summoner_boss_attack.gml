///scr_summoner_boss_attack
sprite_index = attackSprite;
image_speed = 0.2;

/* happens once */
if(attackCounter == attackTime) {
    show_debug_message('can teleport');
    canTeleport = true;
    foundSpot = false;
    teleportAttempts = 200;
    attackCooldownCounter = attackCooldownMax;
    numSpawned = 0;
    attempts = 0;
    if(nextAttack == 1) {
        nextAttack = 2;
        while(numSpawned < 3 && attempts < 400) {
            attemptX = x + random_range(-50,50);
            attemptY = y + random_range(-50,50);
            if(!collision_line(x,y,attemptX,attemptY,obj_wall,false,false)) {
                instance_create(attemptX,attemptY,obj_cultist_summoner);
                numSpawned++;
            }
            attempts++;
        }
    } else {
        nextAttack = 1;
        while(numSpawned < 5 && attempts < 400) {
            attemptX = x + random_range(-150,150);
            attemptY = y + random_range(-150,150);
            if(!collision_line(x,y,attemptX,attemptY,obj_wall,false,false)) {
                with(instance_create(attemptX,attemptY,obj_explosion_summoner)) {
                    life = 250 - (50 * other.numSpawned);
                }
                numSpawned++;
            }
            attempts++;
        }
    }
    
}

attackCounter--;

/* state end */
if(attackCounter < 0) {
    if(instance_exists(buffTarget)) buffTarget.buffed = false;
    attacking = false;
    canAttack = false;
    attackCounter = attackTime;
    state = states.idle;
}
