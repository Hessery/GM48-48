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
		array_push(global.queue, id);
		place = array_length(global.queue);
		holding = target_item.item_id; // Dunno why but do
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
			var dir = point_direction(x, y, desx, desy);
			var dis = point_distance(x, y, desx, desy);
			x += lengthdir_x(walk_speed, dir);
			y += lengthdir_y(walk_speed, dir);
		}
	}
	
}