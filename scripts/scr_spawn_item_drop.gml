///scr_spawn_item_drop

var item = floor(random(4));

switch(item) {
    case 0:
        break;
    case 1:
        instance_create(x,y + 20,obj_heart_pickup);
        break;
    case 2:
        break;
        instance_create(x,y + 20,obj_heart_pickup);
    case 3:
        break;
    default:
        break;
}
