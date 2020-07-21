///scr_clear_save
if file_exists("money.ini") {
    file_delete("money.ini");
    show_debug_message("money.ini SUCCESS deleted");
} else {
    show_debug_message("FAILED to delete file");
}

if file_exists("savedgame.sav") {
    file_delete("savedgame.sav");
    show_debug_message("savedgame.sav SUCCESS deleted");
} else {
    show_debug_message("FAILED to delete file");
}
