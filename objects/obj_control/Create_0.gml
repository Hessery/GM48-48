// Dont have more than one control object per game
if (instance_number(obj_control) > 1) { 
	instance_destroy();
	return
}