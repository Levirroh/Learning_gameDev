//variables
var right, left, jump, attack;
var ground = place_meeting(x, y + 1, obj_wall)

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);
attack = keyboard_check(ord("J"));

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
			image_index = 0;
		} else if(jump || y_vel != 0){
			state = "jump";
			y_vel = (-max_vely * jump); // if pressed jump = 1 else it's 0, than it's falling
			image_index = 0;
		} else if(attack){
			state = "attack";
			image_index = 0;
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
			image_index = 0;
			y_vel = -max_vely;
		} else if(attack){
			state = "attack";
			image_index = 0;
		} 
			
		break;
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
	case "attack":
		if(combo == 0){
			sprite_index = spr_player_attack_01;
		} else if (combo == 1){
			sprite_index = spr_player_attack_02;
		} else if (combo == 2){
			sprite_index = spr_player_attack_03;
		}
		
		//creating hitbox
		if(image_index >= 2 && damage == noone){
			damage = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_hitbox);
			damage.damage = sword_attack;
			damage.parent_entity = id;
		}
		
		//combo animations
		if(attack && combo < 2 && image_index >= image_number - 1){
			combo++;
			image_index = 0; // reinicia a animação dos ataques
		}
		
		//changing state when animation stops
		
		if(image_index > image_number-1){
			state = "idle";
			combo = 0;
		}
		
		break;
}

if(keyboard_check(vk_enter)) room_restart();




