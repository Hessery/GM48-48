if (y > 1080) { phy_active = true } else { phy_active = false }

if (global.game_state = "game") {
	
	// Make nodes for pathfinding
	// Check if on a shelf
	if (!picked_up) {
		if (y < 1080 && collision_point(x, y, obj_shelf, false, true)) { 
			on_a_shelf = true;
		} else {
			on_a_shelf = false;
			// Delete node if not on a shelf
			if (node != -1) {
				instance_destroy(node);
				node = -1;
			}
		}
	
		// Make our pathfinding node
		if (on_a_shelf && node = -1) {
			if (collision_point(x - 96, y, obj_shelf, false, true)) { side = 96 } else { side = -96 }
			node = instance_create_depth(x + side, y, depth, obj_path_node);
			node.item = id;
		}
	} else {
		// Remove our node. Dont come buy me im held.
		if (node != -1) {
			instance_destroy(node);
			node = -1;
		}
	}
	
	// Pickup items
	// We use a vector for the offset rather than x and y so we can scale the
	// image and the selection together
	if (mouse_check_button_pressed(mb_left)) {
		var item_half_width = (image_size / 2);
		if (
			mouse_x > x - item_half_width &&
			mouse_x < x + item_half_width &&
			mouse_y > y - item_half_width &&
			mouse_y < y + item_half_width
		) {
			
			picked_up = true;
			mouse_dir = point_direction(x, y, mouse_x, mouse_y);
			mouse_dis = point_distance(x, y, mouse_x, mouse_y) / image_scale;
		
		}
	}

	if (mouse_check_button(mb_left) && picked_up) {
		
		phy_position_x = mouse_x - lengthdir_x(mouse_dis * image_scale, mouse_dir);
		phy_position_y = mouse_y - lengthdir_y(mouse_dis * image_scale, mouse_dir);
		phy_speed_x = 0;
		phy_speed_y = 0;
		
	}

	if (mouse_check_button_released(mb_left) && picked_up) {
		picked_up = false;
		
		if (y < 1103) {
			// Released on floor
			phy_position_x = clamp(48 + floor(x / 96) * 96, 48, room_width - 48);
			phy_position_y = clamp(48 + floor(y / 96) * 96, 48, 99999);
		} else {
			// Relesed on counter
			phy_position_x = clamp(x, 48, room_width - 48);
			phy_position_y = clamp(y, 48, 2112)
			
			// I dont know how to make throwing objects a thing
			phy_speed_x = 0;
			phy_speed_y = 0;
		}
	}

}