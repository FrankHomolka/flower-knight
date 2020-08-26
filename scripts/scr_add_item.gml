///scr_add_item(list, name, sprite, script, price, effectOnBuy, numBought, effectScript, *questScript, *questText, *questRarity)
var list = argument[0];
var name = argument[1];
var sprite = argument[2];
var script = argument[3];
var price = argument[4];
var effectOnBuy = argument[5];
var numBought = argument[6];
var effectScript = argument[7];

if(argument_count > 8) {
    var questScript = argument[8];
    var questText = argument[9];
    var questRarity = argument[10];
}

var map = ds_map_create();
ds_list_add(list,map);

if(argument_count > 8) {
    ds_map_add(map,"questScript", questScript);
    ds_map_add(map,"questText", questText);
    ds_map_add(map,"questRarity", questRarity);  
}

/* Adding diff data */
ds_map_add(map,"script", script);
ds_map_add(map,"name", name);
ds_map_add(map,"sprite", sprite);
ds_map_add(map,"price", price);
ds_map_add(map,"effectOnBuy", effectOnBuy);
ds_map_add(map,"numBought", numBought);
ds_map_add(map,"effectScript", effectScript);
