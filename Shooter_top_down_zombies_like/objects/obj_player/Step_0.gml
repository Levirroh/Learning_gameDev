var moving = false;
var vel = 1;
if (keyboard_check(vk_shift)){
	vel = 3;
} 

if (keyboard_check(vk_up)) {
    y -= vel;
    angle = 180;
    moving = true;
}
if (keyboard_check(vk_down)) {
    y += vel;
    angle = 0;
    moving = true;
}
if (keyboard_check(vk_left)) {
    x -= vel;
    angle = 270;
    moving = true;
}
if (keyboard_check(vk_right)) {
    x += vel;
    angle = 90;
    moving = true;
}

if (moving) {
    image_speed = 1;
} else {
    image_speed = 0;
    image_index = 1; 
}

if (hit_timer > 0) {
    hit_timer -= 1;
}

if(vida <= 0){
	
	ini_open("save.ini");
	var record = ini_read_real("pontos", "score", 0);
	if(global.points > record){
		ini_write_real("pontos", "score", global.points); 
	} 
	ini_close();    
	room_goto(Menu);
}