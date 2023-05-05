/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_blackbox, 0, 0, 0);

draw_sprite(spr_blackbox, 0, 0, 477);

draw_text(0, 1, "Holy Water: ");
draw_text(100, 1, global.water);

draw_text(0, 476, text);


if (keyboard_check(ord("I")))
{
	draw_sprite(spr_inventory, 0, 0, 50);
	if (global.hasGoldKey)
	{
		draw_text(50, 50, "Golden Key");
	}
	if (global.hasSkeletonKey)
	{
		draw_text(50, 70, "Skeleton Key");
	}
	if (global.hasMagicPowder)
	{
		draw_text(50, 90, "Mysterious Ingredients");
	}
	
	if (global.hasPotion)
	{
		draw_text(50, 110, "Magic Potion");
	}
	
	if (global.hasRitual_1)
	{
		draw_text(260, 50, "Ritual Components");
	}
	
	if (global.hasRitual_2)
	{
		draw_text(260, 70, "Ritual Book");
	}
	
	if (global.hasOffering)
	{
		draw_text(260, 90, "Offering");
	}
	
	if (global.hasKnife)
	{
		draw_text(260, 110, "Knife");
	}
}


