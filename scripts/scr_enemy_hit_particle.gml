//scr_enemy_hit_particle
enemyHit = part_system_create();
part_system_depth(enemyHit, -y - 100);

enemyHitParticle = part_type_create();
part_type_sprite(enemyHitParticle , spr_blood, 1, 0, true);
//part_type_shape(enemyHitParticle, pt_shape_pixel);
part_type_size(enemyHitParticle, 1, 1, 0, 0);
part_type_scale(enemyHitParticle, 1, 1);
part_type_alpha1(enemyHitParticle, 1);
part_type_speed(enemyHitParticle, 1, 2, 0, 0);
part_type_direction(enemyHitParticle, 0, 360, 0, 0.2);
part_type_orientation(enemyHitParticle, 0, 0, 0, 0.2, 1);
part_type_blend(enemyHitParticle, false);
part_type_life(enemyHitParticle, 10, 20);

enemyHitEmitter = part_emitter_create(enemyHitParticle);
