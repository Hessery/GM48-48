// Draw the body we've selected
draw_sprite_ext(sprite_index, image_index, x, y, image_scale * flip_image, image_scale, 0, c_white, 1);

if (hasHair) {
	draw_sprite_ext(spr_hair, hair, x, y, image_scale * flip_image, image_scale, 0, c_white, 1);	
}

if (hasShirt) {
	draw_sprite_ext(spr_shirt, shirt, x, y, image_scale * flip_image, image_scale, 0, c_white, 1);
}

if (hasBeard) {
	draw_sprite_ext(spr_beard, beard, x, y, image_scale * flip_image, image_scale, 0, c_white, 1);
}

if (hasAcc) {
	draw_sprite_ext(spr_acc, acc, x, y, image_scale * flip_image, image_scale, 0, c_white, 1);
}

if (holding != -1) {
	
	draw_sprite_ext(spr_import, holding, x + (90 * image_scale * flip_image), y + (90 * image_scale), image_scale / 2, image_scale / 2, 0, c_white, 1);
	
}


if (global.debug) {
	
	draw_text(x + 30, y, 
		  "Selling: " + bool_to_str(selling_items) +
		"\nState: " + string(state) +
		"\nScale: " + string(image_scale) +
		"\nPause: " + string(pause) + 
		"\nPlace: " + string(place)
	);
	
	draw_line(x, y, desx, desy)
	
	
}