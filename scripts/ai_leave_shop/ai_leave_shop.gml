function ai_leave_shop(){
	
	// Action
	desx = -96;
	desy = 96;
	
	move();
	
	// Break
	if (point_distance(x, y, desx, desy) < walk_speed + 1) {
		instance_destroy();
	}
	
	if (global.customer_at_counter == id) {
		global.customer_at_counter = undefined;	
	}
	
}