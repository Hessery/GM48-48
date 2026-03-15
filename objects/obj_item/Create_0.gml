image_size = 96;
image_scale = 0.38;

picked_up = false;
x_dif = 0;
y_dif = 0;

value_array = [ 5, 10, 15, 20, 50, 100, 150, 30, 25, 90, 50];
if (!variable_instance_exists(id, "item_id")) {
	item_id = choose(1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 11) - 1;
}
value = value_array[item_id];
if (!variable_instance_exists(id, "shop_owned")) { shop_owned = true; }

on_a_shelf = false;
node = -1;
