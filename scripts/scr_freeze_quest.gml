///scr_freeze_quest
if(instance_exists(obj_area_controller)) {
    if(obj_area_controller.area == 2) {
        scr_quest_unlock_item();
        return 'Complete';
    } else {
        return 'Not Complete';
    }
} else {
    return 'Not Complete';
}
