draw_self();
draw_sprite_ext(spr_scale_arm, -1, x, y, 1, 1, arm_angle, c_white, 1);

arm_angle += keyboard_check(vk_left) - keyboard_check(vk_right);

draw_rectangle(x - (280 + 140), y - 100, x - (280 - 140), y + 450, true);
draw_rectangle(x + (280 + 140), y - 100, x + (280 - 140), y + 450, true);

var left_arm_list = ds_list_create();
var left_arm_weight = 0;
collision_rectangle_list(x - (280 + 140), y - 100, x - (280 - 140), y + 450, obj_item, false, true, left_arm_list, false);
for (var i = 0; i < ds_list_size(left_arm_list); i += 1) {
	left_arm_weight += left_arm_list[| i].value;
}

var right_arm_list = ds_list_create();
var right_arm_weight = 0;
collision_rectangle_list(x + (280 - 140), y - 100, x + (280 + 140), y + 450, obj_item, false, true, right_arm_list, false);
for (var o = 0; o < ds_list_size(right_arm_weight); o += 1) {
	right_arm_weight += right_arm_list[| i].value;
}

arm_angle = clamp(left_arm_weight - right_arm_weight, -25, 25);

draw_text(x, y - 100, arm_angle);