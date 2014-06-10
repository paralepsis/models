/* gas-station.scad
 *
 * Copyright (C) Robert B. Ross, 2014
 *
 * This software is released under the Creative Commons
 * Attribution-ShareAlike 4.0 International Public License.
 */

use <building.scad>

xDim = 150;
yDim = 120;
cutPos = 85;
myWallThick = 7;
myWallHt = 70;
myFloorThick = 4;
notchFudge = 0.5;

// Note: sort of a hack on this position because I was too lazy
//       to work out the trigonometry.
// insidePtOffset = myWallThick / tan(45);
insidePtOffset = 3.5;

/* Overlay rough build volume for reference */
// % translate([270,70,155/2]) cube(size=[240, 153, 155], center=true);

// translate([200,70,4]) import("/Users/rross/Downloads/VAZ-21213.STL");
translate([50, 190, 0]) rotate([0,0,180]) color("red") import("/Users/rross/projects/3dprint/marine/marine-on-base.stl");

completeGasStation();

/******** MAJOR COMPONENT MODULES ********/

module completeGasStation() {
    mainBuilding();
    translate([0,0,myWallHt]) mainBuildingRoof();

    translate([xDim,0,0]) garage(xDim = xDim, yDim = yDim + 10);
    translate([xDim,0,myWallHt]) garageRoof(xDim = xDim, yDim = yDim + 10);
    translate([0,yDim + 100, 0]) island();
}

module garage(xDim, yDim) {
    difference() {
	building(dims = garageDims,
		 windows = garageWindows,
		 doors = garageDoors,
		 doEars = false, tiledFloor = false);
	translate([20, yDim - myWallThick, myFloorThick])
	    cube([110,8,50]);
    }
}

module garageRoof(xDim, yDim) {
    difference() {
	cube([xDim, yDim, myFloorThick + 10]);
	translate([myWallThick, myWallThick, myFloorThick])
	    cube([xDim - 2 * myWallThick, yDim - 2 * myWallThick, 20]);
    }
}

module island() {
    hull() {
	translate([80,0,0]) cylinder(h=5, r=15);
	cylinder(h=5, r=15);
    }
    translate([5,-7.5,0]) pump();
    translate([50,-7.5,0]) pump();

    translate([82,0,0]) cylinder(h=15,r=3);
    translate([-2,0,0]) cylinder(h=15,r=3);
}

module pump() {
    translate([2.5,2.5,5]) cube([20, 10, 15]); // base
    translate([0,0,35]) cube([25, 15, 4]); // top
    translate([2.5,2.5,5]) cube([4,10,30]); // left side
    translate([18.5,2.5,5]) cube([4,10,30]); // right side
}

module mainBuildingRoof() {
    /* simple roof with plain roof surface */
    difference() {
	stationExterior(height = 24);
	translate([0,0,4]) stationInterior(height = 24);
    }
}

module mainBuilding() {
    difference() {
	stationExterior(height = myWallHt);
	stationInterior(height = myWallHt);

	/* door */
	translate([110, 120 - myWallThick, 0]) door(doDoor = true, doFrame = false);
	translate([150, 30, 0]) rotate([0,0,90]) door(doDoor = true, doFrame = false);

	/* big windows in the front */
	translate([40, 120 - 8, 10]) cube([40, 8, 50], center = false);
	translate([7.5, 40, 10]) rotate([0,0,90]) cube([40, 8, 50], center = false);
	translate([0, 80, 10]) rotate([0,0,45]) translate([8, -4, 0])
	    cube([40, 8, 50], center = false);

	/* back wall */
	linear_extrude(height=myWallHt)
	    buildingBackWall(xDim = xDim, yDim = yDim, fudge=false);

    } /* difference */

    /* add in floor */
    intersection() {
	stationExterior(height = myWallHt);
	translate([myWallThick, myWallThick + notchFudge,0])
	    tiledFloor(roofXDim = xDim - 2 * myWallThick,
		       roofYDim = yDim - 2 * myWallThick - notchFudge,
		       thick = myFloorThick);
    }

    /* add back in back wall (no doors in it to redo, in this case) */
    linear_extrude(height=myWallHt)
	buildingBackWall(xDim = xDim, yDim = yDim, fudge=true);

}

/******** MAIN BUILDING MAJOR STRUCTURE MODULES ********/

module stationExterior(height = 0) {
    linear_extrude(height = height) {
	polygon(points = [[0,0], [xDim, 0], [xDim, yDim],
			  [xDim - cutPos - 30, yDim],
			  [0, cutPos]],
		paths = [[0,1,2,3,4]]);
    }
}

/* stationInterior() 
 *
 * Note: Extrudes slightly higher (0.1mm) than necessary to make for
 * somewhat cleaner difference() without render.
 */
module stationInterior(height = 0) {
    linear_extrude(height = height + 0.1) {
	polygon(points = [[myWallThick, myWallThick],
			  [xDim - myWallThick, myWallThick],
			  [xDim - myWallThick, yDim - myWallThick],
			  [xDim - cutPos - 30 + insidePtOffset, yDim - myWallThick],
			  [myWallThick, cutPos - insidePtOffset]],
		paths = [[0,1,2,3,4]]);
    }
}

/******** GARAGE PARAMETERS ********/

/* Dims is a vector holding dimensions of the building 
 * [X, Y, height, wall thickness, floor/roof thickness, do ears].
 */
garageDims = [150, // xdim
	      yDim + 10, // ydim
	      myWallHt, // height
	      myWallThick, // wall thickness
	      myFloorThick, // floor/roof thickness
	      0]; // unused

/* Windows is a 3D array holding translate : rotate pairs, one per window.
 * 
 */
garageWindows = [[[150 - myWallThick, 42, 0], [0,0,-90]],
		 [[150 - myWallThick, 88, 0], [0,0,-90]]
		 ];

/* Doors is a 3D array holding translate : rotate : boolean tuples, one per
 * door.
 * Booleans are [ doFrame, unused, unused ].
 */
garageDoors = [[[0, 30, 0], [0,0,-90], [0,0,0]],
	       [[40,0,0], [0,0,0], [0,0,0]],
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
