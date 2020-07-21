///scr_check_pit_enemy

/* Pit */
if(collision_rectangle(x - 1, y + 7, x + 1, y + 8, obj_pit, false, true)) {
    pitLagCounter--;
} else {
    pitLagCounter = pitLagTime;
}

if(pitLagCounter < 0) {
    if(pit = false)
        scr_try_hit_enemy(hp, self, false);
    pit = true;
    damageSource = obj_pit;
    deathSprite = sprite;
}
