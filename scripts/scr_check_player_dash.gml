//scr_check_player_dash
if(dodge && !isDodging) {
    isDodging = true;
}

if(isDodging) {
    scr_player_dash();
}
