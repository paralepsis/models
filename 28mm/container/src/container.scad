/* container.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

$fn = 20;

longEdgeSide = 2.8;
cornerPostWidth = 4;
myHeight = 50;
myWidth = 50;
myLength = 93;
miscThick = 0.9; // thickness of bottom, doors, etc.
epsilon = 0.001;

translate([0,-40,0]) rotate([0,0,180]) color("red")
import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

container();
// topOnly();
// bottomOnly();

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

    /* back wall (no door) */
    translate([length, 0, 0]) rotate([0,0,90])
	metalSide(height = height, length = width);

    /* bottom (very simple) */
    cube([length, width, miscThick], center=false);
    cube([length, longEdgeSide, longEdgeSide], center=false);
    translate([0, width - longEdgeSide, 0])
	cube([length, longEdgeSide, longEdgeSide], center=false);
    translate([length - longEdgeSide, 0, 0])
	cube([longEdgeSide, width, longEdgeSide]);

    /* corners */
    cube([4,4,height], center=false);
    translate([0, width - cornerPostWidth, 0])
	cube([cornerPostWidth, cornerPostWidth, height], center=false);
    translate([length - cornerPostWidth, 0,0])
	cube([cornerPostWidth, cornerPostWidth, height], center=false);
    translate([length - cornerPostWidth, width - cornerPostWidth, 0])
	cube([cornerPostWidth, cornerPostWidth, height], center=false);

    /* door */
    translate([0, 0,0])
        door(width = myWidth - 2 * cornerPostWidth,
	     height = myHeight - (miscThick + longEdgeSide));

}

/******** COMPONENT AND "DIFF" MODELS ********/

/* door()
 */
module door(height = 40, width = 40) {
    translate([0,cornerPostWidth, miscThick]) {
	/* door panels */
	translate([0.8,0,0])
	    cube([miscThick, width, height]);
	translate([0, 0.6, 0.4])
	    cube([miscThick + 0.8, width / 2 - 0.8, height - 0.8]);
	translate([0, width / 2 + 0.2, 0.4])
	    cube([miscThick + 0.8, width / 2 - 0.8, height - 0.8]);
	
	/* locking mechanism */
	translate([0, 4/6 * width, 0]) cylinder(h = height, r = 0.6);
	translate([0, 2/6 * width, 0]) cylinder(h = height, r = 0.6);
    }
}

/* metalSide() -- corrugated metal wall with a flat backside
 */
module metalSide(height = 45, length = 90) {
    thickness = 0.8;
    flatLen = 3.0;
    pointOffset = 1.5;

    singlePanelLength = 2*flatLen + 2*pointOffset;

    for (i = [ 0 : floor(length / singlePanelLength) - 1 ]) {
	translate([i * singlePanelLength, 0, 0])
	    linear_extrude(height = height) {
	    polygon(points = [[0,0],
			      [flatLen, 0],
			      [flatLen + pointOffset, pointOffset],
			      [2*flatLen + pointOffset, pointOffset],
			      [2*flatLen + 2*pointOffset, 0],
			      [2*flatLen + 2*pointOffset, pointOffset + thickness],
			      [0,pointOffset + thickness]],
		    paths = [[6,5,4,3,2,1,0,6]]);
	}
    }
}

/* topCut() -- volume encompassing the top as would be removed.
 *
 * Note: This leaves the corners on the main body
 */
module topCut(height = myHeight, length = myLength, width = myWidth) {
    cutPostWidth = cornerPostWidth + epsilon;

    difference() {
	translate([-4, -4, height - longEdgeSide - epsilon])
	    cube([length + 8, width + 8, 6]);

	/* corners removed, copied construction from above */
	translate([-1 * epsilon, -1 * epsilon, 0]) 
	    cube([cutPostWidth,cutPostWidth,height + epsilon],
		 center=false);
	translate([-1 * epsilon, width - cornerPostWidth, 0])
	    cube([cutPostWidth, cutPostWidth, height + epsilon],
		 center=false);
	translate([length - cornerPostWidth, -1 * epsilon, 0])
	    cube([cutPostWidth, cutPostWidth, height + epsilon],
		 center=false);
	translate([length - cornerPostWidth, width - cornerPostWidth, 0])
	    cube([cutPostWidth, cutPostWidth, height + epsilon],
		 center=false);
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
