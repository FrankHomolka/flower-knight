///scr_toggle_music
if(global.playMusic) {
    text = "TURN MUSIC ON";
    global.playMusic = false;
    scr_set_and_save_settings("sound", "playMusic", false);
} else {
    text = "TURN MUSIC OFF";
    global.playMusic = true;
    scr_set_and_save_settings("sound", "playMusic", true);
}
