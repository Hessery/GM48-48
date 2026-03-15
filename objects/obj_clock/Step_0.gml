if (global.round_timer != 0 && global.game_state = "game") {
	
	global.round_timer --
	
}

// End the round, goto end of round screen
if (global.round_timer = 0 && global.game_state = "game") { 
	
	// Move to end of round state
	global.game_state = "end of round";
	
	// Ensure any customer at the counter leaves
	if (instance_exists(global.customer_at_counter)) {
		global.customer_at_counter.state = s_leave_shop;
		global.customer_at_counter = undefined;
	}
	
	// Remove Customers
	// Remove customer offered items
	for (var i = 0; i < array_length(obj_offer.offer_items); i ++) {
		instance_destroy(obj_offer.offer_items[i]);
	}
	obj_offer.offer_items = [];
	
	// Make the round end window
	instance_create_depth(x, y, depth-100, obj_round_end);
	
}
