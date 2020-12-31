///scr_show_player_dodged

with(instance_create(x,y,obj_blank)) {
    color = c_gray;
    damage = 'DODGED';
    target = obj_player;
    instance_change(obj_damage_number, true);
}
