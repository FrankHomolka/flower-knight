///scr_attack_speed_quest
if(beatBoss1 && beatBoss2 && beatMiniboss1 && beatMiniboss2) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Not Complete';
}
