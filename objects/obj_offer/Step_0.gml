for (var i = 0; i < array_length(offer_items); i ++) {
	
	var inst = offer_items[i];
	if (!is_undefined(inst) && variable_instance_exists(inst, "phy_position_y")) {
		if (inst.phy_position_y < 1080) { inst.phy_position_y = 1080 }
	}
	
}