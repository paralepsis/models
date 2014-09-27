/* small-base.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 * 
 * TODO:
 *
 */

$fn=40;
pipSlop = 0.4; // Pips end up being a little too close together
pipPos = 20 - 7.4 - 2.65/2 + pipSlop;
insideSlop = 0.8; // Space for ID token is often short if printed exactly.

/* main base with pips */
difference() {
    union() {
	polyhedron(points=[[-20,-20.2,0], [-20,20.2,0], [20,20.2,0],
			   [20, -20.2, 0],
			   [-38.13/2,-20.02,5.94], [-38.13/2, 20.02,5.94],
			   [38.13/2,20.02,5.94], [38.13/2, -20.02, 5.94]],
		   faces=[[3,2,1,0], [4,5,6,7], [0,1,5,4], [1,2,6,5], [2,3,7,6],
			  [3,0,4,7]]);
	
	
	translate([-1*pipPos,-20.2,0]) cylinder(r=2.65/2,h=1.38);
	translate([1*pipPos,-20.2,0]) cylinder(r=2.65/2,h=1.38);
	translate([-1*pipPos,20.2,0]) cylinder(r=2.65/2,h=1.38);
	translate([1*pipPos,20.2,0]) cylinder(r=2.65/2,h=1.38);
    }

    translate([-1*(34.1+insideSlop)/2,-21,3.95])
	cube([34.1+insideSlop,42,5.94-3.95+0.2]);
}

/* center cylinder with cut-outs */
difference() {
    cylinder(r1=11.62/2, r2=11.6/2-0.2,h=9.86); // was 11.52

    translate([0,0,3.95]) cylinder(r=3.45/2,h=9.86-3.95+0.2);
    translate([-11.5/2,3.52/2,3.95+2]) cube([11.5,2.22,9.86-3.95+0.2]);
    mirror([0,1,0]) translate([-11.5/2,3.52/2,3.95+2]) cube([11.5,2.22,9.86-3.95+0.2]); // was 2.18

    translate([-0.75,-3,3.95+2]) cube([1.5,6,9.86-3.95+0.2]);
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
