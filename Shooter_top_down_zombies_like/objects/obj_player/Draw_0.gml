if (hit_timer > 0) {
    if ((hit_timer div 2) mod 2 == 0) {
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, angle, c_white, 0);
    } else {
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, angle, c_white, 1);
    }
} else {
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, angle, c_white, 1);
}

if (shot) {
    switch (angle) {
        case 0:
            correction_shot_x = -18;
            correction_shot_y = -10;
            break;
        case 90:
            correction_shot_x = -10;
            correction_shot_y = -45;
            break;
        case 180:
            correction_shot_x = -45;
            correction_shot_y = -53;
            break;
        case 270:
            correction_shot_x = -53;
            correction_shot_y = -19;
            break;
    }

    var b_shot = instance_create_layer(x + correction_shot_x, y + correction_shot_y, "Bullets", obj_bullet);
    b_shot.direction = angle - 90; 
    b_shot.speed = 5;         

    shot = false;
}




draw_text(10,10,global.points);