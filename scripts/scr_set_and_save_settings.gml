///scr_set_and_save_settings(section, key, value)

section = argument0;
key = argument1;
value = argument2;

ini_open("settings.ini");
ini_write_real(section, key, value);
ini_close(); 
