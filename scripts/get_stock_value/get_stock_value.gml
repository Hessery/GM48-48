function get_stock_value(){
	
	var list = ds_list_create();
	collision_rectangle_list(0, 0, 1920, 1080*2, obj_item, false, true, list, false);

	stock_value = 0;
	for (var i = 0; i < ds_list_size(list); i ++) {
		stock_value += list[| i].value;
	}
	
	return stock_value;
	
}