var damaged = instance_place(x,y,obj_entities);


//if colided with other
if(damaged){
	//not who hit
	if(damaged.id != parent_entity){
		if(damaged.current_life > 0){
			damaged.state = "hit";
		}
		damaged.current_life -= damage;
		instance_destroy();
	}
}
//instance_destroy();
