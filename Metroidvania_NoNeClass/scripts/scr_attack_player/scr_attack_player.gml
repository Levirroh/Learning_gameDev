///@arg player
///@arg dist
///@arg x_scale
function scr_attack_player(player, dist, x_scale){
	//checking if player is on enemy line of sight

	var detected = collision_line(x,y -sprite_height/2, x + (dist *sign(x_scale)), y-sprite_height/2, player, 0, 1);

	if(detected){ //  entered line of sight
		state = "attack";
	}

}