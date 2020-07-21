///scr_check_pit

/* Pit */
if(collision_rectangle(x - 1, y + 7, x + 1, y + 8, obj_pit, false, true) && 
  collision_rectangle(x - 1, y - 2, x + 1, y - 1, obj_pit, false, true) &&
  !ignorePit) {
    if(state == states.dash) {
        pitLagCounter -= 0.5;
    } else {
        pitLagCounter--;
    }
} else {
    pitLagCounter = pitLagTime;
}

if(pitLagCounter < 0) {
    if(hp == beforeHp) {
        scr_try_hit_player(20, noone);
    } else {
        state = states.pit;
    }
} else {
    beforeHp = hp;
}
