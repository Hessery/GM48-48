image_index = 0;

// Complete deal
// Remove offer glow and destory items sold.
timer = 60;
obj_offer.offer_items = [];
for (var i = 0; i < array_length(obj_scale.right_basket.items); i ++) {
	instance_destroy(obj_scale.right_basket.items[i]);
}