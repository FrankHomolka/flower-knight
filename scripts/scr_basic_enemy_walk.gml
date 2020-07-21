//scr_basic_enemy_walk

/* Can change these */
target = obj_player;

// Start path
if(distance_to_point(target.x, target.y) > minDistance) {
    if(mp_grid_path(global.grid, path, x, y, target.x, target.y, 1)) {
        path_start(path, moveSpeed, path_action_stop, false);
    }
} else {
    path_end();
}
