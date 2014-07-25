/* jersey.scad -- Jersey barrier
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 *
 * TODO:
 * - Clean up the globals.
 */
use <holeCutout.scad>
use <holeCutout2.scad>
use <hole.scad>

/******** GENERATE A SET OF DAMAGED AND UNDAMAGED JERSEY BARRIERS ********/

translate([-30,-20,0]) difference() {
    jersey();
    translate([40,-11,43]) rotate([0,180,0]) holeCutout();
}

translate([-30,0,0]) difference() {
    jersey();
    translate([-87,13,95]) rotate([180,2,0]) holeCutout2();
}

translate([-30,20,0]) difference() {
    jersey();
    translate([-13,28,-2]) rotate([99,5,0]) hole();
    translate([-3,28,-4]) rotate([99,10,0]) hole();
    translate([-26,27,4]) rotate([99,17,0]) hole();
    translate([-102,13,78]) rotate([180,-12,0]) holeCutout2();
}

translate([-30,40,0]) difference() {
    jersey();
    translate([88,-16,66]) rotate([0,195,0]) holeCutout2();
}

for (i= [0 : 3]) {
    translate([30,-20 + 20 * i, 0]) jersey();
}

/******** BASIC JERSEY BARRIER MODEL ********/

/* jersey() -- generate a jersey barrier at a rough scale in millimeters
 *
 * Note: This is some early code and is a mess. Apologies.
 */
module jersey(mm=30) {
    scale(mm * .000547, mm * .000547, mm * .000547) render() difference() 
    {
	rotate([0,0,90]) translate([0,0,1145/2]) rotate([90,0,0])
	translate([-410,-1145/2,0])
	{
	    // Basic shape, extruded
	    linear_extrude(height=2700, center=true)
	    polygon(points = [[0,0], [0,75], [210,330], [260,1145], [560,1145],
			      [610,330], [820,75], [820,0]],
		    paths = [[0,1,2,3,4,5,6,7]]);
	}
	    
	// Cut out forklift spots
	translate([-450,-410,30]) color("red") cube([254, 60, 60.001], center = true);
	translate([450,-410,30]) color("red") cube([254, 60, 60.001], center = true);
	translate([-450,410,30]) color("red") cube([254, 60, 60.001], center = true);
	translate([450,410,30]) color("red") cube([254, 60, 60.001], center = true);
	    // Cut out holes where it can be lifted
	translate([-450, -200, 720]) sphere(r=50, center = true);
	translate([450, -200, 720]) sphere(r=50, center = true);
	translate([-450, 200, 720]) sphere(r=50, center = true);
	translate([450, 200, 720]) sphere(r=50, center = true);
    }
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
