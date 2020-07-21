//scr_boss_2_head_idle_state
if(chargeCounter > (0.9 * chargeTime)) {
    y -= 0.5;
}
direction = point_direction(x,y,obj_player.x,obj_player.y);
chargeCounter--;
