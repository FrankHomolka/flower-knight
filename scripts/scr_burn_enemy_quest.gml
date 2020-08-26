///scr_burn_enemy_quest
if(skeletonBombKills > 0) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Skeletons Blown Up: ' + string(skeletonBombKills) + ' / 1';
}
