///scr_add_item(list, name, sprite, script, price, effectOnBuy, numBought);
var list = argument0;
var name = argument1;
var sprite = argument2;
var script = argument3;
var price = argument4;
var effectOnBuy = argument5;
var numBought = argument6;
var effectScript = argument7;

var map = ds_map_create();
ds_list_add(list,map);

/* Adding diff data */
ds_map_add(map,"script", script);
ds_map_add(map,"name", name);
ds_map_add(map,"sprite", sprite);
ds_map_add(map,"price", price);
ds_map_add(map,"effectOnBuy", effectOnBuy);
ds_map_add(map,"numBought", numBought);
ds_map_add(map,"effectScript", effectScript);
