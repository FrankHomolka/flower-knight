///scr_spawn_item_drop

if(random(1) < obj_player.heartSpawnChance) {
    instance_create(x,y + 20,obj_heart_pickup);
}
