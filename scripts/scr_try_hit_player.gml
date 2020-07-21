///scr_try_hit_player(attackDamage, dmgSource)

damage = argument0;
source = argument1;

obj_player.tryHit = true;
obj_player.hitDamage = damage;
obj_player.damageSource = source;
