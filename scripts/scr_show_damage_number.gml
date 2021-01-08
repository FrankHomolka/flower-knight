///scr_show_damage_number(damage, color, target, crit)
damage = argument0;
numberColor = argument1;
numberTarget = argument2;
critAttack = argument3;

with(instance_create(x,y,obj_blank)) {
    color = other.numberColor;
    damage = other.damage;
    target = other.numberTarget;
    critAttack = other.critAttack;
    instance_change(obj_damage_number, true);
}
