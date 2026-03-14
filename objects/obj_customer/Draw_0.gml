// Draw the body we've selected
draw_self();

if (hasHair) {
	draw_sprite(spr_hair, hair, x - 10, y - 60);	
}


if (hasBeard) {
	draw_sprite(spr_beard, beard, x + 20, y + 5);
}

