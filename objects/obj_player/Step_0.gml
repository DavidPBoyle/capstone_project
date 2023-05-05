/// @description Insert description here
// You can write your code in this editor

//Cheats:

//Give all items
if (keyboard_check(ord("M")))
{
	global.hasGoldKey = true;
	global.hasSkeletonKey = true;
	global.hasMagicPowder = true;
	global.hasPotion = true;
	global.hasRitual_1 = true;
	global.hasRitual_2 = true;
	global.hasKnife = true;
	global.hasRitual = true;
	global.hasOffering = true;
	global.water = 50;
}

// Handle player movement
if keyboard_check(vk_nokey)
{
	image_speed = 0;
	image_index = 0;
}

if keyboard_check(vk_right) {
    hspeed = 0.5;
    vspeed = 0;
	image_speed = 0.5;
	sprite_index = spr_playerRight;
} else if keyboard_check(vk_left) {
    hspeed = -0.5;
    vspeed = 0;
	image_speed = 0.5;
	sprite_index = spr_playerLeft;
} else if keyboard_check(vk_down) {
    hspeed = 0;
    vspeed = 0.5;
	image_speed = 0.5;
	sprite_index = spr_playerRight;
} else if keyboard_check(vk_up) {
    hspeed = 0;
    vspeed = -0.5;
	image_speed = 0.5;
	sprite_index = spr_playerVert;
} else {
    // Stop moving if no keys are pressed
    hspeed = 0;
    vspeed = 0;
}

if place_meeting(x + hspeed, y, obj_collision) {
    // Don't move in this direction
    hspeed = 0;
}

if place_meeting(x, y + vspeed, obj_collision) {
    // Don't move in this direction
    vspeed = 0;
}


if (distance_to_object(obj_chest_1) < 2 && !chest1Open) {
	text = "Press 'TAB' to open chest";
	if (keyboard_check(vk_tab) ){
		audio_play_sound(snd_door_open, 1, false);	// replace "snd_my_sound" with the name of your sound resource
		global.hasGoldKey = true;
		chest1Open = true;
		global.water += 1;
	}
}

else if (distance_to_object(obj_door_collision) < 2) 
{
	if (keyboard_check(vk_tab))
	{
		if(global.hasGoldKey = true)
		{
			isOpen = true;
			key_door.image_index = 1;
			instance_destroy(obj_door_collision);
			audio_play_sound(snd_door_open, 7, false);
		}
		else
		{
			text = "You require a golden key";
		}
	}
}

else if (distance_to_object(obj_door_collision1) < 2){
	if (keyboard_check(vk_tab))
	{
		isOpen = true;
		key_door_2.image_index = 1;
		instance_destroy(obj_door_collision1);
		audio_play_sound(snd_door_open, 7, false);
	}
}


else if (distance_to_object(obj_chest_2) < 2 && !chest2Open) {
	text = "Press 'TAB' to open chest";
	if (keyboard_check(vk_tab)){  
		audio_play_sound(snd_door_open, 1, false);	// replace "snd_my_sound" with the name of your sound resource
		global.hasSkeletonKey = true;
		chest2Open = true;
		global.water += 1;
   }
}

else if (distance_to_object(obj_chest) < 2 && !chestOpen) {
  text = "Press 'TAB' to open chest";
  if (keyboard_check(vk_tab))
  {
	audio_play_sound(snd_door_open, 1, false);	// replace "snd_my_sound" with the name of your sound resource
	global.hasMagicPowder = true;
	chestOpen = true;
	global.water +=1;
  }
}

else if (distance_to_object(obj_door_collision2) < 2) 
{
	if (keyboard_check(vk_tab))
	{
		if(global.hasSkeletonKey = true)
		{
			isOpen = true;
			key_door_3.image_index = 1;
			instance_destroy(obj_door_collision2);
			audio_play_sound(snd_door_open, 7, false);
		}
		else
		{
			text = "You require a skeleton key";
		}
	}
}

else if (place_meeting(x, y, obj_exit_start))
{
	obj_player.x = 504;
	obj_player.y = 30;
	audio_stop_sound(snd_dungeon);
	room_goto(rm_crypt);
}

else if (place_meeting(x, y, obj_exit_crypt))
{
	obj_player.x = 511;
	obj_player.y = 16;
	audio_stop_sound(snd_crypt);
	room_goto(rm_mossy);
}

else if (distance_to_object(obj_cauldron) < 2)
{
	if (!right_ingredient)
	{
		text = "What item would you like to put into the cauldron?";
	}
	
	if (keyboard_check_pressed(vk_tab))
	{
		if (global.hasMagicPowder = true)
		{
			right_ingredient = true;
			text = "You mix in the ingredients and obtain a potion!";
			audio_play_sound(snd_cauldron, 7, false);
			global.hasPotion = true;
		}
	
	}
}

else if (distance_to_object(obj_gravel_6) < 1)
{
	if (!right_object)
	{
		text = "You might want to drink a potion (TAB)";
	}
	if (keyboard_check_pressed(vk_tab))
	{
		if (global.hasPotion = true)
		{
			right_object = true;
			text = "The potion allows you to see a ritual object";
			global.hasRitual = true;
			global.hasRitual_1 = true;
			global.hasRitual_2 = true;
			global.water += 1;
			
		}
	}
}


else if (distance_to_object(obj_gravel_4) < 1)
{
	if (!done_ritual)
	{
		text = "This is a good spot to do a ritual (TAB)";
	}
	
	if (keyboard_check_pressed(vk_tab))
	{
		if (global.hasRitual = true)
		{
			right_object = true;
			text = "You perform the ritual and the table is repaired";
			obj_broken_table.image_index = 0;
			global.hasOffering = true;
			global.water += 1;
			done_ritual = true;
		}
	}
}



else if (distance_to_object(obj_broken_table) < 2 && global.hasOffering)
{
	if (!gave_ritual)
	{
		text = "Give an offering! (TAB)";
	}
	
	if (keyboard_check(vk_tab))
	{
		gave_ritual = true;
		instance_destroy(obj_bars);
		text = "You give an offering and the metal bars rise!";
	}
}

else if (distance_to_object(obj_cauldron3) < 2)
{
	if (!potion)
	{
		text = "Brew a potion (TAB)";
	}
	if (keyboard_check(vk_tab))
	{
		potion = true;
		text = "You drink the potion and the gate opens";
		instance_destroy(obj_bars2);
	}
}

else if (distance_to_object(obj_armor1) < 2)
{
	if (!has_water)
	{
		text = "Take holy water (TAB)";
		if (keyboard_check(vk_tab)){
		global.water += 2;
		has_water = true;}
	}
}

else if (distance_to_object(obj_armor2) < 2)
{
	if (!noFlip1)
	{
		text = "Interact with statue? (TAB)";
	}
	if (global.flippedSwitch2 && keyboard_check(vk_tab)){
		noFlip1 = true;
		global.switches = true;
		instance_destroy(obj_bars3);
		text = "You hear the iron gate open";
	}
	
	else if (keyboard_check(vk_tab))
	{
		noFlip1 = true;
		text = "You flip a switch behind the statue";
		global.flippedSwitch1 = true;
	}
}

else if (distance_to_object(obj_armor3) < 2)
{
	if (!noFlip2)
	{
		text = "Interact with statue? (TAB)";
	}
	if (global.flippedSwitch1 && keyboard_check(vk_tab)){
		noFlip2 = true;
		text = "You hear the iron gate open";
		global.switches = true;
		instance_destroy(obj_bars3);
	}
	
	else if (keyboard_check(vk_tab))
	{
		noFlip2 = true;
		text = "You flip a switch behind the statue";
		global.flippedSwitch2 = true;
	}
}

else if (distance_to_object(obj_armor4) < 2)
{
	if (!pressed1)
	{
		text = "Interact with statue? (TAB)";
	}
	
	if (!has_pressed1){
	if (keyboard_check(vk_tab))
		{
			boil += 1;
			has_pressed1 = true;
			if (boil = 1)
			{
				pressed1 = true;
				text = "The cauldron starts boiling...";
			}
			
			if (boil = 2)
			{
				pressed1 = true;
				text = "The cauldron is bubbling more...";
			}
			
			if (boil = 3)
			{
				pressed1= true;
				text = "The cauldron is going crazy!";
			}
		}
	}
}


else if (distance_to_object(obj_armor5) < 2)
{
	if (!pressed2)
	{
		text = "Interact with statue? (TAB)";
	}
	
	if (!has_pressed2){
	if (keyboard_check(vk_tab))
		{
			boil += 1;
			has_pressed2 = true;
			if (boil = 1)
			{
				pressed2 = true;
				text = "The cauldron starts boiling...";
			}
			
			if (boil = 2)
			{
				pressed2 = true;
				text = "The cauldron is bubbling more...";
			}
			
			if (boil = 3)
			{
				pressed2 = true;
				text = "The cauldron is going crazy!";
			}
		}
	}
}

else if (distance_to_object(obj_armor6) < 2)
{
	if (!pressed3)
	{
		text = "Interact with statue? (TAB)";
	}
	
	if (!has_pressed3){
	if (keyboard_check(vk_tab))
		{
			boil += 1;
			has_pressed3 = true;
			if (boil = 1)
			{
				pressed3 = true;
				text = "The cauldron starts boiling...";
			}
			
			if (boil = 2)
			{
				pressed3 = true;
				text = "The cauldron is bubbling more...";
			}
			
			if (boil = 3)
			{
				pressed3 = true;
				text = "The cauldron is going crazy!";
			}
		}
	}
}

else if (distance_to_object(obj_end_cauldron) < 2)
{
	if (boil = 3)
	{
		text = "Drink potion? (TAB)";
		if (keyboard_check(vk_tab))
		{
			audio_stop_all();
			room_goto(rm_victory);
		}
	}
	
}


else
{
	text = " ";
}