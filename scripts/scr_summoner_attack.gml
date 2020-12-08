///scr_summoner_attack
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
    while(numSpawned < 3 && attempts < 400) {
        attemptX = x + random_range(-50,50);
        attemptY = y + random_range(-50,50);
        if(!collision_line(x,y,attemptX,attemptY,obj_wall,false,false)) {
            instance_create(attemptX,attemptY,obj_skeleton_summoner);
            numSpawned++;
        }
        attempts++;
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
