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

translate([24, -40, 0]) rotate([0,0,80]) color("red")
   import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

/* bottom cinderblock wall section */
if (1) difference() {
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

/* corner posts */
if (1) {
    /* corner posts */
    translate([2,2,39]) cube([4,4,57]);
    translate([298,2,39]) cube([4,4,57]);
    translate([2,242,39]) cube([4,4,57]);
    translate([298,242,39]) cube([4,4,57]);
 }

/* corrugated metal section above cinderblocks */
if (1) {
    /* top corrugated metal walls */
    translate([3,3,39]) metalSide(height=40, length=300);
    translate([300,245,39]) rotate([0,0,180]) metalSide(height=40, length=300);
    translate([301,5,39]) rotate([0,0,90]) metalSide(height=40,length=244);
    translate([3,243,39]) rotate([0,0,-90]) metalSide(height=40,length=244);
 }

translate([5.9,2,78]) windowFrames(width=15.05*1.62, length=300);
translate([5.9,243,78]) windowFrames(width=15.05*1.62, length=300);

translate([2,242.5,78]) rotate([0,0,-90]) windowFrames(width=14.6*1.62, length=244);
translate([299,242.5,78]) rotate([0,0,-90]) windowFrames(width=14.6*1.62, length=244);


/******** SUPPORT MODULES ********/

/* windowFrames()
 */
module windowFrames(width = 15 * 1.62, length = 100, depth = 3)
{
    height = 15;

    for (i=[0 : floor(length/width) - 1]) {
	translate([i * width,0,0]) difference() {
	    cube([width, depth, height]);
	    translate([1.5,-0.05,1.5])
		cube([width-3, depth / 2 - 0.6, height-3]);
	    translate([1.5,depth/2+0.65,1.5])
		cube([width-3, depth / 2 - 0.6, height-3]);
	}
    }
}

/* metalSide() -- corrugated metal wall with a flat backside
 *
 * Note: taken from container.scad
 */
module metalSide(len = 7.2, height = 45, length = 90) {
    thickness = 1.5;
    pointOffset = 0.8;

    singlePanelLength = len;
    flatLen = len / 1.2;

    for (i = [ 0 : floor(length / singlePanelLength) - 1 ]) {
	translate([i * singlePanelLength, 0, 0])
	    linear_extrude(height = height) {
	    polygon(points = [[0,0],
			      [flatLen, 0],
			      [flatLen + 0.15, -1 * pointOffset],
			      [1.2*flatLen - 0.15, -1 * pointOffset],
			      [1.2*flatLen, 0],
			      [1.2*flatLen, thickness],
			      [0, thickness]],
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
