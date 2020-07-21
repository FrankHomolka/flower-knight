//scr_fire_particle
fireSystem = part_system_create();
part_system_depth(fireSystem, -y - 100);

fireParticle = part_type_create();
part_type_sprite(fireParticle , spr_fire_particle, 1, 0, true);
//part_type_shape(fireParticle, pt_shape_pixel);
part_type_size(fireParticle, 1, 1, 0, 0);
part_type_scale(fireParticle, 1, 1);
part_type_alpha1(fireParticle, 1);
part_type_speed(fireParticle, 1, 2, 0, 0);
part_type_direction(fireParticle, 0, 360, 0, 0.2);
part_type_orientation(fireParticle, 0, 0, 0, 0.2, 1);
part_type_blend(fireParticle, false);
part_type_life(fireParticle, 10, 20);

fireEmitter = part_emitter_create(fireParticle);
