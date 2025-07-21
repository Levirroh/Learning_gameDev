velocidade_vertical = velocidade_vertical+gravidade;
velocidade_vertical = clamp(velocidade_vertical, -limitador_velv, limitador_velv)

angulo_birg = lerp(angulo_birg, -velocidade_vertical * 6, .1)

if(place_meeting(x,y+velocidade_vertical, wall)){
	while(!place_meeting(x,y + sign(velocidade_vertical), wall)){
		y=y+sign(velocidade_vertical);
	}
	velocidade_vertical = 0;
	room_restart();
}
y = y + velocidade_vertical; 
  
    