//scr_get_adjacent_doors

/* Get num doors */
numDoors = 0;
doorUp = false;
doorRight = false;
doorDown = false;
doorLeft = false;

// door up
if(yy > 1) {
    if(ds_grid_get(mapGrid, xx, yy - 1) != 0) {
        numDoors++;
        doorUp = true;
    }
}
//door right
if(xx < ds_grid_width(mapGrid) - 1) {
    if(ds_grid_get(mapGrid, xx + 1, yy) != 0) {
        numDoors++;
        doorRight = true;
    }
}
// door down
if(yy < ds_grid_height(mapGrid) - 1) {
    if(ds_grid_get(mapGrid, xx, yy + 1) != 0) {
        numDoors++;
        doorDown = true;
    }
}
//door left
if(xx > 1) {
    if(ds_grid_get(mapGrid, xx - 1, yy) != 0) {
        numDoors++;
        doorLeft = true;
    }
}
