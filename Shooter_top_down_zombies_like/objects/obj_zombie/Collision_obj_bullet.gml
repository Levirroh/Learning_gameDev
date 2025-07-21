vida -= 5;
if(vida <= 0){
	global.points += 1;
	instance_destroy();    
}
with (other) instance_destroy(); 