///scr_fireball_quest
if(enemiesBurned >= 40) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Burned: ' + string(enemiesBurned) + ' / 40';
}
