//scr_artillery_particle
system = part_system_create();
part_system_depth(system, -y - 100);

particle = part_type_create();
//part_type_sprite(particle , spr_magic_ball_particle, 1, 0, true);
part_type_shape(particle, pt_shape_pixel);
part_type_size(particle, 1, 1, 0, 0);
part_type_scale(particle, 1, 1);
part_type_colour1(particle, c_green);
part_type_alpha1(particle, 1);
part_type_speed(particle, 1, 2, 0, 0);
part_type_direction(particle, 0, 360, 0, 0.2);
part_type_orientation(particle, 0, 0, 0, 0.2, 1);
part_type_blend(particle, false);
part_type_life(particle, 10, 20);

emitter = part_emitter_create(particle);
