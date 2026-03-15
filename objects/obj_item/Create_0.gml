image_size = 96;
image_scale = 0.38;

picked_up = false;
x_dif = 0;
y_dif = 0;

value_array = [ 5, 10, 15, 20, 50, 100, 200 ];
item_id = choose(1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6, 7) - 1;
value = value_array[item_id];

on_a_shelf = false;
node = -1;