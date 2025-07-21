var side = irandom(3);
var zx, zy;

switch (side) {
    case 0: zx = irandom(room_width); zy = -32; break;        
    case 1: zx = irandom(room_width); zy = room_height + 32; break; 
    case 2: zx = -32; zy = irandom(room_height); break;        
    case 3: zx = room_width + 32; zy = irandom(room_height); break; 
}

instance_create_layer(zx, zy, "Zombies", obj_zombie);
alarm[0] = irandom_range(30, 120);