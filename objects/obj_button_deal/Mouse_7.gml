image_index = 0;

// Complete deal
// Remove offer glow and destory items sold.
timer = 60;

// Get the value we just got and add it to the store value - move the item to the floor
for (var nv = 0; nv < array_length(obj_offer.offer_items); nv++) {
	var item_instance = obj_offer.offer_items[nv];
	obj_offer.offer_items[nv] = undefined;
	global.store_value += item_instance.value;	
	item_instance.phy_position_y = 500;
}

obj_offer.offer_items = [];

for (var i = 0; i < array_length(obj_scale.right_basket.items); i ++) {
	instance_destroy(obj_scale.right_basket.items[i]);
}