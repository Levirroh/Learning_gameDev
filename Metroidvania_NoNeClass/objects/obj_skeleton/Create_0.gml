// Inherit the parent event
event_inherited();

max_life = 5;
current_life = max_life;

max_velx = 1;
max_vely = 1;

alarm[0] = room_spd * (random(2) + 1);

timer_state = 0;