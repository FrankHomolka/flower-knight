//scr_boss_2_head_death_state
if(!dead) {
    dead = true;
    sprite_index = spr_boss_2_top_dead;
    speed = 0;
    instance_create(spawnX, spawnY, obj_next_room);
    obj_boss_2.inFight = false;
} else {
    event_inherited();
}
