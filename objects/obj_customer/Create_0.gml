// Determine the characters stats
trade_tolerance = irandom_range(0, 20);
walk_speed		= irandom_range(3, 6);

// Determine the characters looks - they better look good!
image_speed		= 0;
body			= irandom(sprite_get_number(sprite_index) - 1);
image_index		= body;

// While they always need a body, we're going to give hair and beard some possibilities to determine
// that, just maybe, they are bald or don't have a beard. Personally I prefer bald and bearded, but like
// I just think that's peak performance

hasHair		= irandom_range(-1, 7);
hasBeard	= irandom_range(-10, 5);

hair	= irandom(sprite_get_number(spr_hair) - 1); 
beard	= irandom(sprite_get_number(spr_beard) - 1);

