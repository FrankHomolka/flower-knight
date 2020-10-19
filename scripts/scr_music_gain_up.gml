///scr_music_gain_up
if(global.musicGain < 1) {
    global.musicGain = global.musicGain + 0.1
    audio_group_set_gain(audiogroup_music, global.musicGain, 0);
}
