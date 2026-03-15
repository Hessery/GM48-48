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

if (subtitle_timer > 0 && subtitle_text != "") {
	var t = subtitle_timer / subtitle_timer_default;
	var alpha = clamp(t, 0, 1);
	var bubble_x = x;
	var bubble_y = y - (140 * image_scale);
	var text_w = string_width(subtitle_text);
	var text_h = string_height(subtitle_text);
	var pad_x = 10;
	var pad_y = 6;
	var half_w = (text_w / 2) + pad_x;
	var half_h = (text_h / 2) + pad_y;
	var cam = view_camera;
	var view_x = camera_get_view_x(cam);
	var view_y = camera_get_view_y(cam);
	var view_w = camera_get_view_width(cam);
	var view_h = camera_get_view_height(cam);
	bubble_x = clamp(bubble_x, view_x + half_w, view_x + view_w - half_w);
	bubble_y = clamp(bubble_y, view_y + half_h, view_y + view_h - half_h);
	
	draw_set_alpha(alpha);
	draw_set_color(make_color_rgb(20, 20, 20));
	draw_roundrect(
		bubble_x - half_w,
		bubble_y - half_h,
		bubble_x + half_w,
		bubble_y + half_h,
		false
	);
	
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(bubble_x, bubble_y, subtitle_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
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
