//scr_draw_light(surface, size, color)
surface = argument0;
size = argument1;
color = argument2;
draw_set_blend_mode(bm_subtract);
surface_set_target(light);
draw_ellipse_color(x - lightSize / 2 - view_xview, 
                   y - lightSize / 2 - view_yview, 
                   x + lightSize / 2 - view_xview, 
                   y + lightSize / 2 - view_yview,
                   color,
                   c_black,
                   false);
surface_reset_target();
draw_set_blend_mode(bm_normal);
