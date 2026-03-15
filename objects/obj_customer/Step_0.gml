// Scale on screen
var sprite_size = sprite_get_width(sprite_index);
var target_size = 70;
if (y > 1080) { target_size = 256 }
var target_image_scale = (1 / sprite_size) * target_size;
var dif = target_image_scale - image_scale;
var resize_speed = 8;

image_scale += dif / resize_speed;
image_size = sprite_size * image_scale;


// AI
switch (state) {
	case s_enter_shop:			ai_enter_shop();		break;
	case s_mill_about:			ai_mill_about();		break;
	case s_pickup_item:			ai_pickup_item();		break;
	case s_queue:				ai_queue();				break;
	case s_approach_counter:	ai_approach_counter();	break;
	case s_leave_shop:			ai_leave_shop();		break;
}

// Animate
if (xprevious > x) { flip_image = -1 }
if (xprevious < x) { flip_image = 1 }