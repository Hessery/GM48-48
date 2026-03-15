function ai_mill_about(){
	
	// We can redo pathfinding later
	
	// Action
	// Goto des with pathfinding

	move();
	
	// Break
	if (point_distance(x, y, desx, desy) < walk_speed + 1) {
		
		// Actually arrive
		x = desx;
		y = desy;
		
		// Pause
		if (pause > 0) {
			pause --
		} else {
			
			// Choose to do something other than mill about
			if (irandom(5) = 1) {
				state = s_leave_shop;
			}
			if (irandom(1) = 1 && holding = -1) {
				state = s_pickup_item;
				target_item = instance_nearest(x, y, obj_item);
			}

			// No walk ins just to leave
			if (x = 96 && y = 96) { state = s_mill_about }
			
			pause = irandom_range(30, 120);
			while ((x = desx && y = desy) || collision_point(desx, desy, obj_shelf, false, true)) {
				desx = ((floor(irandom_range(256, room_width) / 96) + 1) * 96) - 48;
				desy = ((floor(irandom(room_height - 48) / 96) + 1) * 96) - 48;
			}
			
		}
	}
	
}