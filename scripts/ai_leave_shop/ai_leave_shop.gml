function ai_leave_shop(){
	
	// Action
	desx = -96;
	desy = 96;
	
	var dir = point_direction(x, y, desx, desy);
	var dis = point_distance(x, y, desx, desy);
	x += lengthdir_x(walk_speed, dir);
	y += lengthdir_y(walk_speed, dir);
	
	// Break
	if (point_distance(x, y, desx, desy) < walk_speed + 1) {
		instance_destroy();
	}
	
}