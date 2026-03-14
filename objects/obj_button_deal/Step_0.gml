if (timer >= 0) {
	
	timer --
	
}

if (timer = 0) {
	
	with (obj_offer) {
		instance_create_depth(x, y, depth, obj_offer);
		instance_destroy();
	}
	instance_destroy();
	
}