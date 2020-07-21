//scr_slime_attack(object);

object = argument0;

/* happens once */
if(object.attackCounter == object.attackTime) {
    audio_play_sound(snd_slime_attack, 10, false);
}

object.attackCounter--;

if(place_meeting(x, y, obj_player)) {
    obj_player.hit = true;
}

/* state end */
if(object.attackCounter < 0) {
    canAttack = false;
    object.attackCounter = object.attackTime;
    object.state = states.idle;
}
