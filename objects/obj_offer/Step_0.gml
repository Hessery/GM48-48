for (var i = 0; i < array_length(offer_items); i ++) {
	
	var inst = offer_items[i];
	if !is_undefined(inst) {
		if (inst.phy_position_y < 1080) { inst.phy_position_y = 1080 }
	}
	
}