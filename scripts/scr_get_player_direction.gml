//scr_get_player_direction

vertical = 0;
horizontal = 0;
dashDist = 10;

if(up) {
    vertical--;
}

if(down) {
    vertical++;
}

if(right) {
    horizontal++;
}

if(left) {
    horizontal--;
}

obj_player_dash.y = y;
obj_player_dash.x = x;

/* Set direction enum */
if(vertical == -1) {
    obj_player_dash.y = y - dashDist;
    if(horizontal == -1) {
        obj_player_dash.x = x - dashDist;
        direction_facing = facing.upLeft;
    } else if(horizontal == 1) {
        obj_player_dash.x = x + dashDist;
        direction_facing = facing.upRight;
    } else {
        direction_facing = facing.up;
    }
} else if(vertical == 1) {
    obj_player_dash.y = y + dashDist;
    if(horizontal == -1) {
        obj_player_dash.x = x - dashDist;
        direction_facing = facing.downLeft;
    } else if(horizontal == 1) {
        obj_player_dash.x = x + dashDist; 
        direction_facing = facing.downRight;
    } else {
        direction_facing = facing.down;
    }
} else if(horizontal == -1) {
    obj_player_dash.x = x - dashDist;
    direction_facing = facing.left;
} else if(horizontal == 1) {
    obj_player_dash.x = x + dashDist;
    direction_facing = facing.right;
}
