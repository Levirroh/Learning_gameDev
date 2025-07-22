if(global.points % 10 == 0 && global.points > 0){
	if(chest_created == 0){
		var place = irandom(3);
		var zx, zy;

		switch (place) {
		    case 0: zx = irandom(room_width); zy = +50; break;        
		    case 1: zx = irandom(room_width); zy = room_height -50; break; 
		    case 2: zx = +50; zy = irandom(room_height); break;        
		    case 3: zx = room_width -50; zy = irandom(room_height); break; 
		}
		chest_created = 1;
		instance_create_layer(zx, zy, "Chests", obj_chest);
	}
} else{
	chest_created = 0;
}