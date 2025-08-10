//shaking

view_xport[0] = random_range(-shake, shake);// the x position of the view will change to -1, 0 or 1
view_yport[0] = random_range(-shake, shake);// the y position of the view will change to -1, 0 or 1


shake *= .9;

//destroy
if(shake <= .2){
	instance_destroy()
}
