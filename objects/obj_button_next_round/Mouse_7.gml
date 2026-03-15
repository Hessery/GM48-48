if (global.day >= 5) {
	// End of game: reset and return to menu
	global.game_state = "menu";
	global.menu_alpha = 1;
	global.screen = "floor";
	global.day = 1;
	global.round_timer = 10800;
	global.store_value = 0;
	global.queue = [];
	global.customer_at_counter = -1;
	
	if (instance_exists(obj_offer)) { obj_offer.offer_items = []; }
	with (obj_customer) { instance_destroy(); }
	with (obj_item) {
		if (!shop_owned) { instance_destroy(); }
	}
	
	with (obj_control) {
		walkinTimer = 180;
		reset_timer = 0;
	}
	
	instance_activate_object(obj_menu_title);
	instance_activate_object(obj_menu_play);
	instance_activate_object(obj_menu_exit);
	
	// Delete the round end window and this button
	instance_destroy(obj_round_end);
	instance_destroy();
	return;
}

// Start the next round
global.round_timer = 10800;
global.game_state = "game";
global.day += 1;

// Delete the round end window
instance_destroy(obj_round_end);
instance_destroy();
