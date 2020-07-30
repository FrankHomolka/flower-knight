//scr_focus_damage

if(obj_player.maxHp > 20) {
    scr_find_item('ASSASSIN');
    obj_player.attackDamage += floor(obj_player.attackDamage * (0.5 / item[? 'numBought']));
    
    /* Halve player hp */
    obj_player.maxHp = obj_player.maxHp - 20;
    obj_player.hp = obj_player.maxHp;
}
