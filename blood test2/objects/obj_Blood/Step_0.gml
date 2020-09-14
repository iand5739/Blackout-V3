image_xscale -= sizeChange;
image_yscale  = image_xscale;

if (movSpd > 0)
    image_alpha -= random_range(0.03, 0.05);

movSpd = Approach(movSpd, 0, fric);

if (instance_exists(obj_surf_splatter)) {
    surface_set_target(obj_surf_splatter.surf);
    draw_sprite_ext(spr_Blood, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    surface_reset_target();  
}

if (image_xscale <= 0)
    instance_destroy();