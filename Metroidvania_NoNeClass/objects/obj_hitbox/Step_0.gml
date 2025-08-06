var damaged; //= instance_place(x,y,obj_entities);
var damaged_list = ds_list_create();
var qtd = instance_place_list(x,y, obj_entities, damaged_list, false);


//adding everyone on hitbox on damage list
#region adding on damage list
for(var i = 0; i < qtd; i++){
	var attacked = damaged_list[| i];
	
	//if is not from the same parent entity
	if(object_get_parent(attacked.object_index) != object_get_parent(parent_entity.object_index))
	{
		// it only gets here if is possible to damage it
		
		//checking if can be damaged
		var can = ds_list_find_index(possible_targets, attacked) // if doesnt find it on the array, returns -1
		if(can == -1){// its not on damage list
			ds_list_add(possible_targets, attacked);
		}
	}
}
#endregion


#region aplicating damage
var size = ds_list_size(possible_targets);

for(var i = 0; i < size; i++){
	damaged = possible_targets[|i].id;
	
	if(damaged.state != "dash"){
		if(damaged.current_life > 0){
			damaged.state = "hit";
			damaged.image_index = 0;
			damaged.current_life -= damage;
		}
	}


//destroying lists
ds_list_destroy(possible_targets);
ds_list_destroy(damaged_list);


// after it hits everyone on the for loop, it destroys himself
// so it doesnt hit every single frame the same code
instance_destroy();


#endregion

#region old code
/*
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
*/
#endregion
