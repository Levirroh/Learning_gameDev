//creating game over screen

if(game_over){
	//getting info from screen
	var cam_x1 = camera_get_view_x(view_camera[0]);
	var cam_width = camera_get_view_width(view_camera[0]);
	var cam_x2 = cam_x1 + cam_width;
	var cam_middle_w = cam_x2 - cam_width/2;
	
	var cam_y1 = camera_get_view_y(view_camera[0]);
	var cam_height = camera_get_view_height(view_camera[0]);
	var cam_y2 = cam_y1 + cam_height;
	var cam_middle_h = cam_y2 - cam_height/2;
	
	
	
	var qtd = cam_height * .15;
	
	end_speed = lerp(end_speed, 1, .03);
	
	draw_set_color(c_black);
	draw_set_alpha(end_speed - .3);
	//making screen dark
	draw_rectangle(cam_x1,cam_y1,cam_x2,cam_y2, false);
		
	draw_set_alpha(1);

	//drawing top rectangle
	draw_rectangle(cam_x1, cam_y1, cam_x2, cam_y1 + qtd * end_speed, false);
	
	
	//drawing bottom rectangle
	draw_rectangle(cam_x1, cam_y2, cam_x2, cam_y2 - qtd * end_speed, false);
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	if(end_speed >= .85){
		game_over_speed = lerp(game_over_speed, 1, .01);
		draw_set_alpha(game_over_speed);
		//writing game over
		draw_set_font(fnt_gameOver);
		draw_set_valign(1);
		draw_set_halign(1);
		draw_set_color(c_red);
		draw_text(cam_middle_w+1, cam_middle_h+1	, "G a m e - O v e r");// shadow
		draw_set_color(c_white);
		draw_text(cam_middle_w, cam_middle_h, "G a m e - O v e r");
		draw_set_font(-1);
		
		draw_text(cam_middle_w, cam_middle_h+50, "Pressione ENTER para reiniciar")
		
		draw_set_valign(-1);
		draw_set_halign(-1);
		draw_set_alpha(-1);
	}
} else {
	end_speed = 0;
}