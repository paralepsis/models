/* favela-4.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <building.scad>
use <roof.scad>
use <damage/holeCutout.scad>

myHeight = 65;

/******** MODULES FOR BUILDING PARTS/ALL OF THE BUILDING ********/

/* Whole Building */
wholeBuilding();
// marine();

/* First Floor Only */
// wholeBuilding(secondFloor = 0, roof = 0);

/* Second Floor Only */
// translate([0,0,-1 * myHeight]) wholeBuilding(firstFloor = 0, roof = 0);

/* Roof Only */
// translate([-78 ,-104,-2 * myHeight]) wholeBuilding(firstFloor = 0, secondFloor = 0);

/******** QUICK MARINE FOR TESTING/SIZING ********/
module marine() {
    translate([99,80,69]) rotate([0,0,180])
        color("red") import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");
}

/******** MODULES TO BUILD THE COMPLETE BUILDING ********/

module wholeBuilding(firstFloor = 1, secondFloor = 1, roof = 1) {
    difference() {
	almostWholeBuilding(firstFloor = firstFloor,
			    secondFloor = secondFloor,
			    roof = roof);
	translate([-10,-140,55]) rotate([0,30,40]) color("red") cube([150,200, 190]);

	/* work over the front wall */
	translate([-15,40,-60]) rotate([0,-90,-99]) holeCutout();
	translate([-18,110,-5]) rotate([0,7,0]) scale([1,1,1.2]) rotate([0,-90,180]) holeCutout();
    }
}

module almostWholeBuilding(firstFloor = 1, secondFloor = 1, roof = 1) {
    /* First Floor */
    if (firstFloor) {
	difference() {
	    building(dims = firstFloorDims,
		     windows = firstFloorWindows,
		     doors = firstFloorDoors,
		     doEars = 0,
		     doBackWall = 0,
		     doRemovableBackWall = 0);

	    /* roughen floor edge */
	    translate([-15,70,0]) rotate([0,0,-10]) floorRoughen();
	}
    }
    
    /* Second Floor */
    if (secondFloor) {
	translate([0,0,myHeight]) difference() {
	    secondFloor();
	    scale([1,1.05,1]) translate([18,92,2]) rotate([0,0,-15])
		floorRoughen();
	}
    }
    
    /* Roof */
    if (roof) {
	translate([0,0, 2 * myHeight]) difference() {
	    translate([78, -4, 0]) corRoof(xDim = 80, yDim = 108, angle = 4);
	    translate([65,114,8]) rotate([0,0,-28]) floorRoughen();
	}
    }
}

module floorRoughen() {
    translate([0,0,10]) rotate([0,0,-55]) rotate([-90,0,0]) holeCutout();
}

/******** SECOND FLOOR MODULES AND DIMENSIONS ********/

module secondFloor() {
	building(dims = secondFloorDims,
		 windows = secondFloorWindows,
		 doors = secondFloorDoors,
   		 doEars = 0,
		 doBackWall = 0,
		 doRemovableBackWall = 0);
}

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
secondFloorDims = [154, // xdim
	     100, // ydim
	     myHeight, // height
	     7, // wall thickness
	     4, // floor/roof thickness
	     0]; // ears

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
secondFloorWindows = [[[154, 30, 0], [0,0,90]],
		    [[154, 70, 0], [0,0,90]],
		    [[40,93,0], [0,0,0]],
		    [[110,93,0], [0,0,0]],
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
secondFloorDoors = [ ];

/******** FIRST FLOOR DIMENSIONS ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
firstFloorDims = [154, // xdim
	     100, // ydim
	     myHeight, // height
	     7, // wall thickness
	     4, // floor/roof thickness
	     0]; // ears

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
firstFloorWindows = [[[110,93,0], [0,0,0]]];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
firstFloorDoors = [[[40, 93, 0], [0,0,0], [1,0,0]],
	   	  [[154, 50, 0], [0,0,90], [1,0,0]],
          ];

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */
