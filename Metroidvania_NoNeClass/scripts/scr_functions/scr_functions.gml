function scr_functions(){

}

//screen shake


///@function screen_shake(shake_value)
///@arg _shake
function screen_shake(_shake){
	var shake = instance_create_layer(0, 0, "instances", obj_screen_shake);
	shake.shake = _shake;
	
}