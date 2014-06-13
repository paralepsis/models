/* favela-4.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <building.scad>
use <roof.scad>
use <holeCutout.scad>

myHeight = 65;

module wholeBuilding() {
    /* First Floor */
    difference() {
        building(dims = firstFloorDims,
        	 windows = firstFloorWindows,
        	 doors = firstFloorDoors,
        	 doEars = 0,
        	 doBackWall = 0);

        /* roughen floor edge */
        translate([-15,70,0]) rotate([0,0,-10]) floorRoughen();
    }
    
    
    /* Second Floor */
    translate([0,0,65]) difference() {
	secondFloor();
    	scale([1,1.05,1]) translate([18,92,2]) rotate([0,0,-15])
	    floorRoughen();
    }
    
    /* Roof */
    translate([0,0, 2 * myHeight]) difference() {
        translate([78, -4, 0]) corRoof(xDim = 80, yDim = 108, angle = 4);
    	translate([65,114,8]) rotate([0,0,-28]) floorRoughen();
    }
}
    
difference() {
    wholeBuilding();
    translate([-10,-140,55]) rotate([0,30,40]) color("red") cube([150,200, 190]);

    /* work over the floors */

    /* work over the front wall */
    translate([-15,40,-60]) rotate([0,-90,-99]) holeCutout();
    translate([-18,110,-5]) rotate([0,7,0]) scale([1,1,1.2]) rotate([0,-90,180]) holeCutout();
    // translate([20,95,56]) cube([10,10,10]); // cut off a little stray bit
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
		 doBackWall = 0);
}

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
secondFloorDims = [154, // xdim
	     100, // ydim
	     65, // height
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
	     65, // height
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
