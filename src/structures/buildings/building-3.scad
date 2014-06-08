/* building-3.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <building.scad>
use <damage.scad>
use <roof.scad>
use <stairs.scad>

myFloorThickness = 4;
myWallThickness = 7;
myHeight = 66;

translate([90,118,70]) rotate([0,0,180]) 
	color("red") import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

/* First Floor */
difference() {
    building(dims = f1Dims,
	     windows = f1Windows, 
	     doors = f1Doors,
	     doEars = false);
/*
    difference() {
	translate([124,34,-14]) rotate([0,-25,90]) scale([.8,1,1]) wallBreach();
	cube([300,200,8],center=true);
    }
*/
}

/*  Second Floor */
translate([0,0,myHeight]) {
    building(dims = f2Dims,
	     windows = f2Windows, 
	     doors = f2Doors,
	     doEars = false);
}

/* Custom patio for this building */
translate([0,100,myHeight]) {
    cube([127,40,myFloorThickness], center=false); // Floor
}
translate([0,100,myHeight+myFloorThickness]) {
    cube([myWallThickness, 40, 20], center=false);
}
translate([0,140 - myWallThickness, myHeight+myFloorThickness]) {
    cube([127, myWallThickness, 20], center=false);
}
translate([127-myWallThickness,100,myHeight+myFloorThickness]) {
    cube([myWallThickness, 40, 20], center=false);
}

/* Roof */
translate([-4, 0 - 4, 2 * myHeight]) {
    corRoof(xDim = 127 + 8, yDim = 100 + 8, angle = 4);
}

/* Stairs */
/*
translate([-1 * 35, 50, 0]) stairWell(swLen = 80,
	  swHeight = myHeight,
	  stairsWidth = 35,
	  floorThick = myFloorThickness,
	  sidewallThick = myWallThickness);
*/

/******** First Floor Parameters ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
f1Dims = [127, // xdim
	     100, // ydim
	     myHeight, // height
	     myWallThickness, // wall thickness
	     myFloorThickness, // floor/roof thickness
	     1]; // ears

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
f1Windows = [[[0, 30, 0], [0,0,-90]],
	     [[90,93,0], [0,0,0]],
	     ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
f1Doors = [[[40, 93, 0], [0,0,0], [1,0,0]],
          ];

/******** First Floor Parameters ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
f2Dims = [127, // xdim
	  100, // ydim
	  myHeight, // height
	  myWallThickness, // wall thickness
	  myFloorThickness, // floor/roof thickness
	  1]; // ears

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
f2Windows = [[[0, 30, 0], [0,0,-90]],
		    [[0, 70, 0], [0,0,-90]],
		    [[90,93,0], [0,0,0]],
		    [[127 - 7, 70, 0], [0,0,-90]],
		    [[127 - 7,30,0], [0,0,-90]],		   ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
f2Doors = [[[40, 93, 0], [0,0,0], [1,0,0]],
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
