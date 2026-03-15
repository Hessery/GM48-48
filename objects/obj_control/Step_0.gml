// Special controls
if (keyboard_check(vk_escape)) { game_end() }
//if (keyboard_check_released(vk_space)) { global.debug = !global.debug }
//if (keyboard_check(ord("R"))) { game_restart() };
//if (keyboard_check_pressed(vk_enter)) {
//	//var next_in_line = array_shift(global.queue);
//	if (global.customer_at_counter != undefined) {
//		global.customer_at_counter.state = s_leave_shop;
//	}
// }


//// Queue controller
//// Make sure people stand in the right place
//for (var i = 0; i < array_length(global.queue); i ++) {
//	var customer = global.queue[i]
//	customer.place = i;
//}


// Walkins controller
// Only when game is running
if (global.game_state = "game") {
	var customers = instance_number(obj_customer);
	var maxCustomers = 3 * global.day;

	if (walkinTimer > 0) {
		// Decrease walkin timer
		walkinTimer --
	} else {
		// Reset walkin timer
		walkinTimer = irandom_range(180, 480);  // One check per 3-8 seconds
	
		// Attempt a walkin
		if (customers < maxCustomers) {
			// Create a customer offscreen
			instance_create_depth(-96, 96, depth, obj_customer);
		}
	}
}

// Customers approching the counter



// Resize window
var ww = window_get_width() / 16;
var wh = window_get_height() / 9;

if (ww != ww_previous) { window_set_size(ww * 16, ww * 9) }
if (wh != wh_previous) { window_set_size(wh * 16, wh * 9) }

ww_previous = ww;
wh_previous = wh;


if (global.debug) { 	
	if (mouse_check_button_released(mb_right)) {
		instance_create_depth(mouse_x, mouse_y, depth, obj_customer);
	}	
}


// Game state switch
var menu_alpha_delta = 0.1;
switch (global.game_state) {
	case "menu":
		global.menu_alpha = min(global.menu_alpha + menu_alpha_delta, 1)
	break;
	
	case "game":
		// Deactivate menu
		global.menu_alpha = max(global.menu_alpha - menu_alpha_delta, 0);
		
		if (global.menu_alpha = 0) {
			instance_deactivate_object(obj_menu_title);
			instance_deactivate_object(obj_menu_play);
			instance_deactivate_object(obj_menu_exit);
		}
		
		// Move between screens
		var screen_height = 1080;
		var zone_width = 72;
		var cam = view_camera;
		var cam_y = camera_get_view_y(cam);
		var reset_timer_length = 15;
	
		if (reset_timer != 0) { reset_timer -- }

		if (global.screen = "floor") {
			
			// Switching screen to counter
			if (mouse_y > screen_height - zone_width && reset_timer = 0) {
				global.screen = "counter";
				reset_timer = reset_timer_length;
			}
			
			// Move camera
			var dif = cam_y;
			camera_set_view_pos(cam, 0, cam_y - (dif / 16))
	
		} else {
			
			// Switching screen to floor
			if (mouse_y < screen_height + zone_width && reset_timer = 0) {
				global.screen = "floor";
				reset_timer = reset_timer_length;
			}
			
			// Move camera
			var dif = 1080 - cam_y;
			camera_set_view_pos(cam, 0, cam_y + (dif / 16))
			
		}
		
		
	break;
}