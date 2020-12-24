///scr_toggle_music
if(global.playMusic) {
    sprite = spr_music_on;
    global.playMusic = false;
    scr_set_and_save_settings("sound", "playMusic", false);
} else {
    sprite = spr_music_off;
    global.playMusic = true;
    scr_set_and_save_settings("sound", "playMusic", true);
}
