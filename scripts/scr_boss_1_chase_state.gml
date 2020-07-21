//scr_boss_1_chase_state

/* Face player */
if(x < obj_player.x) {
    image_xscale = 1;
} else {
    image_xscale = -1;
}

image_speed = 0.1;

if(!spawnedAttack) {
    sprite_index = spr_boss_1_walk;
    slashCooldown--;
    scr_basic_enemy_walk();
}

if(distance_to_point(obj_player.x,obj_player.y) < 15 && !spawnedAttack && slashCooldown <= 0) {
    slashCooldown = slashCooldownMax;
    sprite_index = spr_boss_1_slash_attack;
    image_speed = 0;
    image_index = 0;
    path_end();
    attackProjectile = instance_create(x + lengthdir_x(5, image_angle), y + lengthdir_y(5, image_angle), obj_boss_1_slash);
    spawnedAttack = true;
    with(attackProjectile) {
        source = other;
        attackDamage = other.attackDamage;
    }
}
