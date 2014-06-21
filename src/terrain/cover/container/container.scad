/* container.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

longEdgeSide = 2.8;
cornerPostWidth = 4;
myHeight = 50;
myWidth = 50;
myLength = 94;
miscThick = 0.8; // thickness of bottom, doors, etc.
epsilon = 0.001;


translate([0,-40,0]) rotate([0,0,180]) color("red")
import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

// container();
topOnly();

/******** MODULES FOR SPLITTING OUT PARTS ********/
module topOnly() {
    intersection() {
	container();
	topCut();
    }
}

module bottomOnly() {
    difference() {
	container();
	topCut();
    }
}

/******** CONTAINER MODULE ********/

module container(height = myHeight, 
		 length = myLength, 
		 width = myWidth)
{
    /* top */
    translate([0,0,height]) 
	rotate([-90,0,0]) metalSide(height = width, length = length);
    translate([0, width - longEdgeSide, height - longEdgeSide])
	cube([length, longEdgeSide, longEdgeSide], center=false);
    translate([0, 0, height - longEdgeSide])
	cube([length, longEdgeSide, longEdgeSide], center=false);

    /* top ends */
    translate([0,0,height - longEdgeSide])
	cube([longEdgeSide, width, longEdgeSide], center=false);
    translate([length - longEdgeSide, 0, height - longEdgeSide])
	cube([longEdgeSide, width, longEdgeSide], center=false);

    /* sidewalls */
    metalSide(height = height, length = length);
    translate([0, width, 0]) mirror([0, 1, 0])
	metalSide(height = height, length = length);

    /* bottom (very simple) */
    cube([length, width, miscThick], center=false);
    cube([length, longEdgeSide, longEdgeSide], center=false);
    translate([0, width - longEdgeSide, 0])
	cube([length, longEdgeSide, longEdgeSide], center=false);

    /* corners */
    cube([4,4,height], center=false);
    translate([0, width - cornerPostWidth, 0])
	cube([cornerPostWidth, cornerPostWidth, height], center=false);
    translate([length - cornerPostWidth, 0,0])
	cube([cornerPostWidth, cornerPostWidth, height], center=false);
    translate([length - cornerPostWidth, width - cornerPostWidth, 0])
	cube([cornerPostWidth, cornerPostWidth, height], center=false);
}


module metalSide(height = 45, length = 90) {
    thickness = 0.8;
    flatLen = 3.0;
    pointOffset = 2.0;

    singlePanelLength = flatLen + 2 * pointOffset;

    for (i = [ 0 : floor(length / singlePanelLength) - 1 ]) {
	translate([i * singlePanelLength, 0, 0])
	    linear_extrude(height = height) {
	    polygon(points = [[0,0],
			      [0,thickness + pointOffset],
			      [flatLen, thickness + pointOffset],
			      [flatLen + pointOffset, thickness + pointOffset],
			      [flatLen + 2 * pointOffset, thickness + pointOffset],
			      [flatLen + 2 * pointOffset, 0],
			      [flatLen + pointOffset, pointOffset],
			      [flatLen, 0]],
		    paths = [[0,1,2,3,4,5,6,7,0]]);
	}
    }
}

/* topCut() -- volume encompassing the top as would be removed.
 *
 * Note: This leaves the corners on the main body
 */
module topCut(height = myHeight, length = myLength, width = myWidth) {
    difference() {
	translate([-4, -4, height - longEdgeSide - epsilon])
	    cube([length + 8, width + 8, 6]);

	/* corners removed, copied construction from above */
	cube([cornerPostWidth,cornerPostWidth,height + epsilon], center=false);
	translate([0, width - cornerPostWidth, 0])
	    cube([cornerPostWidth, cornerPostWidth, height + epsilon], center=false);
	translate([length - cornerPostWidth, 0,0])
	    cube([cornerPostWidth, cornerPostWidth, height + epsilon], center=false);
	translate([length - cornerPostWidth, width - cornerPostWidth, 0])
	    cube([cornerPostWidth, cornerPostWidth, height + epsilon], center=false);
    }
}

/******** UNUSED, TWO-SIDED CORRuGATED WALL ********/

module metalWall(height = 45, length = 90) {
    thickness = 0.8;
    flatLen = 3.0;
    pointOffset = 2.0;

    singlePanelLength = flatLen + 2 * pointOffset;

    for (i = [ 0 : floor(length / singlePanelLength) - 1 ]) {
	translate([i * singlePanelLength, 0, 0])
	    linear_extrude(height = height) {
	    polygon(points = [[0,0], [0,thickness], [flatLen, thickness],
			      [flatLen + pointOffset, thickness + pointOffset],
			      [flatLen + 2 * pointOffset, thickness],
			      [flatLen + 2 * pointOffset, 0],
			      [flatLen + pointOffset, pointOffset],
			      [flatLen, 0]],
		    paths = [[0,1,2,3,4,5,6,7,0]]);
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
