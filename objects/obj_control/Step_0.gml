// Quick special controls
if (keyboard_check(vk_escape)) { game_end() }
if (keyboard_check_released(vk_space)) { global.debug = true }
if (keyboard_check(ord("R"))) { game_restart() };


// Resize window
var ww = window_get_width() / 16;
var wh = window_get_height() / 9;

if (ww != ww_previous) { window_set_size(ww * 16, ww * 9) }
if (wh != wh_previous) { window_set_size(wh * 16, wh * 9) }

ww_previous = ww;
wh_previous = wh;


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

		if (global.screen = "floor") {
			
			// Switching screen to counter
			if (mouse_y > screen_height - zone_width) {
				global.screen = "counter";
			}
			
			// Move camera
			var cam = view_camera;
			var cam_y = camera_get_view_y(cam);
			var dif =  cam_y;
			camera_set_view_pos(cam, 0, cam_y - (dif / 16))
	
		} else {
			
			// Switching screen to floor
			if (mouse_y < screen_height + zone_width) {
				global.screen = "floor";
			}
			
			// Move camera
			var cam = view_camera;
			var cam_y = camera_get_view_y(cam);
			var dif = 1080 - cam_y;
			camera_set_view_pos(cam, 0, cam_y + (dif / 16))
			
		}
		
	break;
}