/* bunker.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

widthTop = 110;
widthBottom = 140;
// depth = 100;
height = 60;

/* marine -- this simply drops a Space Marine in the model for reference.
 */
translate([0,0,5]) rotate([0,0,250]) color("red")
    import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");


/*
linear_extrude(height = height) {
    translate([0,-1*depth/2,0])
    polygon(points = [[0,0], [width - 10, 0], [width, 10],
        [width, depth - 10], [width - 10, depth],
        [0, depth]],
        paths = [[0,1,2,3,4,5,0]]);
}
*/



// angle = atan(height/(sqrt(2)*(widthBottom - widthTop)));
angle = 77;

difference() {
	/* simple starting point for exterior -- four sided angled block */
/*
	cylinder($fn=4,r1=widthBottom/2, r2=widthTop/2, h=height);

	translate([-1 * widthBottom/2, 0,0]) rotate([0,90-angle,0]) translate([-10,-20,0]) cube([22,40,80]);
	rotate([0,0,90]) translate([-1 * widthBottom/2, 0,0]) rotate([0,90-angle,0]) translate([-10,-20,0]) cube([22,40,80]);
	rotate([0,0,180]) translate([-1 * widthBottom/2, 0,0]) rotate([0,90-angle,0]) translate([-10,-20,0]) cube([22,40,80]);
	rotate([0,0,270]) translate([-1 * widthBottom/2, 0,0]) rotate([0,90-angle,0]) translate([-10,-20,0]) cube([22,40,80]);
*/
	bunkerShape();

	/* interior removed */
	translate([0,0,4]) bunkerShape(widthBottom = widthBottom-30,
							widthTop = widthTop-30,
							height = height - 8);

	/* observation port */
//	rotate([0,0,0]) translate([0,widthBottom/2.75,35]) 
	rotate([0,0,90]) translate([widthBottom/1.7, widthBottom/1.7, 35]) cube([widthBottom, widthBottom, 15], center=true);

	/* door cutout */
	bunkerDoor();
}


module bunkerShape(angle = 77,
				widthBottom = widthBottom,
				widthTop = widthTop, 
				height = height)
{
	difference() {
		cylinder($fn=4,r1=widthBottom/2, r2=widthTop/2, h=height);

		/* slices off corners */
		translate([-1 * widthBottom/2, 0,0]) rotate([0,90-angle,0]) translate([-10,-20,0]) cube([22,40,80]);
		rotate([0,0,90]) translate([-1 * widthBottom/2, 0,0]) rotate([0,90-angle,0]) translate([-10,-20,0]) cube([22,40,80]);
		rotate([0,0,180]) translate([-1 * widthBottom/2, 0,0]) rotate([0,90-angle,0]) translate([-10,-20,0]) cube([22,40,80]);
		rotate([0,0,270]) translate([-1 * widthBottom/2, 0,0]) rotate([0,90-angle,0]) translate([-10,-20,0]) cube([22,40,80]);
	}
}

module bunkerDoor() {
	rotate([0,0,45]) translate([5,-45,20 + 4]) cube([30,35,40], center=true);
}

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */
