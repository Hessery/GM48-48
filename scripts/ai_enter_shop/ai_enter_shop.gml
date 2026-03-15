function ai_enter_shop(){
	
	// Action
	var dir = point_direction(x, y, desx, desy);
	var dis = point_distance(x, y, desx, desy);
	x += lengthdir_x(walk_speed, dir);
	y += lengthdir_y(walk_speed, dir);
	
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
			array_push(global.queue, id);
			place = array_length(global.queue);
		}
	}
	
}