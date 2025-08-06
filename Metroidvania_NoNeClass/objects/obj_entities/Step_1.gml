// direction
if(x_vel != 0) x_scale = sign(x_vel);
image_xscale = x_scale;


//showing state by user input

if(position_meeting(mouse_x, mouse_y, id)){
	if(mouse_check_button(mb_left)){
		show_state = !show_state;
	}
}

image_speed = img_spd / game_get_speed(gamespeed_fps) * global.vel_mult;