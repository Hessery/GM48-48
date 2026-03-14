draw_self();
draw_sprite_ext(spr_scale_arm, -1, x, y, 1, 1, arm_angle, c_white, 1);

// Figure total value
var left_basket_value = left_basket.total_value;
var right_basket_value = right_basket.total_value;

// Remove customer offered items from being included in right basket value
var offered_items = obj_offer.offer_items;
var right_basket_items = right_basket.items;
for (var i = 0; i < array_length(right_basket_items); i ++) {
	for (var o = 0; o < array_length(offered_items); o ++) {
		if (right_basket_items[i] = offered_items[o]) {
			// Remove the value from the right basket
			right_basket_value -= right_basket_items[i].value;
		}
	}
}

var target_arm_angle = clamp(left_basket_value - right_basket_value, -25, 25);

var angle_diff = target_arm_angle - arm_angle;
arm_angle += angle_diff / 10;

if (global.debug) { draw_text(x, y - 100, arm_angle) };