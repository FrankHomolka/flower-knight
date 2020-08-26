///scr_shield_quest
if(eyemissileDodges >= 10) {  
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Missiles dodged: ' + string(eyemissileDodges) + ' / 10';
}
