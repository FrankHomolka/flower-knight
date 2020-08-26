///scr_bomb_quest
if(bombRoomRevealed) {
    scr_quest_unlock_item();
    return 'Complete';
} else {
    return 'Not Complete';
}
