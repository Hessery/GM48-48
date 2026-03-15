function ai_queue(){
	
	// Break
	// If waiting at front of line
	if (x = desx && y = desy && place = 0) {
		// Leave queue and approach 
		
	}
	
	// Action
	desx = 96;
	desy = 900 - (place * 96);
	
	if (point_distance(x, y, desx, desy) < walk_speed + 1) {
		x = desx;
		y = desy;
	} else {
		var dir = point_direction(x, y, desx, desy);
		var dis = point_distance(x, y, desx, desy);
		x += lengthdir_x(walk_speed, dir);
		y += lengthdir_y(walk_speed, dir);
	}
	
}