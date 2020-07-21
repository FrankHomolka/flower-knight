//scr_player_walk_particle
walk = part_system_create();
part_system_depth(walk, -y);

walkParticle = part_type_create();
part_type_shape(walkParticle, pt_shape_pixel);
part_type_size(walkParticle, 0.6, 0.6, 0, 0);
part_type_scale(walkParticle, 1, 1);
part_type_colour1(walkParticle, c_gray);
part_type_alpha1(walkParticle, 0.8);
part_type_speed(walkParticle, 0.1, 0.2, 0, 0);
part_type_direction(walkParticle, 90 - 30, 90 + 30, 0, 0.2);
part_type_orientation(walkParticle, 0, 0, 0, 0.2, 1);
part_type_blend(walkParticle, 1);
part_type_life(walkParticle, 40, 150);

emitter = part_emitter_create(walkParticle);
