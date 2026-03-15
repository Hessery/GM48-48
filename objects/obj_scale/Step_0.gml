var y_offset = -20

left_basket.phy_position_x = x - lengthdir_x(arm_length, arm_angle); 
left_basket.phy_position_y = y - lengthdir_y(arm_length, arm_angle) + y_offset;
right_basket.phy_position_x = x + lengthdir_x(arm_length, arm_angle);
right_basket.phy_position_y = y + lengthdir_y(arm_length, arm_angle) + y_offset;