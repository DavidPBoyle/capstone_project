/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
player_obj = obj_player; // Replace obj_player with the name of the object that represents the player
follow_speed = 4; // The speed at which obj_follower will follow the player
follow = true; // A flag that indicates whether obj_follower is following the player
timer = 0; // A timer that will be used to stop following for 5 seconds when the W key is pressed