//variables
#region variables & inputs
var right, left, jump, attacking, dash;
var ground = place_meeting(x, y + 1, obj_wall)

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);
attacking = keyboard_check(ord("J"));
attacking = keyboard_check(ord("J"));
dash = keyboard_check(vk_lshift);
#endregion	

if(keyboard_check(vk_tab)){
	state = "hit"
}

#region  buffer

if(attack_buffer > 0){
	attack_buffer -= 4;
}

#endregion

#region movement
// movement 
x_vel = (right - left) * max_velx;

//gravity
if(!ground){
	if(y_vel < max_vely * 2){
		y_vel += GRAVITY * mass;
	}
}

#endregion


//initial state machine
switch(state){
	#region idle
	case "idle":
		//idle state
		sprite_index = spr_player_idle;
		
		//condition to change state
		
		//moving
		if(right || left){
			state = "moving"
			image_index = 0;
		} else if(jump || y_vel != 0){
			state = "jump";
			y_vel = (-max_vely * jump); // if pressed jump = 1 else it's 0, than it's falling
			image_index = 0;
		} else if(attacking){
			state = "attack";
			image_index = 0;
		} else if (dash){
			state = "dash";
			image_index = 0;	
		}
		
		
		break;
	#endregion
	#region moving
	case "moving":
		//moving state
		sprite_index = spr_player_moving;
		
		//change state condition
		//idle
		if(abs(x_vel == 0)){
			state = "idle";
			x_vel = 0;
		} else if(jump || y_vel != 0){
			state = "jump";
			y_vel = (-max_vely * jump);
			image_index = 0;
		} else if(attacking){
			state = "attack";
			image_index = 0;
		}  else if (dash){
			state = "dash";
			image_index = 0;	
		}
			
		break;
	#endregion 
	#region jump
	case "jump":
		if(y_vel > 0){ // falling
			sprite_index = spr_player_falling 
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
	#endregion
	#region	attack
	case "attack":
		#region	combo
		if(combo == 0){
			sprite_index = spr_player_attack_01;
		} else if (combo == 1){
			sprite_index = spr_player_attack_02;
		} else if (combo == 2){
			sprite_index = spr_player_attack_03;
		}
		#endregion
		
		//creating hitbox
		if(image_index >= 2 && damage == noone && can_attack){
			damage = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_hitbox);
			damage.damage = attack * attack_mult;
			damage.parent_entity = id;
			can_attack = false;
		}

		// using buffer
		if(attacking && combo < 2){
			attack_buffer = room_spd;
		}


		//combo animations
		if(attack_buffer && combo < 2 && image_index >= image_number - 1){
			combo++;
			image_index	= 0;
			can_attack = true;
			attack_mult += .5;
			if(damage){
				instance_destroy(damage, false);
				damage = noone;
			}
			attack_buffer = 0;
		}
		
		
		
		//changing state when animation stops		
		if(image_index > image_number-1){
			state = "idle";
			combo = 0;
			can_attack = true;
			attack_mult = 1;
			if(damage){
				instance_destroy(damage, false);
				damage = noone;
			}
		}
		if (dash){
			state = "dash";
			image_index = 0;
			combo = 0;
			if(damage){
				instance_destroy(damage, false);
				damage = noone;
			}
		} else if(jump || y_vel != 0){
			state = "jump";
			y_vel = (-max_vely * jump); // if pressed jump = 1 else it's 0, than it's falling
			image_index = 0;
		}
		
	break;
	#endregion
	#region dash
	case "dash":
		sprite_index = spr_player_dash;
		//changing state
		if(jump || y_vel != 0){
			state = "jump";
			y_vel = (-max_vely * jump);
			image_index = 0;
		}
		
		

		
		//speed
		x_vel = image_xscale * dash_vel;

		if(image_index >= image_number - 1){
			state = "idle";
		}
	break;
	#endregion
	#region hit
	case "hit":
		if(sprite_index != spr_player_hit){
			sprite_index = spr_player_hit;
			image_index = 0;
		}
		
		//stops when hit
		x_vel = 0;
		y_vel = 0;


		sprite_index = spr_player_hit;

		if(current_life > 0){
			if(image_index >= image_number - 1){
				state = "idle";
			}
		} else {
			if(image_index >= image_number - 1){
				state = "dead"
			}
		}
		break;
	#endregion
	#region dead
	case "dead":
		if(sprite_index != spr_player_dying){
			sprite_index = spr_player_dying;
			image_index = 0;
		}
		sprite_index = spr_player_dying;
		//stops while dying
		x_vel = 0;
		y_vel = 0;
		
		if(image_index >= image_number - 1){
			image_index = image_number - 1
			//room_restart();
		}
		break;
	#endregion
	default:
		state = "idle";
		break;
}

if(keyboard_check(vk_enter)) room_restart();
if(keyboard_check(vk_escape)) game_end();




