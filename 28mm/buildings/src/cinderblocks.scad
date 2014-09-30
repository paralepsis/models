/* cinderblocks.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 *
 * TODO:
 * - Clean up the globals.
 */
use <damage/damage.scad>

mortarRad = 0.3;

quickCinderblockPatch2();

module quickCinderblockPatch2(myAngle = 0, myScale=0.6, adjust=0) {
    render() newCbPatch(adjust=adjust) rotate([0,myAngle,0])
	scale([myScale,1,myScale]) translate([0,-5,0]) wallBreach();
}

module newCbPatch(adjust=0) {
    intersection() {
	translate([adjust,0,0]) translate([-145/2, 0, -120/2]) cinderblockPattern();
	translate([0,mortarRad, 0]) children(0);
    }
    children(0);
}

module cinderblockPattern() {
    height = 120;
    width = 145;
    cinderblockHeight = 4;
    cinderblockWidth = 2 * cinderblockHeight;

    for (row = [0 : floor(height / cinderblockHeight)]) {
	translate([0, 0, row * cinderblockHeight]) {
	    rotate([0, 90, 0]) cylinder($fn=15, r=mortarRad, h=width);
	    
	    for (col = [ 0 : floor(width / cinderblockWidth) - 1]) {
		translate([col * cinderblockWidth + (row % 2) * cinderblockWidth / 2, 0, 0]) cylinder($fn=15, r=mortarRad, h=cinderblockHeight);
	    }
	}
    }
}

/******** OLD VERSION BELOW, DO NOT MODIFY ********/

module quickCinderblockPatch(myScale=0.6, adjust=0) {
    render() cbPatch(adjust=adjust) rotate([0,myAngle,0])
	scale([myScale,1,myScale]) translate([75,-5,70]) wallBreach();
}

/* cbPatch() -- create a patch with a cinderblock pattern on the side,
 *              aligned such that the cinderblock pattern is on the XZ
 *              plane. 
 *
 * NOTE: CHILD SHOULD BE ALIGNED WITH SURFACE ON XZ PLANE.
 */
module cbPatch(adjust=0) {
    intersection() {
	translate([adjust,0,0]) cinderblockPattern();
	translate([0,mortarRad, 0]) children(0);
    }
    children(0);
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
