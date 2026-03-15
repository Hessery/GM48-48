function ai_queue(){
	
	// Action - actually make them hit the front of the line before getting to the counter
	desx = 96;
	desy = 900 - (place * 96);
	
	// Break
	// If waiting at front of line
	if (state == s_queue && x == desx && y == desy && place == 0) {
		// Leave queue and approach 
		if (!global.customer_at_counter) {
			// Remove myself from the queue
			leaveQueue();
			global.customer_at_counter = id;
			state = s_approach_counter;
		}
	}
	
	updateMySpot();	
	
	if (point_distance(x, y, desx, desy) < walk_speed + 1) {
		x = desx;
		y = desy;
	} else {
		move();
	}
	
}