/* warehouse.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 *
 */

// use <building.scad>

doCinderblocks = 0;

% translate([240/2 - 10,70,155/2]) cube(size=[240, 153, 155], center=true);

/* bottom cinderblock wall section */
difference() {
  cube([304, 248, 40 - 0.3], center=false);
  translate([7,7,-0.2]) cube([304 - 14, 248 - 14, 40.4], center=false);

    if (doCinderblocks) {
	/* cinderblock pattern on exterior */
	cinderblockPattern(width=304);
	translate([0,248,0]) cinderblockPattern(width=304);
	rotate([0,0,90]) translate([0,0,-4]) cinderblockPattern(height=40,width=248);
	translate([304,0,0]) rotate([0,0,90]) translate([0,0,-4]) cinderblockPattern(height=40,width=248);
    }
}

/* top corrugated metal walls */
translate([2,2,39]) metalSide(height=40, length=300);

/******** SUPPORT MODULES ********/

/* metalSide() -- corrugated metal wall with a flat backside
 *
 * Note: taken from container.scad
 */
module metalSide(height = 45, length = 90) {
    thickness = 1.5;
    flatLen = 6.0;
    pointOffset = 0.8;

    singlePanelLength = 1.2*flatLen;

    for (i = [ 0 : floor(length / singlePanelLength) - 1 ]) {
	translate([i * singlePanelLength, 0, 0])
	    linear_extrude(height = height) {
	    polygon(points = [[0,0],
			      [flatLen, 0],
			      [flatLen, pointOffset],
			      [1.2*flatLen, pointOffset],
			      [1.2*flatLen, 0],
			      [1.2*flatLen, pointOffset+ thickness],
			      [0, pointOffset + thickness]],
		    paths = [[6,5,4,3,2,1,0,6]]);
	}
    }
}

/* cinderblockPattern()
 *
 * Note: taken from cinderblocks.scad
 */
module cinderblockPattern(height=36,width=308) {
    mortarRad = 0.3;
    cinderblockHeight = 4;
    cinderblockWidth = 2 * cinderblockHeight;

    for (row = [0 : floor(height / cinderblockHeight)]) {
        translate([0, 0, row * cinderblockHeight]) {
            rotate([0, 90, 0]) cylinder($fn=12, r=mortarRad, h=width);

	    if (row % 2) {
		for (col = [ 0 : floor(width / cinderblockWidth) - 1]) {
		    translate([(col + 0.5) * cinderblockWidth, 0, 0])
		        cylinder($fn=12, r=mortarRad, h=cinderblockHeight);
		}
	    }
	    else {
		for (col = [ 1 : floor(width / cinderblockWidth) - 1]) {
		    translate([col * cinderblockWidth, 0, 0])
			cylinder($fn=12, r=mortarRad, h=cinderblockHeight);
		}
	    }
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
