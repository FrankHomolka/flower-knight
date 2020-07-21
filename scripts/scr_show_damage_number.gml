//scr_show_damage_number(damage)
damage = argument0;

with(instance_create(x,y,obj_damage_number)) {
    damage = other.damage;
}
