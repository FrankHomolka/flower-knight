///scr_set_and_save_money(amount, destroySelf)

amount = argument0;
destroySelf = argument1;

ini_open("money.ini");
obj_money_controller.money += amount;
ini_write_real("currency", "money", obj_money_controller.money);
ini_close(); 
if(destroySelf)
    instance_destroy();   
