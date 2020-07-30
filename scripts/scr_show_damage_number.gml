///scr_show_damage_number(damage, color, target)
damage = argument0;
numberColor = argument1;
numberTarget = argument2;

with(instance_create(x,y,obj_blank)) {
    color = other.numberColor;
    damage = other.damage;
    target = other.numberTarget;
    instance_change(obj_damage_number, true);
}
