for (var i = 0; i < array_length(offer_items); i ++) {
	
	var inst = offer_items[i];
	draw_sprite_ext(spr_glow, -1, inst.x, inst.y, 1, 1, current_time, c_white, 0.3);
	
}