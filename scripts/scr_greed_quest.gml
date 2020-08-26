///scr_greed_quest
if(gold >= 2000) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Gold Collected: ' + string(gold) + ' / 2000';
}
