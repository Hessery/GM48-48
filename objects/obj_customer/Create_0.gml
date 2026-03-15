// Determine the characters stats
trade_tolerance = irandom_range(0, 20);
walk_speed		= random_range(3, 5);

// Determine the characters looks - they better look good!
image_speed		= 0;
body			= irandom(sprite_get_number(sprite_index) - 1);
image_index		= body;
image_scale		= 0.3;
flip_image		= 1;

flipped_recently_timer = 0;
flipped_recently_timer_default = 100;


// AI
state = s_enter_shop;
desx = 96;
desy = 96;
pause = 30;
target_item = -1;
holding = -1;
place = 0;
trade_item_id = -1;
trade_item_value = 0;
trade_item_inst = noone;
trade_item_shop_owned = true;
offer_created = false;
subtitle_text = "";
subtitle_timer = 0;
subtitle_timer_default = 180;

// While they always need a body, we're going to give hair and beard some possibilities to determine
// that, just maybe, they are bald or don't have a beard. Personally I prefer bald and bearded, but like
// I just think that's peak performance

hasHair		= irandom_range(-1, 7);
hasBeard	= irandom_range(-10, 5);
hasAcc		= irandom_range(-4, 4);
hasShirt	= irandom_range(-1, 6);

//		in	dent?

hair	= irandom(sprite_get_number(spr_hair) - 1); 
beard	= irandom(sprite_get_number(spr_beard) - 1);
acc		= irandom(sprite_get_number(spr_acc) - 1);
shirt	= irandom(sprite_get_number(spr_shirt) - 1);

// No naked ladies pls thanks
if (hair > 11) { hasShirt = true }

// pick selling or buying
selling_items = false;
if (get_stock_value() < 20) { selling_items = true }
if (random(3) < 2) { selling_items = true }
if (selling_items) {
	holding = irandom(sprite_get_number(spr_import) - 1);
	trade_item_id = holding;
	trade_item_shop_owned = false;
}
