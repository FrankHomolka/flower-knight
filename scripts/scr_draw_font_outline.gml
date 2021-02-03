///scr_draw_font_outline(outlineText, textX, textY)
outlineText = argument0;
textX = argument1;
textY = argument2;
textScale = 0.125;
textSep = 60;
textWidth = 800;
 
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

