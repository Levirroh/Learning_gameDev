alarm[0] = 60; 
global.points = 0;
chest_created = 0;
if (instance_number(obj_controller) > 1) {
    instance_destroy();
}