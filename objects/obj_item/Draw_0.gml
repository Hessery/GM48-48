// Dynamically draw the sprite the correct size
var sprite_size = sprite_get_width(sprite_index);
var target_size = 96;
if (y > 1080) { target_size = 256 }
var target_image_scale  = (1 / sprite_size) * target_size;
var dif = target_image_scale - image_scale;
var resize_speed = 8;

image_scale += dif / resize_speed;
image_size = sprite_size * image_scale;

draw_sprite_ext(
	sprite_index, 
	item_id,
	x,
	y,
	image_scale,
	image_scale,
	0,
	c_white,
	1
);

// Show debug for the dynamic size scaler
if (global.debug) {
	draw_line(x, y, x + x_dif, y + y_dif);
	draw_text(
		x + (image_size / 2), 
		y, 
		"Image scale: " + string(image_scale) + 
		"\ntarget image scale: " + string(target_image_scale) + 
		"\ndif: " + string(dif) +
		"\ny: " + string(y) + 
		"\nValue: " + string(value)
	)
}