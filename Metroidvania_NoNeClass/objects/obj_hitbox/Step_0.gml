var damaged = instance_place(x,y,obj_entities);


//if colided with other
if(damaged){
	if(damaged.id != parent_entity){
		var parent = object_get_parent(damaged.object_index);
		// its NOT from the same parent (enemy cant attack enemy)
		if(parent != object_get_parent(parent_entity.object_index)){
			//not who hit
			if(damaged.state != "dash"){
				if(damaged.current_life > 0){
					damaged.state = "hit";
					damaged.image_index = 0;
					damaged.current_life -= damage;
					instance_destroy();	
				}
			}
		}	
	}
}
//instance_destroy();
