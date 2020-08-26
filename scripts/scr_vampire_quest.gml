///scr_vampire_quest
if(skeletonKills >= 50) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Skeletons Slayed: ' + string(skeletonKills) + ' / 50';
}
