offer_items = []
for (var i = 0; i < array_length(offer_items); i ++) {
	
	offer_items[i] = instance_create_depth(x + 100, y + 100, depth, obj_item);
	
}
deal_button = instance_create_depth(obj_scale.x, 2006, depth, obj_button_deal)