///scr_clear_save
if file_exists("savedgame.sav") {
    file_delete("savedgame.sav");
    show_debug_message("savedgame.sav SUCCESS deleted");
} else {
    show_debug_message("FAILED to delete file");
}

if file_exists("settings.ini") {
    file_delete("settings.ini");
    show_debug_message("settings.ini SUCCESS deleted");
} else {
    show_debug_message("FAILED to delete file");
}
