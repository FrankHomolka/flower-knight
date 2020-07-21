///scr_toggle_tutorial
if(global.showTutorial) {
    text = "TURN TUTORIAL ON";
    global.showTutorial = false;
    scr_set_and_save_settings("general", "showTutorial", false);
} else {
    text = "TURN TUTORIAL OFF";
    global.showTutorial = true;
    scr_set_and_save_settings("general", "showTutorial", true);
}
