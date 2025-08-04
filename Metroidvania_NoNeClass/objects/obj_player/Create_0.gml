//making random be random
randomise();


// creating camera
var cam = instance_create_layer(x,y,layer, obj_camera);
cam.target = id;


//inherit the parent event

event_inherited();
room_spd = game_get_speed(gamespeed_fps);
max_life = 10;
current_life = max_life;

max_velx = 4;
max_vely = 6;

mass = 1;

show_state = true;

combo = 0;
damage = noone;
can_attack = true;
attack_mult = 1;
attack = 2;
attack_buffer = room_spd;

dash_vel = 8;