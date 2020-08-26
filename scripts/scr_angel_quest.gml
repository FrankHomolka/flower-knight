///scr_angel_quest
if(numHeartsCollected >= 30) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Gathered: ' + string(numHeartsCollected) + ' / 30';
}
