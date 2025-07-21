var x1 = room_width	+ 50
var y1 = irandom_range(-440, -50);
var margem = 175;

var p_down = instance_create_layer(x1,y1, "Pipes", pipe);
p_down.sprite_index = spr_pipe; 

var p_up = instance_create_layer(x1,y1 + sprite_get_height(spr_pipe)+margem, "Pipes", pipe);
p_up.sprite_index = spr_pipe; 

var points = instance_create_layer(x1,p_up.y - sprite_get_height(Sprite7), "Pipes", obj_points);
points.target= p_up.id; 

 


alarm[0] = timer;