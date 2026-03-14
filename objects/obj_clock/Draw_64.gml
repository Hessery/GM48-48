// Draw the night tint
if ((global.round_timer / 60) < 60) {
	
	// Start increasing alpha
	night_alpha = 0.5 - (((global.round_timer / 60) / 60) / 2);
	
	// Draw sheet over image
	var previous_alpha = draw_get_alpha();
	var previous_colour = draw_get_colour();
	draw_set_colour(make_colour_rgb(15, 15, 128));
	draw_set_alpha(night_alpha);
	draw_rectangle(0, 0, 1920, 1080, false)
	draw_set_alpha(previous_alpha);
	
} else {
	
	// Reset alpha
	night_alpha = 0;
	
}


var previous_colour = draw_get_colour();
var radius = 64;

// Draw clock
draw_set_colour(c_white);
draw_circle(x, y, radius, false);
draw_set_colour(c_black);
draw_circle(x, y, radius, true);

// Draw hour hand
var hour_hand_length = 32;
var hour_hand_rotation = (global.round_timer / 30) + 90;
var hour_hand_tip_x = x + lengthdir_x(hour_hand_length, hour_hand_rotation);
var hour_hand_tip_y = y + lengthdir_y(hour_hand_length, hour_hand_rotation);
draw_line(x, y, hour_hand_tip_x, hour_hand_tip_y)

// Draw minute hand
var min_hand_length = 48;
var min_hand_rotation = ((global.round_timer / 30) * 360) + 90;
var min_hand_tip_x = x + lengthdir_x(min_hand_length, min_hand_rotation);
var min_hand_tip_y = y + lengthdir_y(min_hand_length, min_hand_rotation);
draw_line(x, y, min_hand_tip_x, min_hand_tip_y)

// Draw a digital time below the clock for testing
if (global.debug) {
	var previous_halign = draw_get_halign();
	draw_set_halign(fa_middle);
	var sec_left = global.round_timer / 60;
	draw_text(x, y + 96, string(floor(sec_left / 60)) + ":" + string(sec_left));
	draw_set_halign(previous_halign);
}

draw_set_colour(previous_colour);