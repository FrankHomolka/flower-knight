///scr_draw_font_outline(outlineText, textX, textY, scale*, vertAlign*, textSep*, textWidth*, horAlign*, textColor*)
outlineText = argument[0];
textX = argument[1];
textY = argument[2];
textScale = 0.125;
textSep = 60;
textWidth = 800;
vertAlign = fa_bottom;
horAlign = fa_center;
textColor = c_white;
if(argument_count >= 4) {
    textScale = argument[3];
}
if(argument_count >= 5) {
    vertAlign = argument[4];
}
if(argument_count >= 6) {
    textSep = argument[5];
}
if(argument_count >= 7) {
    textWidth = argument[6];
}
if(argument_count >= 8) {
    horAlign = argument[7];
}
if(argument_count >= 9) {
    textColor = argument[8];
}
draw_set_font(fnt_ui_outline);
draw_set_color(c_black);
draw_set_halign(horAlign);
draw_set_valign(vertAlign);
draw_text_ext_transformed(textX,textY + 0.3, outlineText, textSep, textWidth, textScale, textScale, 0);
draw_text_ext_transformed(textX,textY + 0.5, outlineText, textSep, textWidth, textScale, textScale, 0);
draw_text_ext_transformed(textX,textY + 0.7, outlineText, textSep, textWidth, textScale, textScale, 0);
// Text
draw_set_color(textColor);
draw_text_ext_transformed(textX,textY, outlineText, textSep, textWidth, textScale, textScale, 0);

