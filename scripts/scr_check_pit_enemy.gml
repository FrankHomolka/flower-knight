///scr_check_pit_enemy

/* Pit */
if(collision_rectangle(x - 5, y, x + 1, y + 3, obj_pit, false, true)) {
    pitLagCounter--;
} else {
    pitLagCounter = pitLagTime;
}

if(pitLagCounter < 0) {
    if(state != states.death)
        scr_try_hit_enemy(hp, self, false, 0);
    pit = true;
    damageSource = obj_pit;
    deathSprite = sprite;
}
