/* building-1.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <building.scad>
use <roof.scad>
use <stairs.scad>
use <ceiling-shim.scad>

myWallThickness = 7;
myFloorThickness = 4;

color("grey")  wholeBuilding();

/* Patio Shim */
// ceilingShim(xDim=100,yDim=100);

/* Upper Room and Roof Shim */
// ceilingShim(xDim=100,yDim=127);

// justSecondFloor(doEars=false,doRoom=false,doPatio=true);
// rotate([0,-90,0]) translate([35+7,0,0]) justStairs();
// rotate([-94,0,0]) translate([0,-108,0]) justRoof();


/******** MODULE FOR CONSTRUCTING COMPLETE MODEL ********/

module wholeBuilding() {
    justFirstFloor();
    translate([0,0,65]) justSecondFloor();
    translate([100,0,0]) rotate([0,0,90]) justStairs();
    translate([108 + 100 - 4, 0 - 4, 2 * 65]) justRoof();
}

/******** INDIVIDUAL COMPONENT BUILD MODULES ********/

/* NOTES:
 * - These components should all sit on the XY plane as-is, to facilitate
 *   printing of individual components.
 * - The roof will need to be rotated and perhaps given some supports to
 * - keep it attached to the build plate during extended print.
 */

module justFirstFloor(doEars = false) {
    /* First Floor Room A */
    building(dims = firstFloorADims,
	     windows = firstFloorAWindows,
	     doors = firstFloorADoors,
	     doEars = doEars);

    /* First Floor Room B */
    translate([100,0,0])
	building(dims = firstFloorBDims,
		 windows = firstFloorBWindows,
		 doors = firstFloorBDoors,
		 doEars = doEars);
}

/* justSecondFloor()
 *
 * NOTES:
 * - Needs ears for patio.
 */
module justSecondFloor(doEars = false, doRoom = true, doPatio = true) {
    /* Second floor room A */
    if (doRoom) {
        translate([100,0,0])
	    building(dims = secFloorADims,
		     windows = secFloorAWindows,
		     doors = secFloorADoors,
		     doEars = doEars);
    }

    /* Custom second floor patio for this building */
    if (doPatio) {
        difference() {
	    union() {
	        cube([100,100,myFloorThickness], center=false); // Floor

	        translate([0,0,myFloorThickness]) {
		    cube([myWallThickness, 100, 20], center=false);
	        }
	        translate([0,100 - myWallThickness, myFloorThickness]) {
		    cube([100, myWallThickness, 20], center=false);
	        }
	        translate([39.5,0,myFloorThickness]) {
		    cube([60.5, myWallThickness, 20], center=false);
	        }
	    }
	    /* remove the little bit next to the removable wall */
	    translate([100 - 0.5, 0, 0])
	        cube([0.5, myWallThickness-3, 20 + myFloorThickness],
		     center=false);
        }
    }
}

module justStairs(doEars = false) {
    mirror([1,0,0]) easyStairs(stairsLen = 80,
			       extraTopLanding = 20,
			       stairsHt = 69,
			       stairsWidth = 35,
			       sidewallThick = myWallThickness);
}

module justRoof(doEars = false) {
    earThick = 0.6;

    rotate([0,0,90]) corRoof(xDim = 127 + 8, yDim = 100 + 8, angle = 4);    

    if (doEars) {
	translate([0,0,earThick/2])
	    cylinder(r=8, h=earThick,center=true);
	translate([127+8,0,earThick/2])
	    cylinder(r=8, h=earThick,center=true);
	translate([0,100+8,earThick/2])
	    cylinder(r=8, h=earThick,center=true);
	translate([127+8,100+8,earThick/2])
	    cylinder(r=8, h=earThick,center=true);
    }
}

/******** FIRST FLOOR ROOM A ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
firstFloorADims = [100, // xdim
	     100, // ydim
	     65, // height
	     myWallThickness, // wall thickness
	     myFloorThickness, // floor/roof thickness
	     0]; // not currently used

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
firstFloorAWindows = [[[0, 30, 0], [0,0,-90]],
		    [[0, 70, 0], [0,0,-90]],
		    [[70,93,0], [0,0,0]],
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
firstFloorADoors = [[[30, 93, 0], [0,0,0], [1,0,0]],
	   	  [[93, 50, 0], [0,0,-90], [0,0,0]],
          ];

/******** FIRST FLOOR ROOM B ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
firstFloorBDims = [100, // xdim
	     127, // ydim
	     65, // height
	     myWallThickness, // wall thickness
	     myFloorThickness, // floor/roof thickness
	     0]; // not currently used

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
firstFloorBWindows = [[[93, 42, 0], [0,0,-90]],
		    [[93, 88, 0], [0,0,-90]],
		    [[50,120,0], [0,0,0]],
		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
firstFloorBDoors = [[[0, 50, 0], [0,0,-90], [0,0,0]],
		  [[40,0,0], [0,0,0], [1,0,0]],
          ];

/******** SECOND FLOOR ROOM A ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
secFloorADims = [100, // xdim
		 127, // ydim
		 65, // height
		 myWallThickness, // wall thickness
		 myFloorThickness, // floor/roof thickness
		 0]; // not currently used

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
secFloorAWindows = [[[93, 42, 0], [0,0,-90]],
		    [[93, 88, 0], [0,0,-90]],
		    [[50,120,0], [0,0,0]],
		    ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
secFloorADoors = [[[0, 30, 0], [0,0,-90], [1,0,0]]
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


