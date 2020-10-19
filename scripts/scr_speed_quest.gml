///scr_speed_quest
if(eyeturretKills >= 10) {  
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Killed ' + string(eyeturretKills) + '/ 10 eye turrets';
}

