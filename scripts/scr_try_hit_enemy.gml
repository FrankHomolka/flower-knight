///scr_try_hit_enemy(damage, target, effect, knockbackMultiplier)

damage = argument0;
target = argument1;
effect = argument2;
knockbackMultiplier = argument3;

if(instance_exists(target)) {
    target.knockbackCounter = target.baseKnockback * knockbackMultiplier;
    target.tryHit = true;
    target.hitDamage = damage;
    target.effect = effect;
}
