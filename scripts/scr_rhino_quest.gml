///scr_rhino_quest
if(timesStunnedBoss1 >= 20) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Stunned: ' + string(timesStunnedBoss1) + ' / 20';
}
