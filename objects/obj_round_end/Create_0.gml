// Move to center of screen
var cam = view_camera;
var cam_w_half = camera_get_view_width(cam) / 2;
var cam_h_half = camera_get_view_height(cam) / 2;

x = cam_w_half;
y = cam_h_half;


// Create button
instance_create_depth(x, y + 150, depth + 1, obj_button_next_round);


// Calculate stock value
var list = ds_list_create();
collision_rectangle_list(0, 0, 1920, 1080*2, obj_item, false, true, list, false);

stock_value = 0;
for (var i = 0; i < ds_list_size(list); i ++) {
	stock_value += list[| i].value;
}