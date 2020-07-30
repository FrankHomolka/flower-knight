//scr_focus_slime_effect

scr_find_item('SLIME');
slimeScale = item[? 'numBought'];

if(!place_meeting(x,y,obj_player_slime)) {
    with(instance_create(x,y,obj_blank)) {
        image_angle = obj_player.dashDirection - 90;
        xscale = other.slimeScale;
        if(other.slimeScale > 2) {
            yscale = (other.slimeScale / 2);
        } else {
            yscale = 1;
        }
        instance_change(obj_player_slime, true);
    }
}
