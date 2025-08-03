//variables
var right, left, jump, attack;
var ground = place_meeting(x, y + 1, obj_wall)

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);

// movement 
x_vel = (right - left) * max_velx;

//gravity
if(!ground){
	if(y_vel < max_vely * 2){
		y_vel += GRAVITY * mass;
	}
}


//initial state machine
switch(state){
	case "idle":
		//idle state
		sprite_index = spr_player_idle;
		
		//condition to change state
		
		//moving
		if(right || left){
			state = "moving"
		} 
		
		if(jump){
			state = "jump";
			y_vel = -max_vely;
		} 
		
		
		break;
	case "moving":
		//moving state
		sprite_index = spr_player_moving;
		
		//change state condition
		//idle
		if(abs(x_vel == 0)){
			state = "idle";
			x_vel = 0;
		}else if(jump){
			state = "jump";
			y_vel = -max_vely;
		} 
		
		break;
	case "jump":
		if(y_vel > 0){ // falling
			sprite_index = spr_player_falling;
		} else {
			//making animation not repeat itself if theres more than 1 frame
			sprite_index = spr_player_jump;
			if(image_index >= image_number -1){
				image_index = image_number -1;
			}
		}
		
		//condition to change state
		
		if(ground){
			state = "idle";
			y_vel = 0;
		}
		 
		break;
}




