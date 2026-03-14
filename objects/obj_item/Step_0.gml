if (global.game_state = "game") {

	// Pickup items
	if (mouse_check_button_pressed(mb_left)) {
		var item_half_width = (image_size / 2);
		if (
			mouse_x > x - item_half_width &&
			mouse_x < x + item_half_width &&
			mouse_y > y - item_half_width &&
			mouse_y < y + item_half_width
		) {
		
			picked_up = true;
			x_dif = mouse_x - x;
			y_dif = mouse_y - y;
		
		}
	}

	if (mouse_check_button(mb_left) && picked_up) {
		x = mouse_x - x_dif;
		y = mouse_y - y_dif;
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