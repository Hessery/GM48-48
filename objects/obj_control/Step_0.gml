// Quick exit game
if (keyboard_check(vk_escape)) { game_end() }


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
		global.menu_alpha = max(global.menu_alpha - menu_alpha_delta, 0);
		
		if (global.menu_alpha = 0) {
			instance_deactivate_object(obj_menu_title);
			instance_deactivate_object(obj_menu_play);
			instance_deactivate_object(obj_menu_exit);
		}
	break;
}