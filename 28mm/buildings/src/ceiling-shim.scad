/* ceiling-shim.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

/* ceilingShim() -- create a shim to glue on the bottom of a ceiling
 *                  to keep it in place on lower floor.
 *
 * NOTE: xDim and yDim are *building* dimensions, for simplicity.
 */
module ceilingShim(xDim = 100, yDim = 100, wallThickness = 7) {
    myOffset = wallThickness + 1;
    myHeight = 2;
    myShimWidth = 10;
    myRad = 10;

    difference() {
	hull() {
	    translate([myRad + myOffset, myRad + myOffset, 0])
		cylinder(r=myRad,h=myHeight);
	    translate([xDim - myRad - myOffset, myRad + myOffset, 0])
		cylinder(r=myRad,h=myHeight);
	    translate([myRad + myOffset, yDim - myRad - myOffset, 0])
		cylinder(r=myRad,h=myHeight);
	    translate([xDim - myRad - myOffset, yDim - myRad - myOffset, 0])
		cylinder(r=myRad,h=myHeight);
	}
	hull() {
	    translate([myRad + myOffset + myShimWidth,
		       myRad + myOffset + myShimWidth, -0.0005])
		cylinder(r=myRad,h=myHeight + 0.001);
	    translate([xDim - myRad - myOffset - myShimWidth,
		       myRad + myOffset + myShimWidth, -0.0005])
		cylinder(r=myRad,h=myHeight + 0.001);
	    translate([myRad + myOffset + myShimWidth,
		       yDim - myRad - myOffset - myShimWidth, -0.0005])
		cylinder(r=myRad,h=myHeight + 0.001);
	    translate([xDim - myRad - myOffset - myShimWidth,
		       yDim - myRad - myOffset - myShimWidth, -0.0005])
		cylinder(r=myRad,h=myHeight + 0.001);
	}
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