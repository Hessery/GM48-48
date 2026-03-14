arm_angle = 0;
left_basket = instance_create_depth(
	x - lengthdir_x(304, arm_angle), 
	y - lengthdir_y(304, arm_angle),
	depth,
	obj_scale_basket
);
left_basket.label = "Customer gives";
right_basket = instance_create_depth(
	x + lengthdir_x(304, arm_angle), 
	y + lengthdir_y(304, arm_angle),
	depth,
	obj_scale_basket
);
right_basket.label = "Shop gives";