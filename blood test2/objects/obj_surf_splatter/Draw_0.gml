if (surface_exists(surf)) {
	draw_surface(surf, 0, 0)
}
else {
	//show_message("oControllerBlood failed to draw surf becuase surf deos not exist")
	surf = surface_create(room_width, room_height);
}