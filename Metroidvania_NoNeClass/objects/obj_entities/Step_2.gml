//colision system
var xVel = sign(x_vel)
var yVel = sign(y_vel)

// horizontal
repeat(abs(x_vel)) {
    if (place_meeting(x + xVel, y, obj_wall)) {
        x_vel = 0;
        break;
    }
    x += xVel;
}

// vertical
repeat(abs(y_vel)) {
    if (place_meeting(x, y + yVel, obj_wall)) {
        y_vel = 0;
        break;
    }
    y += yVel;
}