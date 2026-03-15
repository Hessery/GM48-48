function ai_approach_counter(){
	
	
	// Action
	desx = 96;
	desy = 1705;	
	
	if (point_distance(x, y, desx, desy) < walk_speed + 1) {
		x = desx;
		y = desy;
	} else {
		var dir = point_direction(x, y, desx, desy);
		var dis = point_distance(x, y, desx, desy);
		x += lengthdir_x(walk_speed * 3, dir);
		y += lengthdir_y(walk_speed * 3, dir);
	}
	
	// Break
	
	
}