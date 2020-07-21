///scr_heal_player(healAmount)

healAmount = argument0;
if(obj_player.hp + healAmount <= obj_player.maxHp) {
    obj_player.hp += healAmount;
} else if(obj_player.hp < obj_player.maxHp) {
    obj_player.hp = obj_player.maxHp;
}
