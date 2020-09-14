key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_space = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

hsp = (key_right-key_left)*walksp

//accelerating ground fall and jump
if (!place_meeting(x,y + 1,obj_wall)) {
	vsp += grav;
}
else if (key_space) {

vsp = jumpht * -1;
x_scale = image_xscale/strech_scale;
y_scale = image_yscale*strech_scale;
	
}
	

if (instance_exists(obj_portal)) {
	
	portal_distance = point_distance(x,y,obj_portal.x,obj_portal.y)	


	if (portal_distance < 135) {
		hsp = 0
		vsp = 0
		direction = point_direction(x,y,obj_portal.x,obj_portal.y)
		
		
		x_scale = 1-(135-portal_distance)/(135/0.6)
		y_scale = 1-(135-portal_distance)/(135/0.6)
		
		
		speed = (135-portal_distance)/(135/4) + 1.5
	}
	else  {
	
		direction = 0
		speed = 0
	}
	
}
	
	
//horizontial collision
if (place_meeting(x + hsp,y,obj_wall)) {
	while (!place_meeting(x+sign(hsp),y,obj_wall)) {
		x += sign(hsp);
	}	
	hsp = 0;
}

x += hsp;

//side animation against wall
if (place_meeting(x-1,y,obj_wall) && (!place_meeting(xprevious-1,y,obj_wall))) {
	x_scale = image_xscale/strech_scale;
	y_scale = image_yscale*strech_scale;
	Splatter(x,y)
}

if (place_meeting(x+1,y,obj_wall) && (!place_meeting(xprevious+1,y,obj_wall))) {
	x_scale = image_xscale/strech_scale;
	y_scale = image_yscale*strech_scale;
	Splatter(x,y)
}

//vertical collision
if (place_meeting(x,y + vsp,obj_wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_wall)){
		y += sign(vsp);
	}	
	vsp = 0;
} 
y += vsp;
	
// check for landing
if (place_meeting(x,y + 1,obj_wall) && (!place_meeting(x,yprevious + 1,obj_wall))) {
	x_scale = image_xscale*strech_scale;
	y_scale = image_yscale/strech_scale;
	Splatter(x+hsp,y+8)
}

x_scale = lerp(x_scale, image_xscale, 0.1);
y_scale = lerp(y_scale, image_yscale, 0.1);