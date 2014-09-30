/* turbolaser.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

$fn=30;

translate([0,13,0]) import("./lasers-fixed.stl");

laser();
mirror([1,0,0]) laser();

module laser() {
    /* bottom layer */
    translate([0.7,0,0])
	linear_extrude(height=0.6) 
	polygon(points=[[0,0], [5.5,0], [6.5,1], [6.5,8], [-0.4,8], [-0.4,6], [0,6]],
		paths = [[0,1,2,3,4,5,6,0]]);

    /* second from bottom layer */
    translate([0.7,0,0.6]) linear_extrude(height=0.6)
	polygon(points=[[0,1], [1.5,1], [2.5,3], [6.5,3], [6.5,8], [0,8]],
		paths = [[0,1,2,3,4,5,0]]);

    /* third from bottom (cube) */
    translate([2.75,3.75,1.2]) cube([3.75,3.75,0.8]);

    translate([3.75/2 + 2.75, 3.75 + 3.75/2, 2.0]) {
	translate([0,0,-.5]) cylinder(r1=2,r2=2.3,h=.5);
	cylinder(r=2.3,h=3);
	translate([0,0,3]) cylinder(r=1.6,h=3.75);
	translate([0,0,6.75]) cylinder(r=1.25,h=5.5);
	translate([0,0,12.25]) cylinder(r=0.8,h=3);
	translate([0,0,13.25]) cylinder(r1=0.8,r2=1.5,h=1);
	translate([0,0,14.25]) cylinder(r1=1.5,r2=0.8,h=1);
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
