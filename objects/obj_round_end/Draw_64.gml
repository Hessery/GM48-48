var pre_halign = draw_get_halign();

draw_set_halign(fa_middle);

draw_self();
if (is_final_day) {
	draw_text(x, y - 60, "End of Day 5");
	draw_text(x, y - 20, "Final Stock Value: " + string(stock_value));
	draw_text(x, y + 20, performance_text);
} else {
	draw_text(x, y - 30, "Day " + string(global.day) + "/5");
	draw_text(x, y, "Stock Value: " + string(stock_value));
}

// I dont know why it wont draw correctly on the counter
// but this is the work around
draw_sprite(spr_next_round, -1, x, y + 150);

draw_set_halign(pre_halign);
