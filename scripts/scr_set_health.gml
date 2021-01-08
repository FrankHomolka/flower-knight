///scr_set_health(damage, source)

hitDamage = argument0;
source = argument1;
critAttack = false;

if(currentHp == hp) {
    if(source == noone) {
        randomHit = hitDamage;
    } else if(instance_exists(source)) {
        if(random(100) <= source.critChance) {
            randomHit = (hitDamage * 2) + floor(random(hitDamage / 2));
            critAttack = true;
        } else {
            randomHit = hitDamage;
        }
    } else {
        randomHit = hitDamage;
    }
    hp -= randomHit;
    scr_show_damage_number(randomHit, c_red, self, critAttack);
}
