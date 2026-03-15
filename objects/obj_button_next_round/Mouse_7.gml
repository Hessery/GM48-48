if (global.day >= 5) {
	game_restart();
}

// Start the next round
global.round_timer = 10800;
global.game_state = "game";
global.day += 1;

// Delete the round end window
instance_destroy(obj_round_end);
instance_destroy();
