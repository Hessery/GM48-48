var list = ds_list_create()
var half_width = sprite_get_width(sprite_index) / 2;
collision_rectangle_list(
	x - half_width,
	y,
	x + half_width,
	y + sprite_get_height(sprite_index),
	obj_item,
	true,
	false,
	list,
	false
)

total_value = 0;
items = [];
for (var i = 0; i < ds_list_size(list); i ++) {
	total_value += list[| i].value
	items[i] = list[| i];
}