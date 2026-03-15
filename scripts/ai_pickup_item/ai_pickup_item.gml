function ai_pickup_item(){

	// Break
	// Someone beat us to our ietm
	if (!instance_exists(target_item)) { 
		target_item = -1;
		state = s_mill_about;
		return
	}
	
	// Pickup the item
	if (point_distance(x, y, desx, desy) < walk_speed + 1) {
		state = s_queue;
		place = enqueue();
		trade_item_id = target_item.item_id;
		trade_item_value = target_item.value;
		trade_item_shop_owned = true;
		holding = trade_item_id; // Dunno why but do
		instance_destroy(target_item);
		target_item = -1;
		return
	}
	
	// Action
	// Goto item
	if (instance_exists(target_item)) {
		if (instance_exists(target_item.node)) {
			desx = target_item.node.x;
			desy = target_item.node.y;
			move();
		}
	}
	
}
