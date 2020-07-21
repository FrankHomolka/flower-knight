//scr_destructible_particle(destructSprite)

destructSprite = argument0;
destructSystem = part_system_create();
part_system_depth(destructSystem, -y - 5);

destructParticle = part_type_create();
part_type_sprite(destructParticle , destructSprite, 0, 0, true);
//part_type_shape(enemyHitParticle, pt_shape_pixel);
part_type_size(destructParticle, 1, 1, 0, 0);
part_type_scale(destructParticle, 1, 1);
part_type_alpha1(destructParticle, 1);
part_type_speed(destructParticle, 1, 2, 0, 0);
part_type_direction(destructParticle, 0, 360, 0, 0);
part_type_orientation(destructParticle, 0, 0, 0, 0, 1);
part_type_blend(destructParticle, false);
part_type_life(destructParticle, 15, 25);

destructEmitter = part_emitter_create(destructParticle);
