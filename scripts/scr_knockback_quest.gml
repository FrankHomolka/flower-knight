///scr_knockback_quest
if(bossHeadsCollected >= 20) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Heads Collected: ' + string(bossHeadsCollected) + ' / 20';
}
