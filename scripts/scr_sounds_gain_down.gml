///scr_sounds_gain_down
if(global.soundsGain > 0) {
    global.soundsGain = global.soundsGain - 0.1;
    audio_group_set_gain(audiogroup_default, global.soundsGain, 0);
}
