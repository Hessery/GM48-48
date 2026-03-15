function ai_approach_counter(){
	
	
	// Action
	desx = 96;
	desy = 1705;	
	
	if (point_distance(x, y, desx, desy) < 20) {
		x = desx;
		y = desy;
		
		if (!offer_created) {
			if (!instance_exists(obj_offer)) {
				offer_created = true;
				return;
			}
			
			var base_x = x + 96;
			var base_y = y - 96;
			var left_x = base_x;
			var left_y = base_y;
			var right_x = base_x;
			var right_y = base_y;
			if (instance_exists(obj_scale)) {
				left_x = obj_scale.left_basket.x;
				left_y = obj_scale.left_basket.y - 120;
				right_x = obj_scale.right_basket.x;
				right_y = obj_scale.right_basket.y - 120;
			}
			
			// Place the trade item on the desk (buying or selling)
			if (trade_item_id != -1) {
				var trade_target_x = base_x;
				var trade_target_y = base_y;
				if (!selling_items) {
					// Customer is buying: put the desired item on the shop side
					trade_target_x = right_x;
					trade_target_y = right_y;
				}
				
				var trade_inst = instance_create_depth(trade_target_x, trade_target_y, depth, obj_item);
				trade_inst.item_id = trade_item_id;
				trade_inst.value = trade_inst.value_array[trade_inst.item_id];
				trade_inst.shop_owned = trade_item_shop_owned;
				trade_inst.phy_position_x = trade_target_x;
				trade_inst.phy_position_y = trade_target_y;
				
				trade_item_inst = trade_inst;
				trade_item_value = trade_inst.value;
				holding = -1;
				
				// Selling item counts as a customer-offered pending item
				if (!trade_item_shop_owned) {
					array_push(obj_offer.offer_items, trade_inst);
				}
			}
			
			// If buying, add collateral items (customer-owned, not the same as the target)
			if (!selling_items && trade_item_id != -1) {
				var collateral_count = irandom_range(1, 3);
				var import_count = sprite_get_number(spr_import);
				
				for (var i = 0; i < collateral_count; i ++) {
					var collateral_id = irandom(import_count - 1);
					while (collateral_id == trade_item_id) {
						collateral_id = irandom(import_count - 1);
					}
					
					var cx = left_x + irandom_range(-120, 120);
					var cy = left_y + irandom_range(-40, 40);
					var collateral_inst = instance_create_depth(cx, cy, depth, obj_item);
					collateral_inst.item_id = collateral_id;
					collateral_inst.value = collateral_inst.value_array[collateral_inst.item_id];
					collateral_inst.shop_owned = false;
					collateral_inst.phy_position_x = cx;
					collateral_inst.phy_position_y = cy;
					
					array_push(obj_offer.offer_items, collateral_inst);
				}
			}
			
			offer_created = true;
		}
	} else {
		var dir = point_direction(x, y, desx, desy);
		var dis = point_distance(x, y, desx, desy);
		x += lengthdir_x(walk_speed * 3, dir);
		y += lengthdir_y(walk_speed * 3, dir);
	}
	
	// Break
	
	
}
