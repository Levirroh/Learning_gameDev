if (instance_exists(obj_player)) {
	var px = obj_player.x;
	var py = obj_player.y;
    
    var dist = point_distance(x, y, px, py);

    if (dist > speed) {
        direction = point_direction(x, y, px, py);
        x += lengthdir_x(speed, direction);
        y += lengthdir_y(speed, direction);
    }
	image_angle = direction + 90; 
}