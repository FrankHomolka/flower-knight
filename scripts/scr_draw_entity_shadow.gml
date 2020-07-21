///scr_draw_entity_shadow(width, height, xOffset, yOffset)
width = argument0;
height = argument1;
xOffset = argument2;
yOffset = argument3 + 8;

shadowAlpha = 0.3;

draw_set_alpha(shadowAlpha);
if(image_alpha < shadowAlpha) {
    draw_set_alpha(image_alpha);
}
draw_set_color(c_black);
draw_ellipse((floor(x) - (width / 2)) + xOffset, (floor(y) - (height / 2)) + yOffset,
             (floor(x) + (width / 2)) + xOffset, (floor(y) + (height / 2)) + yOffset, false);
draw_set_alpha(1);
