x = obj_player.x;
y = obj_player.y;
angle = obj_player.angle;

if (shot == true) {
   if (shot) {
	   switch (angle) {
	        case 0:
	            correction_shot_x = 13;
	            correction_shot_y = 20;
	            break;
	        case 90:
	            correction_shot_x = 20;
	            correction_shot_y = -13;
	            break;
	        case 180:
	            correction_shot_x = -12;
	            correction_shot_y = -20;
	            break;
	        case 270:
	            correction_shot_x = -20;
	            correction_shot_y = +12;
	            break;
	    }
		
		for(var i = 0; i < 5; i++){
			var b_shot = instance_create_layer(x + correction_shot_x, y + correction_shot_y, "Bullets", obj_bullet);
		    b_shot.direction = angle - 94 + i*2;
			b_shot.image_angle = b_shot.direction;
		    b_shot.speed = 5;
		}         

	    shot = false;
	}
}