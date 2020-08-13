///scr_speed_quest
if(skeletonKills >= 10) {
    show_debug_message('runner unlocked');
} else {
    show_debug_message('kill ' + string(10 - skeletonKills) + ' more skeletons');
}
