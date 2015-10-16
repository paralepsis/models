/* ruined-wall.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */

/* set of heightmaps to use for deformation and base */
use <map-257x8-h100t8-h100-s100.scad> // h100t8()
use <map-257x8-t100h8-h100-s100.scad> // t100h8() 
use <map-257x8-t50h8-h100-s100.scad> // t50h8()
use <map-257x50-h100t50-h10-s8-m6.scad> // h100t50()
use <map-257x50-h200t50-h10-s8-m6.scad> // h200t50()

simpleWall = 0;
simpleBase = 0;

wall1();

module wall1() {
    if (simpleWall) {
	difference() {
	    cube([208, 7, 65]);
	}
    }
    else {
	difference() {
	    deformedWall();
	    translate([0,0.8,0]) newCbPatch() translate([206,0,-125])
		rotate([0,0,180]) t100h8();
	    translate([255,6.2,-5]) rotate([0,0,180]) newCbPatch()
		translate([0,-8,-40]) t50h8();
	}
    }

    if (simpleBase) {
	uniformBase();
    }
    else {
	texturedBase();
    }
}

module wall2() {
    if (simpleWall) {
	difference() {
	    cube([208, 7, 65]);
	    //translate([-15,0.8,0]) newCbPatch() translate([-50, -8, -144])
	    //h100t8();
	}
    }
    else {
	difference() {
	    deformedWall2();
	    translate([-15,0.8,0]) newCbPatch() translate([-50, -8, -144])
		h100t8();
	    translate([206,6.2,0]) rotate([0,0,180]) newCbPatch()
		translate([-72,-8,-115]) rotate([0,10,0]) t100h8();

	}
    }
    if (simpleBase) {
	translate([208,0,0]) mirror([1,0,0]) uniformBase();
    }
    else {
	translate([208,0,0]) mirror([1,0,0]) texturedBase2();
    }
}

/******** MODULES ********/

module deformedWall(wallLen = 208) {
    difference() {
	intersection() {
	    cube([wallLen, 7, 65]);
	    translate([-48,-0.5, -100]) h100t8();
	    // translate([-48,-0.5, -100]) t100h8();
	}
	translate([107,0,3])quickDoorOpening();
    }
}

module deformedWall2(wallLen = 208) {
    difference() {
	intersection() {
	    cube([wallLen, 7, 65]);
	    union() {
		translate([60,-0.5, -5]) t50h8();
		translate([-55,-0.5,-90]) h100t8();
	    }
	}
	translate([107,0,3])quickDoorOpening();
    }
}

module texturedBase() {
    intersection() {
	uniformBase(ht=10);
	translate([-10,-22,-9]) rotate([-4,0,0]) h100t50();
    }
}

module texturedBase2() {
    intersection() {
	uniformBase(ht=10);
	translate([-5,-22,-11.9]) rotate([0,-1,0]) h200t50();
    }
}

module uniformBase(ht=3, wallLen = 208) {
    difference() {
	hull() {
	    translate([15,0,0]) cylinder(h=ht, r=15);
	    translate([50,7,0]) cylinder(h=ht, r=15);
	    translate([12,7,0]) cylinder(h=ht, r=12);
	    translate([wallLen - 12,0,0]) cylinder(h=ht, r=12);
	    translate([wallLen - 50,0,0]) cylinder(h=ht, r=15);
	    translate([wallLen - 15,7,0]) cylinder(h=ht, r=15);
	}

	translate([80, -219, 0]) cylinder($fn=200, r=209,h=ht);
	translate([125, 219+7, 0]) cylinder($fn=200, r=209,h=ht);
    }
}

module quickDoorOpening() {
    translate([0,-0.25, 0]) cube([32, 7.5, 45]);
}

/******** CINDERBLOCK MODULES (COPIED FROM OTHER SOURCE OF MINE) ********/

module newCbPatch(adjust=0) {
    mortarRad = 0.3;

    intersection() {
	translate([adjust,0,0]) cinderblockPattern();
	translate([0,mortarRad, 0]) children(0);
    }
    children(0);
}

module cinderblockPattern() {
    mortarRad = 0.3;
    height = 65;
    width = 260;
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

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */
