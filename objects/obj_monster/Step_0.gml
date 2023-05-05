/// @description Insert description here
// You can write your code in this editor

if (follow) {
    // Calculate the distance and direction between obj_follower and the player
    var dist = point_distance(x, y, player_obj.x, player_obj.y);
    var dir = point_direction(x, y, player_obj.x, player_obj.y);

    // Move obj_follower towards the player
    x += lengthdir_x(follow_speed, dir) / 10;
    y += lengthdir_y(follow_speed, dir) / 10;
}

if (keyboard_check_pressed(ord("W"))) {
   if (global.water > 0){
   follow = false; // Stop following the player
    timer = room_speed * 7; // Start a timer for 5 seconds
}
}

if (timer > 0) {
    timer--; // Decrement the timer
    if (timer == 0) {
        follow = true; // Start following the player again
    }
}
