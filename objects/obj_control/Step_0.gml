// Quick exit game
if (keyboard_check(vk_escape)) { game_end() }

// Resize window
var ww = window_get_width() / 16;
var wh = window_get_height() / 9;

if (ww != ww_previous) { window_set_size(ww * 16, ww * 9) }
if (wh != wh_previous) { window_set_size(wh * 16, wh * 9) }

ww_previous = ww;
wh_previous = wh;