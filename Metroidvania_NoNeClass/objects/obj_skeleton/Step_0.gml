#region variables
var ground = place_meeting(x, y+1, obj_wall);

//gravity
if(!ground){
	y_vel += GRAVITY * mass * global.vel_mult;
}
//forcing states
/*
if(keyboard_check_pressed(ord("E"))){
	state = "attack";
}

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

#endregion


//state machine
switch (state){
	#region idle
	case "idle":
		x_vel = 0;
		timer_state++;
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
		
		//going to walk state
		if(random(timer_state) > 300){// every frame, the chance of changing state gets higher
			state = choose("walking", "idle", "walking");
			timer_state = 0;
		}
		
		scr_attack_player(obj_player, dist, x_scale)

		break;
	#endregion
	#region walking
	case "walking":
		timer_state++;
		if(sprite_index != spr_skeleton_walk){
			image_index = 0;
			x_vel = choose(1,-1);
		}
	
		sprite_index = spr_skeleton_walk;
		
		//leaving state
		if(random(timer_state) > 300){
			state = choose("walking", "idle", "idle");
			timer_state = 0;
		}
		
		scr_attack_player(obj_player, dist, x_scale)

		break;
		
	#endregion
	#region taking hit
	case "hit":
		if(sprite_index != spr_skeleton_hit){// is not on hit state yet, frame must be 0
			image_index	= 0;
			//screen_shake(1);
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
	#endregion
	#region dead
	case "dead":
		x_vel = 0
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
	#endregion
	#region attack
	case "attack":
		x_vel = 0;
		if(sprite_index != spr_skeleton_attack){
			image_index	= 0;
		}
		
		sprite_index = spr_skeleton_attack;
		
		//creating damage
		//ta no frame, nao existe a hitbox, nao acabou o ataque e pode atacar
		if(image_index >= 8 && damage == noone && image_index < 12 && can_attack){
			damage = instance_create_layer(x + sprite_width/2, y - sprite_height/3, layer, obj_hitbox);
			damage.damage = attack;
			damage.parent_entity = id;
			can_attack = false;
		}
		
		//se a hitbox existe, o dano já acabou
		if(damage != noone && image_index >= 12){
			instance_destroy(damage, false);
			damage = noone;
		}
		
		//exiting state
		if(image_index > image_number-1){
			can_attack = true;
			state = "idle";
		}
		
	#endregion
}