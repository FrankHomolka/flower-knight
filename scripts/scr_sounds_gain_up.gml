///scr_sounds_gain_up
if(global.soundsGain < 1) {
    global.soundsGain = global.soundsGain + 0.1
    audio_group_set_gain(audiogroup_default, global.soundsGain, 0);
}
