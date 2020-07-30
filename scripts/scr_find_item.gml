///scr_find_item(itemName);

itemName = argument0;

for(index = 0; index < ds_list_size(global.itemList); index++) {
    item = global.itemList[| index];
    if(item[? 'name'] == itemName) {
        break;
    }
}
