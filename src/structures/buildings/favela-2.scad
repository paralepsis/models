/* favela-2.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons 
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <building.scad>
use <stairs.scad>
use <roof.scad>

/*
translate([169,78,69]) rotate([0,0,180]) color("red")
import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");
*/

/* First Floor */
building(firstFloorDims,
	 firstFloorWindows,
	 firstFloorDoors,
	 doEars = 0);

/* Second Floor */
translate([0,0,65]) {
    secFloorBuilding(secondFloorDims,
		     secondFloorWindows,
		     secondFloorDoors,
		     doEars = 0);
}

/* Exterior Stairs */
translate([152.4,0,0,]) {
    easyStairs(stairsLen = 80,
	       extraTopLanding = 20,
	       stairsHt = 69,
	       stairsWidth = 35,
	       sidewallThick = 7);
}

/* Roof */
translate([-4,-4,65*2]) corRoof(xDim = 100+8, yDim = 100+8, angle=4);

/******** FIRST FLOOR PARAMETERS ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
firstFloorDims = [152.4, // xdim
		  100, // ydim
		  65, // height
		  7, // wall thickness
		  4, // floor/roof thickness
		  0]; // unused

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
firstFloorWindows = [[[0, 30, 0], [0,0,-90]],
		     [[0, 70, 0], [0,0,-90]],
		     [[90,93,0], [0,0,0]],
		     ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
firstFloorDoors = [[[40, 93, 0], [0,0,0], [1,0,0]],
		   [[123,0,0], [0,0,0], [1,0,0]]
		   ];

/******** SECOND FLOOR MODULE AND PARAMETERS ********/

/* secFloorBuilding() -- special constructor to generate second floor, 
 *                       taking into account stairs, etc.
 */
module secFloorBuilding(dims = [0,0,0,0,0], 
			windows = [], 
			doors = [], 
			doEars = 0)
{
    assign(xDim = dims[0],
	   yDim = dims[1], 
	   wallHeight = dims[2],
	   wallThick = dims[3], 
	   floorThick = dims[4],
	   earThick = 0.6,
	   notchFudge = 0.5)
	{
	    difference() {
		/* Main Structures */
		union() {
		    /* walls */
		    linear_extrude(height=wallHeight)
			buildingWalls(xDim = xDim, yDim = yDim);

		    /* patio walls (quick and dirty) */
		    cube([152.4,wallThick,20 + floorThick]);
		    translate([xDim,0,0]) cube([52.4,wallThick + notchFudge,20 + floorThick]);
		    translate([0,yDim - wallThick,0])
			cube([152.4,wallThick,20 + floorThick]);
		    translate([152.4 - wallThick, 0, 0]) 
			cube([wallThick, 60, 20 + floorThick]);

		    /* floor
		     * Note: xDim is wallThick longer than usual to strech 
		     *       to stairs.
		     */
		    translate([wallThick,wallThick + notchFudge,0])
			tiledFloor(roofXDim = 152.4 - 1 * wallThick,
				   roofYDim = 100 - 2 * wallThick - notchFudge,
				   thick = floorThick);

		    /* ears */
		    if (doEars) {
			translate([0,0,earThick/2])
			    cylinder(r=wallThick, h=earThick,center=true);
			translate([xDim,0,earThick/2])
			    cylinder(r=wallThick, h=earThick,center=true);
			translate([0,yDim,earThick/2])
			    cylinder(r=wallThick, h=earThick,center=true);
			translate([xDim,yDim,earThick/2])
			    cylinder(r=wallThick, h=earThick,center=true);
		    }
		}
		/* Subtract Back Wall (and little slice to right) */
		linear_extrude(height=wallHeight)
		    buildingBackWall(xDim = xDim, yDim = yDim, fudge=false);
		translate([xDim, 0,0.3])
		    cube([notchFudge, wallThick-3, wallHeight]);

		/* Subtract Windows */
		for (win = windows) {
		    translate(win[0]) rotate(win[1]) window(doWindow=true);
		}
		/* Subtract Doors */
		for (door = doors) {
		    translate(door[0]) rotate(door[1]) door(doDoor=true, doFrame = door[2][0]);
		}
	    } /* difference */

	    /* Add in back wall, subtract out doors and windows again */
	    difference() {
		linear_extrude(height=wallHeight)
		    buildingBackWall(xDim = xDim, yDim = yDim, fudge=true);

		/* Subtract Windows */
		for (win = windows) {
		    translate(win[0]) rotate(win[1]) window(doWindow=true);
		}
		/* Subtract Doors */
		for (door = doors) {
		    translate(door[0]) rotate(door[1]) door(doDoor=true, doFrame = door[2][0]);
		}
	    }

	    /* Add back in windows and door frames */
	    for (win = windows) {
		translate(win[0]) rotate(win[1]) window(doWindow=false);
	    }
	    for (door = doors) {
		translate(door[0]) rotate(door[1]) door(doDoor=false, doFrame = door[2][0]);
	    }

	} /* assign */
}

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness].
 */
secondFloorDims = [100, // xdim
		   100, // ydim
		   65, // height
		   7, // wall thickness
		   4, // floor/roof thickness
		   1]; // ears

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
secondFloorWindows = [[[0, 30, 0], [0,0,-90]],
		      [[0, 70, 0], [0,0,-90]],
		      [[30,93,0], [0,0,0]],
		      [[70,93,0], [0,0,0]]
		      ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
secondFloorDoors = [[[100,30,0], [0,0,90], [1,0,0]]
		    ];

/******** UNUSED OLD CODE ********/

/* Add some stairs! */
/*
  translate([152.4+40,3,0])rotate([0,0,180]) mirror([0,1,0])
  stairs(stairsLength=97,
  stairWidth=40, 
  stairsHeight=69,  // accounts for a 4 thickness floor on top
  stairLength = 19, 
  floorThick=4, 
  topLandingLength = 20, 
  bottomLandingLength = 0,
  sidewallHt = 20,
  doSidewall = true,
  doEndwall = true);
*/
/* Add ears to stair corners */
// translate([152.4+37,5,.15]) cylinder(r=9,h=0.3,center=true);
// translate([152.4+40,100,.15]) cylinder(r=7,h=0.3,center=true);

/*
 * Local variables:
 *  mode: C
 *  c-indent-level: 4
 *  c-basic-offset: 4
 * End:
 *
 * vim: ts=8 sts=4 sw=4 expandtab
 */
