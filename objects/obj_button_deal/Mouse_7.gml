if (global.game_state != "game") { return }

image_index = 0;

var customer = global.customer_at_counter;
if (is_undefined(customer) || !instance_exists(customer)) { exit; }

// Evaluate if the customer accepts the offer based on trade_tolerance
var offered_items = obj_offer.offer_items;
var right_basket_items = obj_scale.right_basket.items;
var shop_offer_value = obj_scale.right_basket.total_value;

// Remove customer offered items from being included in shop offer value
for (var i = 0; i < array_length(right_basket_items); i ++) {
	for (var o = 0; o < array_length(offered_items); o ++) {
		if (right_basket_items[i] == offered_items[o]) {
			shop_offer_value -= right_basket_items[i].value;
		}
	}
}

var min_acceptable_value = max(0, customer.trade_item_value - customer.trade_tolerance);
if (shop_offer_value < min_acceptable_value) {
	// Reject: customer leaves and takes their items
	for (var i = 0; i < array_length(offered_items); i ++) {
		if (instance_exists(offered_items[i])) { instance_destroy(offered_items[i]); }
	}
	
	audio_play_sound(trade_fail, 0, false);
	obj_offer.offer_items = [];
	customer.subtitle_text = choose(
		"No way. I'm out.",
		"Not a chance. I'll take my business elsewhere.",
		"That deal is terrible. Bye.",
		"I'm not trading for that."
	);
	customer.subtitle_timer = customer.subtitle_timer_default;
	customer.state = s_leave_shop;
	if (global.customer_at_counter == customer) { global.customer_at_counter = undefined; }
	return;
}

// Complete deal
// Remove offer glow and destory items sold.
// timer = 60;

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
offered_items = obj_offer.offer_items;

// Of the items offered
for (var i= 0; i < array_length(offered_items); i ++) {
	
	// Check if they are in the basket
	var in_basket = false;
	for (var o = 0; o < array_length(left_basket_items); o ++) {
		if (offered_items[i] == left_basket_items[o]) { in_basket = true }
	}
	
	// Remove item if its not in the basket
	if (in_basket) {
		if (instance_exists(offered_items[i])) {
			offered_items[i].shop_owned = true;
			
			// Let shop-owned items fall off the scale onto the counter
			var drop_x = offered_items[i].x;
			var drop_y = offered_items[i].y + 200;
			if (instance_exists(obj_scale)) {
				drop_x = obj_scale.left_basket.x + irandom_range(-80, 80);
				drop_y = obj_scale.y + 220;
			}
			offered_items[i].phy_position_x = drop_x;
			offered_items[i].phy_position_y = drop_y;
			offered_items[i].phy_speed_x = 0;
			offered_items[i].phy_speed_y = 0;
		}
	} else {
		if (instance_exists(offered_items[i])) { instance_destroy(offered_items[i]); }
	}
	
}

// Drop any remaining items off the scale onto the counter
var drop_left = obj_scale.left_basket.items;
var drop_right = obj_scale.right_basket.items;
for (var i = 0; i < array_length(drop_left); i ++) {
	if (instance_exists(drop_left[i])) {
		var drop_x = drop_left[i].x;
		var drop_y = drop_left[i].y + 200;
		if (instance_exists(obj_scale)) {
			drop_x = obj_scale.left_basket.x + irandom_range(-80, 80);
			drop_y = obj_scale.y + 220;
		}
		drop_left[i].phy_position_x = drop_x;
		drop_left[i].phy_position_y = drop_y;
		drop_left[i].phy_speed_x = 0;
		drop_left[i].phy_speed_y = 0;
	}
}
for (var i = 0; i < array_length(drop_right); i ++) {
	if (instance_exists(drop_right[i])) {
		var drop_x = drop_right[i].x;
		var drop_y = drop_right[i].y + 200;
		if (instance_exists(obj_scale)) {
			drop_x = obj_scale.right_basket.x + irandom_range(-80, 80);
			drop_y = obj_scale.y + 220;
		}
		drop_right[i].phy_position_x = drop_x;
		drop_right[i].phy_position_y = drop_y;
		drop_right[i].phy_speed_x = 0;
		drop_right[i].phy_speed_y = 0;
	}
}

// Stop customer claim on offered items
obj_offer.offer_items = [];

audio_play_sound(trade_accept, 0, false);

customer.subtitle_text = choose(
	"Great trade, thanks!",
	"Deal. Pleasure doing business.",
	"That's fair. Thanks!",
	"Good trade. See you around."
);
customer.subtitle_timer = customer.subtitle_timer_default;
customer.state = s_leave_shop;
if (global.customer_at_counter == customer) { global.customer_at_counter = undefined; }
