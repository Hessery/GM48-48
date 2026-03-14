if (global.game_state != "game") { return }

image_index = 0;

// Complete deal
// Remove offer glow and destory items sold.
timer = 60;

// Get the value we just got and add it to the store value - move the item to the floor
//for (var nv = 0; nv < array_length(obj_offer.offer_items); nv++) {
//	var item_instance = obj_offer.offer_items[nv];
//	obj_offer.offer_items[nv] = undefined;
//	global.store_value += item_instance.value;	
//	item_instance.phy_position_y = 500;
//}

// Remove items given to the customer
for (var i = 0; i < array_length(obj_scale.right_basket.items); i ++) {
	instance_destroy(obj_scale.right_basket.items[i]);
}

// Remove items not traded to the store
var left_basket_items = obj_scale.left_basket.items;
var offered_items = obj_offer.offer_items;

// Of the items offered
for (var i= 0; i < array_length(offered_items); i ++) {
	
	// Check if they are in the basket
	var in_basket = false;
	for (var o = 0; o < array_length(left_basket_items); o ++) {
		if (offered_items[i] = left_basket_items[o]) { in_basket = true }
	}
	
	// Remove item if its not in the basket
	if (!in_basket) { instance_destroy(offered_items[i]) }
	
}

// Stop customer claim on offered items
obj_offer.offer_items = [];