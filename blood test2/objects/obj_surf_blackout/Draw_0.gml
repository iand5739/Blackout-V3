if (!surface_exists(blue_surface)) {
	blue_surface = surface_create(room_width,room_height);
	show_debug_message("created blue_surface");
}

surface_set_target(blue_surface);
draw_clear_alpha(c_black,1);

with (obj_wall) {
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index, x,y, image_xscale, image_yscale, 0, c_white, 1);
	gpu_set_blendmode(bm_normal);
}

surface_reset_target();
draw_surface(blue_surface,0,0);