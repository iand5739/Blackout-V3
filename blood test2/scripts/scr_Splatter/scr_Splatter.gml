///Splatter(x, y)
function Splatter(argument0, argument1) {
	
		var splatter_color = make_color_hsv(global.splatter_color,255,255)
		global.splatter_color = global.splatter_color + 5
		if (global.splatter_color > 255) {global.splatter_color = 0;}
		//var splatter_color = c_white
		var count = random_range(16, 32);
	    for (var i = 0; i < count; i++) {
	       with (instance_create_layer(argument0 + random_range(-16, 16), argument1 + random_range(-16, 16),"surf_splatter", obj_Blood)) {
			   image_blend = splatter_color
		   }
	    }

}
