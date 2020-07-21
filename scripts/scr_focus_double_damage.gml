//scr_focus_double_damage

/* Double player atk */
obj_player.attackDamage = floor(obj_player.attackDamage * 1.2);

/* Halve player hp */
obj_player.maxHp = obj_player.maxHp - 20;
obj_player.hp = obj_player.maxHp;
