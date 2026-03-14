draw_self();
draw_sprite_ext(spr_scale_arm, -1, x, y, 1, 1, arm_angle, c_white, 1);

var target_arm_angle = clamp(left_basket.total_value - right_basket.total_value, -25, 25);
var angle_diff = target_arm_angle - arm_angle;
arm_angle += angle_diff / 10;

draw_text(x, y - 100, arm_angle);