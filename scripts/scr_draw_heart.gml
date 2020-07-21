///scr_draw_heart(minVal, maxVal, xVal, yVal)

minVal = argument0;
maxVal = argument1;
xVal = argument2;
yVal = argument3;
xScale = 5 * (gw / initial_gw);
yScale = xScale;

if(obj_player.hp > minVal) {
    if(obj_player.hp < maxVal) {
        draw_sprite_ext(spr_half_heart, 0, xVal, yVal, xScale, yScale, 0, c_white, 1);
    } else {
        draw_sprite_ext(spr_heart, 0, xVal, yVal, xScale, yScale, 0, c_white, 1);
    }
} else if(obj_player.maxHp > minVal) {
    draw_sprite_ext(spr_no_heart, 0, xVal, yVal, xScale, yScale, 0, c_white, 1);
}
