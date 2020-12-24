///scr_spawn_item_drop

if(random(1) < obj_player.heartSpawnChance) {
    instance_create(x + 8,y + 4,obj_heart_pickup);
}
if(random(1) < 0.2) {
    numSpawn = floor(random_range(2,5));
    for(var i = 0; i < numSpawn; i++) 
        instance_create(x,y + 20,obj_enemy_drop);
}
