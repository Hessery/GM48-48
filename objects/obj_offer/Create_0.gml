offer_items = []
for (i = 0; i < random_range(1, 3); i ++) {
	
	offer_items[i] = instance_create_depth(x + 100, y + 100, depth, obj_item);
	
}
deal_button = instance_create_depth(1337, 2006, depth, obj_button_deal)