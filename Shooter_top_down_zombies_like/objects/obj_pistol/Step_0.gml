x = obj_player.x;
y = obj_player.y;
angle = obj_player.angle;

if (shot == true) {
   if (shot) {
	   switch (angle) {
	        case 0:
	            correction_shot_x = 15;
	            correction_shot_y = -10;
	            break;
	        case 90:
	            correction_shot_x = -10;
	            correction_shot_y = -45;
	            break;
	        case 180:
	            correction_shot_x = -10;
	            correction_shot_y = -50;
	            break;
	        case 270:
	            correction_shot_x = -15;
	            correction_shot_y = -19;
	            break;
	    }

	    var b_shot = instance_create_layer(x + correction_shot_x, y + correction_shot_y, "Bullets", obj_bullet);
	    b_shot.direction = angle - 90; 
	    b_shot.speed = 5;         

	    shot = false;
	}
}