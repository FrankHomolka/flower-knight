///scr_music_gain_down
if(global.musicGain > 0) {
    global.musicGain = global.musicGain - 0.1;
    audio_group_set_gain(audiogroup_music, global.musicGain, 0);
}
