// Random
randomise();


// Walkin controller
walkinTimer = 180; // Three second buffer as the game starts


// Dont have more than one control object per game
if (instance_number(obj_control) > 1) { 
	instance_destroy();
	return
}


// Setup game state
global.game_state = "menu";
global.menu_alpha = 1;
global.debug = false;
global.screen = "floor";
global.day = 1;
global.store_value = 0;
global.queue = [];
global.customer_at_counter = -1;

// Debug
if (global.debug) { window_set_size(960 * 1.5, 540 * 1.5) }


// Setup nice window resizing
ww_previous = window_get_width() / 16;
wh_previous = window_get_height() / 9;


// View switching
reset_timer = 0;