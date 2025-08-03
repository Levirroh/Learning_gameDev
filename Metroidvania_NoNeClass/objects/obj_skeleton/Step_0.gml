var ground = place_meeting(x, y+1, obj_wall);

//gravity
if(!ground){
	y_vel += GRAVITY * mass;
}
/*
if(keyboard_check_pressed(ord("P"))){
	state = "idle";
}
if(keyboard_check_pressed(ord("O"))){
	state = "hit";
}
if(keyboard_check_pressed(ord("I"))){
	state = "dead";
}
*/


//state machine

switch (state){
	case "idle":
		if(sprite_index != spr_skeleton_idle){
			image_index	= 0;
		}
		sprite_index = spr_skeleton_idle
		
		//change state conditions
		/*
		if(position_meeting(mouse_x, mouse_y, self)){
			if(mouse_check_button_pressed(mb_right)){
				current_life -= 2;
				state = "hit";
			}
		}*/
		
		
		break;
	case "hit":
		if(sprite_index != spr_skeleton_hit){// is not on hit state yet, frame must be 0
			image_index	= 0;
		}
		sprite_index = spr_skeleton_hit;
		
		//change state conditions
		if(current_life > 0){
			if(image_index > image_number-1){
			//still alive?
				state = "idle";
			} 
		} else {
			state = "dead";
		}
		
		
		break;
	case "dead":
		if(sprite_index != spr_skeleton_dead){
			image_index	= 0;
		}
		sprite_index = spr_skeleton_dead;
		
		
		//dying
		if(image_index > image_number-1){
			// keeps body on ground
			image_speed = 0;
			image_alpha -= .01
			//instance_destroy();	
			if(image_alpha <=0){
				instance_destroy();	
			}
		}
		
		break;	
}