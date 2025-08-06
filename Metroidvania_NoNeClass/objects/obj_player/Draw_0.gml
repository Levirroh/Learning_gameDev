// Inherit the parent event
event_inherited();

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_text(x ,y - sprite_height * 1.2, current_life);

draw_set_valign(-1);
draw_set_halign(0);