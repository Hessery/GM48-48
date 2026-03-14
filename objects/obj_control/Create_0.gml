// Dont have more than one control object per game
if (instance_number(obj_control) > 1) { 
	instance_destroy();
	return
}

ww_previous = window_get_width() / 16;
wh_previous = window_get_height() / 9;