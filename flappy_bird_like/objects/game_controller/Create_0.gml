global.score = 0;
font_map = "0123456789";
font = font_add_sprite_ext(spr_font, font_map, false,1);

view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
gui_width = view_width;
gui_height = view_height;
display_set_gui_size(gui_width,gui_height);

randomize();
timer = 135;
alarm[0] = timer;