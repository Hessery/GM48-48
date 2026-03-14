if (global.game_state = "game") {

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
		
		x = mouse_x - lengthdir_x(mouse_dis * image_scale, mouse_dir);
		y = mouse_y - lengthdir_y(mouse_dis * image_scale, mouse_dir)
		
	}

	if (mouse_check_button_released(mb_left)) {
		picked_up = false;
		
		if (y < 1103) {
			// Released on floor
			x = clamp(48 + floor(x / 96) * 96, 48, room_width - 48);
			y = clamp(48 + floor(y / 96) * 96, 48, 99999);
		} else {
			// Relesed on counter
			x = clamp(x, 48, room_width - 48);
			y = clamp(y, 48, 2112)
		}
	}

}