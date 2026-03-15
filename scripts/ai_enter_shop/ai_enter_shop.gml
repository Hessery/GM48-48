function ai_enter_shop(){
	
	// Action
	move();
	
	// Break
	if (point_distance(x, y, desx, desy) < walk_speed) {
		// Actually arrive
		x = desx;
		y = desy;
		
		// Choose what to do
		if (!holding) {
			state = s_mill_about;
		} else {
			state = s_queue;
			place = enqueue();
		}
	}
	
}