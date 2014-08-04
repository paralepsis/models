/* building.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */
use <curvedPoly.scad>
use <baseTexture129x64.scad>
use <barrel.scad>

// translate([40,10,0]) rotate([0,0,180]) import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

final();

module final() {
    difference() {
	translate([0,0,-2]) {
	    barrels();
	    texturedBaseInterior();
	    // baseExtrusion();
	}
	translate([0,0,-3]) baseExtrusion(height=3);
    }
}

/********* BARREL MODULES *********/

module barrels() {
    xyz = [[25.5,50.1,3.5], [33.5,41.1,3.4], [54,52,5.4],
	   [39.5,53,3.7]];

    for (loc = xyz) {
	translate(loc) rotate([0,0,10*loc[0]]) barrel(mm=35, extend=1);
    }

    // LHS
    translate([8,32,8]) rotate([0,85,10]) barrel(mm=35);
    translate([12,24,10]) rotate([0,90,-60]) barrel(mm=35);

    // RHS
    translate([54.5,39.5,8]) rotate([25,80,0]) barrel(mm=35, extend=0);
    translate([72,47.5,9.5]) rotate([42,90,0]) barrel(mm=35, extend=0);
}

/********** BASE MODULES **********/

module baseExtrusion(height=5) {
    translate([90,5,0]) linear_extrude(height=height, convexity=2)
	scale([1.2,1.2]) 
	    mirror([1,0,0]) curvedPoly();
}

module texturedBaseInterior() {
    intersection() {
	baseExtrusion(height=9);
	translate([-26,5,-8]) rotate([2,4,-5]) baseTexture129x64();
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
