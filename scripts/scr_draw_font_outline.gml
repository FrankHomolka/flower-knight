///scr_draw_font_outline(outlineText, textX, textY, scale*)
outlineText = argument[0];
textX = argument[1];
textY = argument[2];
textScale = 0.125;
textSep = 60;
textWidth = 800;
if(argument_count == 4) {
    textScale = argument[3];
}
 
draw_set_font(fnt_ui_outline);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_ext_transformed(textX,textY + 0.3, outlineText, textSep, textWidth, textScale, textScale, 0);
draw_text_ext_transformed(textX,textY + 0.5, outlineText, textSep, textWidth, textScale, textScale, 0);
draw_text_ext_transformed(textX,textY + 0.7, outlineText, textSep, textWidth, textScale, textScale, 0);
// Text
draw_set_color(c_white);
draw_text_ext_transformed(textX,textY, outlineText, textSep, textWidth, textScale, textScale, 0);

