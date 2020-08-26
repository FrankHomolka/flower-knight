///scr_parry_quest
if(skeletonSpearsReflected >= 20) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Spears Reflected: ' + string(skeletonSpearsReflected) + ' / 20';
}
