//scr_boss_1_chase_state

/* Face player */
if(x < obj_player.x) {
    image_xscale = 1;
} else {
    image_xscale = -1;
}


if(!slashAttack) {
    image_speed = 0.1;
    sprite_index = spr_boss_1_walk;
    slashCooldown--;
    scr_basic_enemy_walk();
    attackProjectile = obj_boss_1_slash;
}

if(distance_to_point(obj_player.x,obj_player.y) < 50 && slashCooldown <= 0 && !slashAttack) {
    slashCooldown = slashCooldownMax;
    slashAttack = true;
    sprite_index = spr_boss_1_slash_attack;
    image_speed = 0.15;
    image_index = 0;
    slashTargetX = obj_player.x;
    slashTargetY = obj_player.y;
    attackDir = point_direction(x,y,slashTargetX,slashTargetY);
    prepareSound = audio_play_sound_on(myEmitter, snd_boss_1_prepare, false, 1);
    audio_play_sound_on(myEmitter, prepareSound, false, 1);
    path_end();
    
}

if(slashAttack && floor(image_index) == 6 && !instance_exists(attackProjectile)) {
    audio_stop_sound(prepareSound);
    with(instance_create(x + lengthdir_x(10, attackDir), y + lengthdir_y(10, attackDir), attackProjectile)) {
        source = other;
        move_towards_point(other.slashTargetX, other.slashTargetY, 3);
        image_angle = point_direction(x, y, other.slashTargetX, other.slashTargetY);
        attackDamage = other.attackDamage;
    }
}

if(floor(image_index) == 8) {
    slashAttack = false;
}
