//scr_enemy_knockback
path_end();
playerdirection = point_direction(x,y,obj_player.x,obj_player.y);
kbDirection = playerdirection + 180;
if(kbCounter > 0) {
    
    var xx = lengthdir_x(kbCounter, kbDirection);
    var yy = lengthdir_y(kbCounter, kbDirection);
    if(!place_meeting(x + xx, y, obj_wall)) {
        x += xx;
    }
    if(!place_meeting(x, y + yy, obj_wall)) {
        y += yy;
    }
    kbCounter -= 1/10;
}

scr_check_pit_enemy();
