///scr_toggle_difficulty
if(global.difficulty == 'EASY') {
    text = "HARD";
    global.difficulty = 'HARD';
    //scr_set_and_save_settings("general", "showTutorial", false);
} else {
    text = "EASY";
    global.difficulty = 'EASY';
    //scr_set_and_save_settings("general", "showTutorial", true);
}
