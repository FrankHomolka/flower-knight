//scr_check_room_exists(xOffset, yOffset)

xOffset = argument0;
yOffset = argument1;

if(ds_grid_get(mapGrid, currentCellX + xOffset, currentCellY + yOffset) == 0) {
    ds_grid_set(mapGrid, currentCellX + xOffset, currentCellY + yOffset, "roomExists");
    
    xDistance = abs(currentCellX - centerCellX + xOffset);
    yDistance = abs(currentCellY - centerCellY + yOffset);
    if(sqrt(sqr(xDistance) + sqr(yDistance)) > maxDistance) {
        maxDistance = sqrt(sqr(xDistance) + sqr(yDistance));
        // Sets shop spawn
        if(bossCellX != 0) {
            shopCellX = bossCellX;
            shopCellY = bossCellY;   
        }
        // Sets boss room spawn
        bossCellX = currentCellX + xOffset;
        bossCellY = currentCellY + yOffset;   
    }
    currentCellX = centerCellX;
    currentCellY = centerCellY;
    numRooms++;
} else {
    currentCellY += yOffset;
    currentCellX += xOffset;
}
