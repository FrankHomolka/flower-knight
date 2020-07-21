///scr_try_hit_enemy(damage, target, effect)

damage = argument0;
target = argument1;
effect = argument2;

if(instance_exists(target)) {
    if(target.pit) {
        target.kbCounter = 0;
    } else {
        target.kbCounter = target.kbAmount;
    }
    target.tryHit = true;
    target.hitDamage = damage;
    target.effect = effect;
}
