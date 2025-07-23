var alpha = 1;
if (hit_timer > 0 && (hit_timer div 2) mod 2 == 0) {
    alpha = 0;
}
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, angle, c_white, alpha);

draw_text(10,10,global.points);