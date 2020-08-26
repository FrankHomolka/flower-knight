///scr_shadow_quest
if(attacksDodged >= 100) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Attacks Dodged: ' + string(attacksDodged) + ' / 100';
}
