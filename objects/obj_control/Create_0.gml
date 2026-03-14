// Random
randomise();


// Dont have more than one control object per game
if (instance_number(obj_control) > 1) { 
	instance_destroy();
	return
}


// Setup game state
global.game_state = "menu";
global.menu_alpha = 1;
global.debug = true;
global.screen = "floor";

global.store_value = 0;


// Debug
// if (global.debug) { window_set_size(960, 540) }


// Setup nice window resizing
ww_previous = window_get_width() / 16;
wh_previous = window_get_height() / 9;