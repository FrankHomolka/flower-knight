///scr_focus_chain_lightning_effect

scr_find_item('CHAIN LIGHTNING');
fireHitDamage = 0;
for(var j = 0; j < item[? 'numBought']; j++) {
    fireHitDamage += ((obj_player.attackDamage / 2) / (j + 1));
}
with(instance_create(x, y, obj_blank)) {
    hitDamage = other.fireHitDamage;
    shouldSpawnChain = true;
    target = other;
    numSpawned = 0;
    instance_change(obj_chain_lightning, true);
}
