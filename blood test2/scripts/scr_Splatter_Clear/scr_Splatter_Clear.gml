///function Splatter_Clear()
function scr_Splatter_Clear() {

	with (obj_surf_splatter) {
		surface_free(surf)
		surf = surface_create(room_width, room_height);
	}

	with (obj_surf_blackout) {
		surface_free(blue_surface)
		blue_surface = surface_create(room_width,room_height);
	}

}